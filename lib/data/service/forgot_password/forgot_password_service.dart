
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/auth/forgot_password/forgot_password.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'forgot_password_service.g.dart';

@RestApi()
abstract class ForgotPassWordService {
  factory ForgotPassWordService(Dio dio, {String? baseUrl}) = _ForgotPassWordService;
  
  @POST('/app/auth/sendCodeForgetBrand')
  Future<HttpResponse<BaseResponse<ForgotPassWord>>> forgotPassword(
    @Body() ForgotPassWord forgotPassWord
  );

}