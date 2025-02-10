import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {
  @override
  List<Object> get props => [];
}

// ✅ Trạng thái ban đầu
class OtpInitial extends OtpState {}

// ✅ Trạng thái đang xử lý
class OtpLoading extends OtpState {}

// ✅ Trạng thái xác minh thành công
class OtpSuccess extends OtpState {}

// ✅ Trạng thái lỗi khi xác minh OTP
class OtpError extends OtpState {
  final String message;
  
  OtpError(this.message);

  @override
  List<Object> get props => [message];
}
