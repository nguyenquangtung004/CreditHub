import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp.freezed.dart';
part 'otp.g.dart';

@freezed
class OtpModel with _$OtpModel {
  const factory OtpModel({
    @JsonKey(name: 'otp_code') String? otp,  // ✅ Dùng name đúng với API
    @JsonKey(name: 'email') String? email,   // ✅ Dùng name đúng với API
    @JsonKey(name: 'new_password') String? newPassword
  }) = _OtpModel;

  factory OtpModel.fromJson(Map<String, dynamic> json) => _$OtpModelFromJson(json);
}

