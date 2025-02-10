import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/repository/sign_in/sign_in_rep.dart';

import '../../model/auth/sign_in/sign_in.dart';
import '../../model/auth/user/user.dart';

class AuthRepositoryImpl implements AuthRepo {
  final AuthRepo repo;
  const AuthRepositoryImpl({required this.repo}); 

  @override
  Future<BaseResponse<UserModel>> signIn({required AuthModel param}) =>
  repo.signIn(param: param);
}