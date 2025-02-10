import 'dart:developer'; // Thư viện ghi log
import 'dart:io'; // Xử lý HTTP và chứng chỉ
import 'package:dio/dio.dart'; // HTTP Client
import 'package:dio/io.dart'; // Hỗ trợ trên nền tảng I/O
import 'package:flutter/foundation.dart'; // Công cụ phát triển
import 'package:get/get.dart' as g; // GetX quản lý trạng thái
import 'package:pretty_dio_logger/pretty_dio_logger.dart'; // Ghi log đẹp mắt

import '../../core/config/app_config.dart'; // Config ứng dụng
import '../../shared/app_manager.dart'; // Quản lý token và trạng thái

// ===================== NetworkManager =====================
class NetworkManager {
  final String proxy = AppConfig.proxy; // Proxy dùng cho debug

  // Cấu hình mặc định cho Dio
  BaseOptions opts = BaseOptions(
    baseUrl: AppConfig.url, // Địa chỉ URL API
    contentType: 'application/json', // Định dạng JSON
    connectTimeout: const Duration(seconds: 30), // Timeout kết nối
    receiveTimeout: const Duration(seconds: 30), // Timeout phản hồi
  );

  // Tạo một instance của Dio
  Dio createDio() {
    final dio = Dio(opts);
    dio.addInterceptors(); // Thêm Interceptor
    return dio;
  }

  // Tạo instance Dio với cấu hình tùy chỉnh (nếu cần)
  Dio createDioWith(BaseOptions customOptions) {
    final dio = Dio(customOptions);
    dio.addInterceptors(); // Thêm Interceptor

    // Thêm proxy cho chế độ debug
    if (kDebugMode && proxy.isNotEmpty) {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.findProxy = (uri) => 'PROXY $proxy';
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );
    }
    return dio;
  }
}

// ===================== Extension for Dio =====================
extension AppDioExtension on Dio {
  // Thêm Interceptor cho Dio
  Dio addInterceptors() {
    return this
      ..interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: _requestInterceptor,
        onResponse: _responseInterceptor,
        onError: _errorInterceptor,
      ));
  }

  // Interceptor xử lý trước khi gửi request
  Future<void> _requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await g.Get.find<AppManager>().getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        log('🔑 [Request] Token added: $token');
      }
      handler.next(options); // Tiếp tục request
    } catch (e) {
      log('❌ [Request Interceptor Error]: $e');
      handler.next(options);
    }
  }

  // Interceptor xử lý khi nhận response
  Future<void> _responseInterceptor(Response response, ResponseInterceptorHandler handler) async {
    log('✅ [Response] Status Code: ${response.statusCode}');
    handler.next(response); // Tiếp tục xử lý response
  }

  // Interceptor xử lý lỗi
  Future<void> _errorInterceptor(DioException error, ErrorInterceptorHandler handler) async {
    try {
      final isSignedIn = await g.Get.find<AppManager>().getSignedInStatus();

      // Kiểm tra lỗi 401 (Token hết hạn)
      if (error.response?.statusCode == 401 && isSignedIn) {
        log("⚠️ [401] Token expired. Logging out...");
        await g.Get.find<AppManager>().logout();
        g.Get.offAllNamed('/login'); // Chuyển về màn hình đăng nhập
      } else {
        handler.next(error); // Tiếp tục xử lý lỗi khác
      }
    } catch (e) {
      log('❌ [Error Interceptor Error]: $e');
      handler.next(error);
    }
  }
}
