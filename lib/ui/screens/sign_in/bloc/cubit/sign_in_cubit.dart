// Import các thư viện cần thiết
import 'package:credit_hub_app/core/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Hỗ trợ quản lý trạng thái với BLoC/Cubit.
// import 'package:valuation/src/data/model/model_barrel.dart'; // Các model dữ liệu như SignInParam, Token.
// import 'package:valuation/src/data/repository/auth/auth_repository.dart'; // Repository để gọi API đăng nhập.
// import 'package:valuation/src/shared/app_manager.dart'; // Quản lý trạng thái ứng dụng (token, user info).

import '../../../../../core/config/app_config.dart';
import '../../../../../data/model/auth/sign_in/sign_in.dart';
import '../../../../../data/repository/sign_in/sign_in_rep.dart';
import '../../../../../shared/app_manager.dart';
import 'sign_in_state.dart'; // Định nghĩa trạng thái đăng nhập.

// Tạo logger cho SignInCubit
final logger = getLogger("SignInCubit");

// Lớp SignInCubit quản lý trạng thái đăng nhập.
class SignInCubit extends Cubit<SignInState> {
  final AuthRepo repo; // Repository để gọi API.
  final AppManager appManager; // Quản lý trạng thái ứng dụng.

  // Constructor khởi tạo SignInCubit với repository và app manager.
  SignInCubit(this.repo, this.appManager) : super(const SignInState());

  // Phương thức đăng nhập bằng tài khoản và mật khẩu.
  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    try {
      // Cập nhật trạng thái thành "loading".
      emit(state.copyWith(status: SignInStatus.loading));

      // Tạo đối tượng SignInParam với thông tin đăng nhập và device ID.
      AuthModel signInParam = AuthModel(
        username: username,
        password: password,
        device_id: await AppConfig.getDeviceId(), // Lấy device ID từ cấu hình ứng dụng.
      );

      // Gọi API đăng nhập thông qua repository.
      final response = await repo.signIn(param: signInParam);

      // Kiểm tra nếu phản hồi không có dữ liệu.
      if (response.data == null) {
        emit(state.copyWith(
          status: SignInStatus.failure,
          message: 'Sign-in response data is null.',
        ));
        return;
      }

      // Ghi log phản hồi từ server.
      logger.d('response, ${response.data.toString()}');

      // Lưu token và thông tin người dùng vào AppManager.
      await appManager.saveToken(token: response.data!.token);
      // await appManager.saveUserInfo(user: response.data!);
      await appManager.saveSignedInStatus(signedInStatus: true);

      // Cập nhật trạng thái thành "success" với dữ liệu phản hồi.
      emit(state.copyWith(status: SignInStatus.success, data: response.data!));
    } catch (e) {
      // Xử lý lỗi và cập nhật trạng thái thành "failure".
      emit(state.copyWith(status: SignInStatus.failure, message: e.toString()));
    }
  }

  // Phương thức đăng nhập bằng sinh trắc học.
  Future<void> signInBiometric() async {
    try {
      // Chức năng này hiện chưa được triển khai.
      // emit(state.copyWith(status: SignInStatus.loading));
      // final Token? token = await appManager.getToken();
      // String refresh_token = token?.refresh_token ?? '';
      // final response = await repo.refreshToken(refresh_token);
      // await appManager.saveToken(token: response);
      // await appManager.saveSignedInStatus(signedInStatus: true);
      // emit(state.copyWith(status: SignInStatus.success));
    } catch (e) {
      // Xử lý lỗi và cập nhật trạng thái thành "failure".
      emit(state.copyWith(status: SignInStatus.failure, message: e.toString()));
    }
  }
}