// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_without.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddWithoutImpl _$$AddWithoutImplFromJson(Map<String, dynamic> json) =>
    _$AddWithoutImpl(
      lot_no: json['lot_no'] as String? ?? '',
      money_request: (json['money_request'] as num?)?.toDouble() ?? 0.0,
      image_link: json['image_link'] as String? ?? '',
    );

Map<String, dynamic> _$$AddWithoutImplToJson(_$AddWithoutImpl instance) =>
    <String, dynamic>{
      'lot_no': instance.lot_no,
      'money_request': instance.money_request,
      'image_link': instance.image_link,
    };
