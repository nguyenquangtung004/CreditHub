import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// 📌 **API Response Model**
@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required String code,
    String? error,
    required Data data,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
}

/// 📌 **Data Model (Chứa thông tin tổng hợp)**
@freezed
class Data with _$Data {
  const factory Data({
    required UserInfo userInfo,
    @JsonKey(name: 'total_request') required int totalRequest,
    @JsonKey(name: 'total_money') required double totalMoney,
    @JsonKey(name: 'lstRequests') required List<RequestItem> lstRequests,
    @JsonKey(name: 'lstBranchReports') required List<dynamic> lstBranchReports,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

/// 📌 **UserInfo Model (Thông tin người dùng)**
@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int id,
    @JsonKey(name: 'branch_name') required String branchName,
    required String email,
    required String phone,
    required String address,
    String? avatar,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}

/// 📌 **RequestItem Model (Thông tin từng yêu cầu)**
@freezed
class RequestItem with _$RequestItem {
  const factory RequestItem({
    required int id,
    @JsonKey(name: 'date_request') required String dateRequest,
    @JsonKey(name: 'date_request_origin') required DateTime dateRequestOrigin,
    @JsonKey(name: 'lot_no') required String lotNo,
    @JsonKey(name: 'money_request') required double moneyRequest,
    required int status,
    @JsonKey(name: 'status_name') required String statusName,
  }) = _RequestItem;

  factory RequestItem.fromJson(Map<String, dynamic> json) => _$RequestItemFromJson(json);
}
