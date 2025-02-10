  import 'package:dio/dio.dart';
  import '../../../data/model/auth/forgot_password/forgot_password.dart';
  import '../../service/forgot_password/forgot_password_service.dart';
  import 'forgot_password_rep.dart';

  class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
    final ForgotPassWordService forgotPassWordService;

    ForgotPasswordRepoImpl(this.forgotPassWordService);

    @override
    Future<bool> sendForgotPasswordRequest(ForgotPassWord forgotPassword) async {
      try {
        final response = await forgotPassWordService.forgotPassword(forgotPassword);

        if (response.response.statusCode == 200 ) {
          return true;
        } else {
          throw Exception("Lỗi server: ${response.data.message}");
        }
      } on DioException catch (e) {
        throw Exception("Lỗi mạng: ${e.response?.statusMessage ?? e.message}");
      } catch (e) {
        throw Exception("Lỗi không xác định: $e");
      }
    }
  }
