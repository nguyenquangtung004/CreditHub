import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/auth/otp/otp.dart';
import '../../../../data/repository/otp/otp_repo.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepository otpRepository;

  OtpCubit(this.otpRepository) : super(OtpInitial());

  // ✅ Xác minh OTP
  Future<void> verifyOtp(String otp) async {
    emit(OtpLoading());
    try {
      final otpModel = OtpModel(otp: otp);
      final result = await otpRepository.verifyOtp(otpModel);

      if (result) {
        emit(OtpSuccess());
      } else {
        emit(OtpError("Mã OTP không hợp lệ, vui lòng thử lại."));
      }
    } catch (e) {
      emit(OtpError("Lỗi xác minh OTP: ${e.toString()}"));
    }
  }
}
