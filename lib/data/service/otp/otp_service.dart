import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/auth/otp/otp.dart';

part 'otp_service.g.dart';

@RestApi()
abstract class OtpService {
  factory OtpService(Dio dio, {String? baseUrl}) = _OtpService;

  @POST('app/auth/confirmCodeForgetBrand')
  Future<HttpResponse<BaseResponse<dynamic>>> verifyOtp(
    @Body() OtpModel otpModel
  );

  @POST('app/auth/changePassForgetBrand')
  Future<HttpResponse<BaseResponse<dynamic>>> changePassword(
    @Body() OtpModel otpModel
  );

  
}
