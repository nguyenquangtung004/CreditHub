// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankModelImpl _$$BankModelImplFromJson(Map<String, dynamic> json) =>
    _$BankModelImpl(
      idBank: (json['id'] as num).toInt(),
      avatarBank: json['avatar'] as String,
      nameBank: json['name'] as String,
      descriptionBank: json['description'] as String,
    );

Map<String, dynamic> _$$BankModelImplToJson(_$BankModelImpl instance) =>
    <String, dynamic>{
      'id': instance.idBank,
      'avatar': instance.avatarBank,
      'name': instance.nameBank,
      'description': instance.descriptionBank,
    };
