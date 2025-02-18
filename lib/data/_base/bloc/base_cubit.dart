// ANCHOR: Import các thư viện cần thiết
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart'; // LINK: Hỗ trợ quản lý trạng thái với BLoC/Cubit

// ANCHOR: Lớp `BaseCubit` là một lớp trừu tượng (abstract class) dùng để xử lý trạng thái cơ bản của ứng dụng
abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  
  // SECTION: Constructor khởi tạo trạng thái ban đầu
  BaseCubit(S initialState) : super(initialState);

  // ANCHOR: Phương thức `handleState` để xử lý các trạng thái khi gọi API
  Future<void> handleState<T, P>({
    Future<T> Function()? apiCallNoParam, // NOTE: Gọi API không có tham số
    Future<T> Function(P param)? apiCallParam, // NOTE: Gọi API với một tham số
    Future<T> Function([P params])? apiCallParams, // NOTE: Gọi API với tham số tùy chọn
    P? param, // NOTE: Tham số truyền vào API
    required void Function(dynamic response) onSuccess, // LINK: Callback khi API gọi thành công
    String? Function(dynamic error)? errorMessageExtractor, // LINK: Hàm trích xuất thông báo lỗi từ exception
  }) async {
    try {
      // SECTION: Cập nhật trạng thái thành "loading"
      emit(state.copyWith(status: BaseStatus.loading) as S);
      
      dynamic response; // NOTE: Biến lưu kết quả trả về từ API

      // SECTION: Kiểm tra loại tham số và gọi API tương ứng
      if (param is List? && (param?.isNotEmpty ?? false)) {
        // WARNING: Nếu tham số là danh sách và không rỗng, gọi API với tham số tùy chọn
        assert(apiCallParams != null); // ERROR: Đảm bảo rằng `apiCallParams` được cung cấp
        response = await apiCallParams!(param!);
      } else if (param != null) {
        // NOTE: Nếu có tham số, gọi API với một tham số
        assert(apiCallParam != null); // ERROR: Đảm bảo rằng `apiCallParam` được cung cấp
        response = await apiCallParam!(param);
      } else {
        // NOTE: Nếu không có tham số, gọi API không có tham số
        assert(apiCallNoParam != null); // ERROR: Đảm bảo rằng `apiCallNoParam` được cung cấp
        response = await apiCallNoParam!();
      }

      // SECTION: Xử lý kết quả thành công
      onSuccess(response); // LINK: Gọi callback `onSuccess`

      // SECTION: Cập nhật trạng thái thành "success"
      emit(state.copyWith(status: BaseStatus.success) as S);
    } catch (e) {
      // ERROR: Xử lý lỗi
      final errorMessage = errorMessageExtractor?.call(e) ?? e.toString(); // NOTE: Trích xuất thông báo lỗi nếu có

      // SECTION: Cập nhật trạng thái thành "failure" với thông điệp lỗi
      emit(state.copyWith(
        status: BaseStatus.failure,
        message: errorMessage, // DEBUG: Log lỗi để dễ theo dõi
      ) as S);
    }
  }
}
