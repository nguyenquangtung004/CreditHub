import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/home/apiresponse/api_response.dart';
import 'package:credit_hub_app/data/model/home/request/request_history.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'request_service.g.dart';

@RestApi()
abstract class RequestService {
  factory RequestService(Dio dio,{String? baseUrl}) = _RequestService;
  @POST('/app/requestmoneyorder/list')
  Future<HttpResponse<BaseResponse<PaginationResponse<RequestHistory>>>> fetchDanhSachApi(
    @Body() PaginationParams params,
  );
  
}