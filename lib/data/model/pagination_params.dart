import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_params.freezed.dart';
part 'pagination_params.g.dart';

@freezed
class PaginationParams with _$PaginationParams {
  const factory PaginationParams({
    @JsonKey(name: 'page_no') required int pageNo,
    @JsonKey(name: 'page_size') required int pageSize,
  }) = _PaginationParams;

  factory PaginationParams.fromJson(Map<String, dynamic> json) => _$PaginationParamsFromJson(json);
}