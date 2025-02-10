// Import các thư viện cần thiết
import 'dart:io'; // Cung cấp các hằng số HTTP như `HttpStatus`.
import 'package:dio/dio.dart'; // Thư viện Dio để thực hiện các yêu cầu HTTP.
import 'api_exception.dart'; // Định nghĩa lớp ApiException để xử lý lỗi.

// Hàm `handleError` để xử lý lỗi chung.
Exception handleError(String error) {
  return ApiException(message: error); // Trả về một ngoại lệ với thông điệp lỗi.
}

// Hàm `handleDioError` để xử lý lỗi từ DioException.
Exception handleDioError(DioException dioError) {
  int statusCode = dioError.response?.statusCode ?? -1; // Lấy mã trạng thái HTTP từ phản hồi.
  int? status; // Mã trạng thái từ server (nếu có).
  String? serverMessage; // Thông điệp lỗi từ server (nếu có).

  try {
    // Thử lấy thông tin từ phản hồi của server.
    status = dioError.response?.data['status']; // Mã trạng thái từ dữ liệu phản hồi.
    serverMessage = dioError.response?.data['title']; // Thông điệp lỗi từ dữ liệu phản hồi.
  } catch (e, _) {
    // Nếu có lỗi khi truy cập dữ liệu phản hồi, sử dụng thông điệp mặc định.
    serverMessage = 'Something went wrong. Please try again later.';
  }

  // Xử lý lỗi dựa trên mã trạng thái HTTP.
  switch (statusCode) {
    case HttpStatus.badRequest: // 400
      return ApiException(
        httpCode: statusCode,
        status: status?.toString(),
        message: 'Bad Request', // Thông điệp lỗi cho mã 400.
      );
    case HttpStatus.unauthorized: // 401
      return ApiException(
        httpCode: statusCode,
        status: status?.toString(),
        message: 'Unauthorized. Please check your credentials.', // Thông điệp lỗi cho mã 401.
      );
    case HttpStatus.notFound: // 404
      return ApiException(
        httpCode: statusCode,
        status: status?.toString(),
        message: 'Resource not found.', // Thông điệp lỗi cho mã 404.
      );
    case HttpStatus.internalServerError: // 500
      return ApiException(
        httpCode: statusCode,
        status: status?.toString(),
        message: 'Internal Server Error. Please try again later.', // Thông điệp lỗi cho mã 500.
      );
    case HttpStatus.serviceUnavailable: // 503
      return ApiException(
        message: 'Service Temporarily Unavailable', // Thông điệp lỗi cho mã 503.
      );
    default:
      // Xử lý các mã trạng thái khác không được liệt kê.
      return ApiException(
        httpCode: statusCode,
        status: status.toString(),
        message: serverMessage ?? '', // Sử dụng thông điệp từ server hoặc chuỗi rỗng.
      );
  }
}