import 'package:credit_hub_app/data/_base/base_remote_source.dart';
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/service/sign_in_service.dart';

import '../model/auth/sign_in/sign_in.dart';
import '../model/auth/user/user.dart';
import '../repository/sign_in/sign_in_rep.dart';

class SignInServiceApi extends BaseRemoteSource implements AuthRepo {
  final SignInService service;

  SignInServiceApi({required this.service});
  @override
  Future<BaseResponse<UserModel>> signIn({required AuthModel param}) {
    final response = callApiWithErrorParser(service.signIn(param)).then(
      (httpResponse) {
        return httpResponse.data; // Trả về dữ liệu từ phản hồi HTTP.
      },
    );
    return response;
  }
}
