
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/auth/sign_in/sign_in.dart';
import '../model/auth/user/user.dart';
part 'sign_in_service.g.dart';

@RestApi()
abstract class SignInService {
  factory SignInService(Dio dio, {String? baseUrl}) = _SignInService;
  
  @POST('/app/auth/login')
  Future<HttpResponse<BaseResponse<UserModel>>> signIn(
    @Body() AuthModel auth
  );
}