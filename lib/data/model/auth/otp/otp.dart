import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp.freezed.dart';
part 'otp.g.dart';

@freezed
class OtpModel with _$OtpModel {
  const factory OtpModel({
    @Default('') final String otp,
    
  }) = _OtpModel;

  factory OtpModel.fromJson(Map<String, dynamic> json) => _$OtpModelFromJson(json);
}