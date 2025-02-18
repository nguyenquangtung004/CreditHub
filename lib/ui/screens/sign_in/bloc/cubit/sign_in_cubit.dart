// ANCHOR: Import các thư viện cần thiết
import 'package:credit_hub_app/ui/screens/sign_in/sign_in_barrel.dart';
import 'sign_in_state.dart'; // Định nghĩa trạng thái đăng nhập.

// ANCHOR: Tạo logger cho SignInCubit
final logger = getLogger("SignInCubit");

// ANCHOR: Lớp SignInCubit quản lý trạng thái đăng nhập.
class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo; // Repository để gọi API.
  final AppManager appManager; // Quản lý trạng thái ứng dụng.

  // SECTION: Constructor khởi tạo SignInCubit với repository và app manager.
  SignInCubit(this.authRepo, this.appManager) : super(const SignInState());

  // ANCHOR: Phương thức đăng nhập bằng tài khoản và mật khẩu.
  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    try {
      emit(state.copyWith(status: SignInStatus.loading));
      logger.d("Step 1: Đang thực hiện đăng nhập...");

      // STEP 2: Tạo đối tượng SignInParam với thông tin đăng nhập.
      AuthModel signInParam = AuthModel(
        username: username,
        password: password,
        device_id: await AppConfig.getDeviceId(), // Lấy device ID từ cấu hình ứng dụng.
      );

      // STEP 3: Gọi API đăng nhập thông qua repository.
      final response = await authRepo.signIn(param: signInParam);

      // STEP 4: Kiểm tra nếu phản hồi không có dữ liệu.
      if (response.data == null || response.data!.token.isEmpty) {
        logger.e("❌ Đăng nhập thất bại: Phản hồi từ server không hợp lệ.");
        emit(state.copyWith(
          status: SignInStatus.failure,
          message: 'Dữ liệu phản hồi không hợp lệ.',
        ));
        return;
      }

      // STEP 5: Lưu token và thông tin người dùng vào AppManager.
      await appManager.saveToken(response.data!.token);
      await appManager.saveSignedInStatus(true);
     await appManager.saveUserInfo(response.data!);
      // DEBUG: Log thông tin đăng nhập thành công.
      logger.i("✅ Đăng nhập thành công! Token: ${response.data!.token}");

      // STEP 6: Cập nhật trạng thái thành "success".
      emit(state.copyWith(status: SignInStatus.success, data: response.data!));
    } catch (e) {
      logger.e("🚨 Lỗi đăng nhập: $e");

      // STEP 7: Xử lý lỗi và cập nhật trạng thái thành "failure".
      emit(state.copyWith(status: SignInStatus.failure, message: e.toString()));
    }
  }

  
}
