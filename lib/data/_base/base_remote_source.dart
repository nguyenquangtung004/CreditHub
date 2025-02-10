// Import các thư viện cần thiết
import 'package:dio/dio.dart'; // Thư viện Dio để thực hiện các yêu cầu HTTP.
import 'package:retrofit/retrofit.dart'; // Thư viện Retrofit để tạo API client dễ dàng hơn.
import 'base_error_handling.dart'; // Chứa các hàm xử lý lỗi.
import 'base_exception.dart'; // Chứa các lớp ngoại lệ cơ bản.

// Lớp BaseRemoteSource là một lớp trừu tượng (abstract class) cung cấp phương thức chung để xử lý lỗi khi gọi API.
abstract class BaseRemoteSource {
  // Phương thức `callApiWithErrorParser` được sử dụng để gọi API và xử lý lỗi.
  Future<HttpResponse<T>> callApiWithErrorParser<T>(
      Future<HttpResponse<T>> api) async {
    try {
      // Gọi API và chờ phản hồi.
      final HttpResponse<T> response = await api;
      return response; // Trả về phản hồi nếu không có lỗi.
    } on DioException catch (dioError) {
      // Xử lý lỗi từ DioException bằng cách gọi hàm `handleDioError`.
      final Exception exception = handleDioError(dioError);
      throw exception; // Ném lại ngoại lệ đã xử lý.
    } catch (error) {
      // Kiểm tra xem lỗi có phải là một instance của BaseException hay không.
      if (error is BaseException) {
        rethrow; // Nếu là BaseException, ném lại lỗi nguyên trạng.
      }
      // Nếu không phải BaseException, xử lý lỗi bằng hàm `handleError`.
      throw handleError('$error');
    }
  }
}