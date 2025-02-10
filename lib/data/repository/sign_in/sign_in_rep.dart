import 'package:credit_hub_app/data/_base/base_reponse.dart';

import '../../model/auth/sign_in/sign_in.dart';
import '../../model/auth/user/user.dart';

abstract class AuthRepo {
  Future<BaseResponse<UserModel>> signIn(
    {
      required AuthModel param
    }
  );
  
}