// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorResponseImpl _$$ErrorResponseImplFromJson(Map<String, dynamic> json) =>
    _$ErrorResponseImpl(
      message: json['message'] as String? ?? '',
      error: json['error'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$ErrorResponseImplToJson(_$ErrorResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };
