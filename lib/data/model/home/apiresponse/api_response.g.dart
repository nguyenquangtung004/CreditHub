// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      code: json['code'] as String,
      error: json['error'] as String?,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'error': instance.error,
      'data': instance.data,
    };

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

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: (json['id'] as num).toInt(),
      branchName: json['branch_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'avatar': instance.avatar,
    };

_$RequestItemImpl _$$RequestItemImplFromJson(Map<String, dynamic> json) =>
    _$RequestItemImpl(
      id: (json['id'] as num).toInt(),
      dateRequest: json['date_request'] as String,
      image_link: json['image_link'] as String? ?? '',
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
      'image_link': instance.image_link,
      'date_request_origin': instance.dateRequestOrigin.toIso8601String(),
      'lot_no': instance.lotNo,
      'money_request': instance.moneyRequest,
      'status': instance.status,
      'status_name': instance.statusName,
    };
