import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_item.freezed.dart';
part 'request_item.g.dart';

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

  factory RequestItem.fromJson(Map<String, dynamic> json) =>
      _$RequestItemFromJson(json);
}
