// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationParamsImpl _$$PaginationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationParamsImpl(
      pageNo: (json['page_no'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationParamsImplToJson(
        _$PaginationParamsImpl instance) =>
    <String, dynamic>{
      'page_no': instance.pageNo,
      'page_size': instance.pageSize,
    };
