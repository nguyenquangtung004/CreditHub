import 'package:freezed_annotation/freezed_annotation.dart';

import '../requestitem.dart/request_item.dart';
import '../userinfo/user_info.dart';
part 'data.freezed.dart';
part 'data.g.dart';
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
