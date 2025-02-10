import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/home/apiresponse/api_response.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String? baseUrl}) = _HomeService;

  @GET('/app/home/homeInfo')
  Future<HttpResponse<ApiResponse>> getHomeInfo();
}
