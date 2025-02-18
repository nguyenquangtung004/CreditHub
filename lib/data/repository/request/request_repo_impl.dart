import 'dart:io';
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:credit_hub_app/data/repository/request/request_repo.dart';
import 'package:credit_hub_app/data/service/request/request_service.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../../model/add_without/add_without.dart';
import '../../model/home/request/request_history.dart';

class RequestRepoImpl implements RequestRepo {
  final RequestService requestService;

  RequestRepoImpl({required this.requestService});

  /// ✅ **Lấy danh sách request items từ API**
  @override
  Future<BaseResponse<PaginationResponse<RequestHistory>>> fetchRequestList({
    required PaginationParams params,
  }) async {
    try {
      final httpResponse = await requestService.fetchDanhSachApi(params);

      if (httpResponse.response.statusCode == 200) {
        return httpResponse.data;
      } else {
        throw Exception('API Error: ${httpResponse.response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi fetch request list: $e');
    }
  }

  /// ✅ **Gửi request item lên server**
  @override
  Future<BaseResponse<bool>> addRequestItem(AddWithout requestItem) async {
    try {
      final httpResponse = await requestService.addRequestItem(requestItem);

      if (httpResponse.response.statusCode == 200) {
        return httpResponse.data;
      } else {
        throw Exception('API Error: ${httpResponse.response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi thêm request item: $e');
    }
  }

  /// ✅ **Upload nhiều ảnh lên server**
  @override
  Future<List<String>> uploadMultipleImages(List<File> files) async {
    try {
      // ✅ Chuyển đổi danh sách `File` thành `List<MultipartFile>`
      List<MultipartFile> multipartFiles = await Future.wait(
        files.map(
          (file) async => await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
            contentType: MediaType("image", "jpeg"),
          ),
        ),
      );

      // ✅ Gửi danh sách file trực tiếp qua API Retrofit
      final response =
          await requestService.uploadMultipleImages(multipartFiles);

      if (response.response.statusCode == 200 && response.data.data != null) {
        return response.data.data!;
      } else {
        throw Exception("Lỗi khi tải ảnh lên server!");
      }
    } catch (e) {
      throw Exception("❌ Lỗi upload nhiều ảnh: $e");
    }
  }

   /// ✅ **Lấy chi tiết request item từ API**
  @override
  Future<BaseResponse<RequestHistory>> fetchRequestDetail(int requestId) async {
    try {
      final httpResponse = await requestService.fetchRequestDetail(requestId);

      if (httpResponse.response.statusCode == 200) {
        return httpResponse.data;
      } else {
        throw Exception('API Error: ${httpResponse.response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi fetch request detail: $e');
    }
  }
}
