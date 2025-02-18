import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart'; // ✅ Cần thiết để JSON serialization hoạt động

@JsonSerializable(genericArgumentFactories: true) // ✅ Hỗ trợ generic JSON parsing
class PaginationResponse<T> {
  @JsonKey(name: 'total_elements') final int totalElements;
  @JsonKey(name: 'total_page') final int totalPage;
  @JsonKey(name: 'page_no') final int pageNo;
  @JsonKey(name: 'page_size') final int pageSize;
  @JsonKey(name: 'data') final List<T> data;

  PaginationResponse({
    required this.totalElements,
    required this.totalPage,
    required this.pageNo,
    required this.pageSize,
    required this.data, 
  });

  /// ✅ **Dùng `fromJson()` để parse dữ liệu JSON**
  factory PaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT, // Hàm convert dữ liệu generic T từ JSON
  ) => _$PaginationResponseFromJson(json, fromJsonT);

  /// ✅ **Dùng `toJson()` để serialize dữ liệu**
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginationResponseToJson(this, toJsonT);
}
