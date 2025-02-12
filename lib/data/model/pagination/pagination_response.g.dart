// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse<T> _$PaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationResponse<T>(
      totalElements: (json['total_elements'] as num).toInt(),
      totalPage: (json['total_page'] as num).toInt(),
      pageNo: (json['page_no'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PaginationResponseToJson<T>(
  PaginationResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'total_elements': instance.totalElements,
      'total_page': instance.totalPage,
      'page_no': instance.pageNo,
      'page_size': instance.pageSize,
      'data': instance.data.map(toJsonT).toList(),
    };
