import '../../model/auth/forgot_password/forgot_password.dart';

abstract class ForgotPasswordRepo {
  Future<bool> sendForgotPasswordRequest(ForgotPassWord forgotPassword);
}
