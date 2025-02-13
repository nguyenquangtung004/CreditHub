import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/home/request/request_history.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/add_without/add_without.dart';
part 'request_service.g.dart';

@RestApi()
abstract class RequestService {
  factory RequestService(Dio dio, {String? baseUrl}) = _RequestService;
  @POST('/app/requestmoneyorder/list')
  Future<HttpResponse<BaseResponse<PaginationResponse<RequestHistory>>>>
      fetchDanhSachApi(
    @Body() PaginationParams params,
  );

  @POST('/app/requestmoneyorder/create')
  Future<HttpResponse<BaseResponse<bool>>> addRequestItem(
    @Body() AddWithout requestItem,
  );

  @POST("/upload/uploadfile")
  @MultiPart()
  Future<HttpResponse<BaseResponse<List<String>>>> uploadMultipleImages(
    @Part(name: "files")
    List<MultipartFile> files,
  );
}
