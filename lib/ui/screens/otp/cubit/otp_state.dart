abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpCounting extends OtpState {
  final int secondsRemaining;
  OtpCounting(this.secondsRemaining);
}

class OtpResendReady extends OtpState {}

class OtpResent extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {}

class OtpError extends OtpState {
  final String message;
  OtpError(this.message);
}
