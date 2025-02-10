// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      device_id: json['device_id'] as String? ?? '',
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'device_id': instance.device_id,
    };
