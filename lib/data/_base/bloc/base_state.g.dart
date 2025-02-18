// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseState<T> _$BaseStateFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseState<T>(
      status: $enumDecodeNullable(_$BaseStatusEnumMap, json['status']) ??
          BaseStatus.initial,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$BaseStateToJson<T>(
  BaseState<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': _$BaseStatusEnumMap[instance.status]!,
      'message': instance.message,
    };

const _$BaseStatusEnumMap = {
  BaseStatus.initial: 'initial',
  BaseStatus.loading: 'loading',
  BaseStatus.success: 'success',
  BaseStatus.failure: 'failure',
};
