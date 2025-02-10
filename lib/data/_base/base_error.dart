// Import các thư viện cần thiết
import 'package:credit_hub_app/data/_base/base_barrel.dart';
import 'package:dio/dio.dart'; // Thư viện Dio để thực hiện các yêu cầu HTTP.

// Lớp `BaseError` triển khai giao diện `Exception` để đại diện cho lỗi cơ bản.
class BaseError implements Exception {
  ErrorResponse? resError; // Đối tượng lỗi từ phản hồi API.
  DioException? dioError; // Đối tượng lỗi từ Dio.
  /// Đối tượng lỗi/exception gốc.
  dynamic error;

  // Constructor để khởi tạo đối tượng BaseError.
  BaseError({this.resError, this.dioError, this.error});

  // Getter để lấy thông điệp lỗi.
  String get message {
    String msg = ''; // Biến lưu thông điệp lỗi.

    // Nếu có lỗi từ phản hồi API (`resError`).
    if (resError != null) {
      final message = resError?.message ?? ''; // Lấy thông điệp lỗi từ `resError`.
      if (message.isNotEmpty) {
        msg = message; // Gán thông điệp nếu không rỗng.
      }
      final error = resError?.error ?? ''; // Lấy thông tin lỗi bổ sung từ `resError`.
      if (msg.isEmpty && error.isNotEmpty) {
        msg = error; // Gán thông tin lỗi bổ sung nếu thông điệp chính rỗng.
      }
    } 
    // Nếu có lỗi từ Dio (`dioError`).
    else if (dioError != null) {
      msg = dioError.toString(); // Chuyển đổi `dioError` thành chuỗi.
    } 
    // Nếu có lỗi gốc (`error`).
    else if (error != null) {
      msg = error.toString(); // Chuyển đổi `error` thành chuỗi.
    }

    // Trả về thông điệp lỗi. Nếu rỗng, trả về thông điệp mặc định.
    return msg.isEmpty ? 'Lỗi xử lý từ server' : msg;
  }

  // Ghi đè phương thức `toString` để cung cấp thông điệp lỗi dưới dạng chuỗi.
  @override
  String toString() {
    var msg = message; // Lấy thông điệp lỗi từ getter `message`.

    // Nếu lỗi gốc là một đối tượng `Error`, giữ nguyên thông điệp.
    if (error is Error) {
      msg = message;
    }

    return msg; // Trả về thông điệp lỗi.
  }
}