import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/data.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required String code,
    String? error,
    required Data data,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
