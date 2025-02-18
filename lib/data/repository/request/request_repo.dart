import 'dart:io';

import 'package:credit_hub_app/data/model/home/request/request_history.dart';
import '../../_base/base_reponse.dart';
import '../../model/add_without/add_without.dart';
import '../../model/pagination/pagination_response.dart';
import '../../model/pagination_params.dart';

/// ✅ Interface (abstract class) cho Request Repository
abstract class RequestRepo {
  /// ✅ **Upload một ảnh lên server**
  // Future<String> uploadImage(File file);

  /// ✅ **Upload nhiều ảnh lên server**
  Future<List<String>> uploadMultipleImages(List<File> files);

  /// ✅ **Lấy danh sách request items từ API**
  Future<BaseResponse<PaginationResponse<RequestHistory>>> fetchRequestList({
    required PaginationParams params,
  });

  /// ✅ **Gửi request item lên server**
  Future<BaseResponse<bool>> addRequestItem(AddWithout requestItem);

   /// ✅ **Lấy chi tiết request item từ API theo requestId**
  Future<BaseResponse<RequestHistory>> fetchRequestDetail(int requestId);
}
