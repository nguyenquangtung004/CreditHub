import 'package:credit_hub_app/data/model/auth/otp/otp.dart';

abstract class OtpRepository {
  Future<bool> verifyOtp(OtpModel otpModel);
}
