// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestHistoryImpl _$$RequestHistoryImplFromJson(Map<String, dynamic> json) =>
    _$RequestHistoryImpl(
      id: (json['id'] as num).toInt(),
      barnchNameHistory: json['branch_name'] as String? ?? '',
      dateRequestHistory: json['date_request'] as String,
      imageLinkHistory: json['image_link'] as String? ?? '',
      dateRequestOriginHistory: json['date_request_origin'] as String,
      lotNoHistory: json['lot_no'] as String,
      moneyRequestHistory: (json['money_request'] as num).toDouble(),
      statusNameHistory: json['status_name'] as String,
    );

Map<String, dynamic> _$$RequestHistoryImplToJson(
        _$RequestHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.barnchNameHistory,
      'date_request': instance.dateRequestHistory,
      'image_link': instance.imageLinkHistory,
      'date_request_origin': instance.dateRequestOriginHistory,
      'lot_no': instance.lotNoHistory,
      'money_request': instance.moneyRequestHistory,
      'status_name': instance.statusNameHistory,
    };
