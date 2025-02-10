import 'package:bloc/bloc.dart';
import '../../../../data/model/auth/forgot_password/forgot_password.dart';
import '../../../../data/repository/forgot_password/forgot_password_rep.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo forgotPasswordRepo;

  ForgotPasswordCubit(this.forgotPasswordRepo) : super(ForgotPasswordInitial());

  // ✅ Gửi yêu cầu quên mật khẩu
  Future<void> sendForgotPasswordRequest(String email) async {
    emit(ForgotPasswordLoading());
    try {
      final request = ForgotPassWord(email: email);
      final result = await forgotPasswordRepo.sendForgotPasswordRequest(request);

      if (result) {
        emit(ForgotPasswordSuccess());
      } else {
        emit(ForgotPasswordError("Không thể gửi yêu cầu. Vui lòng thử lại."));
      }
    } catch (e) {
      emit(ForgotPasswordError(e.toString()));
    }
  }
}
