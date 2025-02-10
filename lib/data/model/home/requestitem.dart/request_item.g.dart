// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestItemImpl _$$RequestItemImplFromJson(Map<String, dynamic> json) =>
    _$RequestItemImpl(
      id: (json['id'] as num).toInt(),
      dateRequest: json['date_request'] as String,
      dateRequestOrigin: DateTime.parse(json['date_request_origin'] as String),
      lotNo: json['lot_no'] as String,
      moneyRequest: (json['money_request'] as num).toDouble(),
      status: (json['status'] as num).toInt(),
      statusName: json['status_name'] as String,
    );

Map<String, dynamic> _$$RequestItemImplToJson(_$RequestItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_request': instance.dateRequest,
      'date_request_origin': instance.dateRequestOrigin.toIso8601String(),
      'lot_no': instance.lotNo,
      'money_request': instance.moneyRequest,
      'status': instance.status,
      'status_name': instance.statusName,
    };
