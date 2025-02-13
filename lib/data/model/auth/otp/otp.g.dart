// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpModelImpl _$$OtpModelImplFromJson(Map<String, dynamic> json) =>
    _$OtpModelImpl(
      otp: json['otp_code'] as String?,
      email: json['email'] as String?,
      newPassword: json['new_password'] as String?,
    );

Map<String, dynamic> _$$OtpModelImplToJson(_$OtpModelImpl instance) =>
    <String, dynamic>{
      'otp_code': instance.otp,
      'email': instance.email,
      'new_password': instance.newPassword,
    };
