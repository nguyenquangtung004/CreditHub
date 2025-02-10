// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      totalRequest: (json['total_request'] as num).toInt(),
      totalMoney: (json['total_money'] as num).toDouble(),
      lstRequests: (json['lstRequests'] as List<dynamic>)
          .map((e) => RequestItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      lstBranchReports: json['lstBranchReports'] as List<dynamic>,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
      'total_request': instance.totalRequest,
      'total_money': instance.totalMoney,
      'lstRequests': instance.lstRequests,
      'lstBranchReports': instance.lstBranchReports,
    };
