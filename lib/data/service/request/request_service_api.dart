import 'dart:io';
import 'package:dio/dio.dart';
import 'package:credit_hub_app/data/model/home/request/request_history.dart';
import 'package:credit_hub_app/data/model/add_without/add_without.dart';
import 'package:credit_hub_app/data/repository/request/request_repo.dart';
import 'package:credit_hub_app/data/service/request/request_service.dart';
import 'package:http_parser/http_parser.dart';
import '../../_base/base_remote_source.dart';
import '../../_base/base_reponse.dart';
import '../../model/pagination/pagination_response.dart';
import '../../model/pagination_params.dart';

class RequestServiceApi extends BaseRemoteSource implements RequestRepo {
  final RequestService service;

  RequestServiceApi({required this.service});

  /// ✅ Gọi API để lấy danh sách request items
  @override
  Future<BaseResponse<PaginationResponse<RequestHistory>>> fetchRequestList({
    required PaginationParams params,
  }) {
    return callApiWithErrorParser(service.fetchDanhSachApi(params)).then(
      (httpResponse) => httpResponse.data,
    );
  }

  /// ✅ Gọi API để thêm một request item mới
  @override
  Future<BaseResponse<bool>> addRequestItem(AddWithout requestItem) {
    return callApiWithErrorParser(service.addRequestItem(requestItem)).then(
      (httpResponse) => httpResponse.data,
    );
  }

  /// ✅ Gọi API để upload nhiều ảnh
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
      final response = await callApiWithErrorParser(
        service.uploadMultipleImages(multipartFiles),
      );

      if (response.response.statusCode == 200 && response.data.data != null) {
        return response.data.data!;
      } else {
        throw Exception("Lỗi khi tải ảnh lên server!");
      }
    } catch (e) {
      throw Exception("❌ Lỗi upload ảnh: $e");
    }
  }
}
