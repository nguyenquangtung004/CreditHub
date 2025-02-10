// Import các thư viện cần thiết
import 'dart:developer'; // Thư viện cung cấp công cụ ghi log.
import 'dart:io'; // Thư viện hỗ trợ xử lý HTTP và proxy.
import 'package:dio/dio.dart'; // Package Dio để thực hiện các yêu cầu HTTP.
import 'package:dio/io.dart'; // Hỗ trợ adapter cho Dio trên nền tảng IO.
import 'package:flutter/foundation.dart'; // Cung cấp các công cụ phát triển Flutter.
import 'package:get/get.dart' as g; // GetX để quản lý trạng thái và điều hướng.
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/config/app_config.dart';
import '../../shared/app_manager.dart'; // Ghi log đẹp mắt cho Dio.

// Lớp NetworkManager quản lý các yêu cầu mạng sử dụng Dio.
class NetworkManager {
  final String proxy = AppConfig.proxy; // Proxy từ AppConfig để debug.

  // Cấu hình cơ bản cho Dio.
  BaseOptions opts = BaseOptions(
    baseUrl: AppConfig.url, // Địa chỉ máy chủ từ AppConfig.
    contentType: 'application/json', // Định dạng dữ liệu JSON.
    connectTimeout: const Duration(seconds: 30), // Thời gian kết nối tối đa.
    receiveTimeout: const Duration(seconds: 30), // Thời gian nhận phản hồi tối đa.
  );

  // Cấu hình cơ bản cho Google Maps API.
  // BaseOptions optsGoogleMap = BaseOptions(
  //   baseUrl: '', // Địa chỉ máy chủ trống (cần được điền sau).
  //   contentType: 'application/json',
  //   connectTimeout: const Duration(seconds: 30),
  //   receiveTimeout: const Duration(seconds: 30),
  // );

  // Tạo một instance của Dio với cấu hình mặc định.
  Dio createDio() {
    return createDioWith(opts);
  }

  // Tạo một instance của Dio dành riêng cho Google Maps.
  // Dio createDioGoogleMaps() {
  //   return Dio(optsGoogleMap);
  // }

  // Tạo một instance của Dio với cấu hình tùy chỉnh.
  Dio createDioWith(BaseOptions opts) {
    final dio = Dio(opts);

    // Thêm proxy nếu đang ở chế độ debug và proxy không rỗng.
    if (kDebugMode) {
      if (proxy.isEmpty) {
        return dio;
      }
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.findProxy = (uri) {
            // Proxy tất cả các yêu cầu đến địa chỉ proxy đã cấu hình.
            return 'PROXY $proxy';
          };
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true; // Bỏ qua lỗi chứng chỉ SSL.
          return client;
        },
      );
    }
    return dio;
  }
}

// Extension để thêm interceptor vào Dio.
extension AppAppDioExtension on Dio {
  // Thêm các interceptor vào Dio.
  Dio addInterceptors() {
    return this
      ..interceptors.add(PrettyDioLogger(
        requestBody: true, // Log request body.
        requestHeader: true, // Log request header.
      ))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: requestInterceptor, // Xử lý trước khi gửi request.
        onResponse: responseInterceptor, // Xử lý khi nhận response.
        onError: errorInterceptor, // Xử lý khi có lỗi.
      ));
  }

  // Interceptor để xử lý trước khi gửi request.
  Future requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await g.Get.find<AppManager>().getToken(); // Lấy token từ AppManager.
      if (token != null) {
        options.headers.addAll({'access-token': token}); // Thêm token vào header.
        log('access_token:  ${token}'); // Ghi log token.
      }
      return handler.next(options); // Tiếp tục xử lý request.
    } catch (e) {
      return handler.next(options); // Nếu có lỗi, tiếp tục xử lý request.
    }
  }

  // Interceptor để xử lý khi nhận response.
  Future responseInterceptor(
      Response response, ResponseInterceptorHandler handler) async {
    try {
      log('token: Bearer ${response.data?['message']}'); // Ghi log token từ response.
      return handler.next(response); // Tiếp tục xử lý response.
    } catch (e) {
      return handler.next(response); // Nếu có lỗi, tiếp tục xử lý response.
    }
  }

  // Interceptor để xử lý khi có lỗi.
  Future<void> errorInterceptor(
      DioException error, ErrorInterceptorHandler handler) async {
    try {
      final isSignIn = await g.Get.find<AppManager>().getSignedInStatus(); // Kiểm tra trạng thái đăng nhập.
      if (error.response?.statusCode == 401 && isSignIn) {
        await _refreshToken(); // Refresh token nếu mã lỗi là 401 và người dùng đã đăng nhập.
        // Lấy lại token mới và gắn vào header.
        final newAccessToken = _getAccessToken();
        error.requestOptions.headers['Authorization'] =
            'Bearer $newAccessToken';
        // Gửi lại request cũ với token mới.
        final newRequest = await fetch(error.requestOptions);
        return handler.resolve(newRequest); // Giải quyết lỗi bằng request mới.
      } else {
        handler.next(error); // Nếu không phải lỗi 401, tiếp tục xử lý lỗi.
      }
    } catch (e) {
      handler.next(error); // Nếu có lỗi, tiếp tục xử lý lỗi.
    }
  }

  // Function để refresh token.
  Future<void> _refreshToken() async {
    final refreshToken = await _getRefreshToken(); // Lấy refresh token từ storage.
    final response = await get(
      '${AppConfig.url}/api/refresh-token/$refreshToken', // Gọi API để refresh token.
    );
    final String token = response.data;
    _saveToken(token); // Lưu token mới vào storage.
  }

  // Lấy refresh token từ storage.
  Future<String> _getRefreshToken() async {
    final String? token = await g.Get.find<AppManager>().getToken();
    return token ?? ''; // Trả về token hoặc chuỗi rỗng nếu không có.
  }

  // Lấy access token từ storage.
  Future<String> _getAccessToken() async {
    final String? token = await g.Get.find<AppManager>().getToken();
    return token ?? ''; // Trả về token hoặc chuỗi rỗng nếu không có.
  }

  // Lưu token vào storage.
  void _saveToken(String token) {
    g.Get.find<AppManager>().saveToken(token: token); // Lưu token vào AppManager.
  }
}