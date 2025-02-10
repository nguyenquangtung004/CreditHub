import 'package:dio/dio.dart';

import '../../model/auth/otp/otp.dart';
import '../../service/otp/otp_service.dart';
import 'otp_repo.dart';

class OtpRepositoryImpl implements OtpRepository {
  final OtpService otpService;

  OtpRepositoryImpl(this.otpService);

  @override
  Future<bool> verifyOtp(OtpModel otpModel) async {
    try {
      final response = await otpService.verifyOtp(otpModel);

      if (response.response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Lỗi xác minh OTP: ${response.data.message}");
      }
    } on DioException catch (e) {
      throw Exception("Lỗi mạng: ${e.response?.statusMessage ?? e.message}");
    } catch (e) {
      throw Exception("Lỗi không xác định: $e");
    }
  }
}
