import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_history.freezed.dart';
part 'request_history.g.dart';

@freezed
class RequestHistory with _$RequestHistory {
  const factory RequestHistory({
    required int id,
    @JsonKey(name: 'branch_name') @Default('') String barnchNameHistory,
    @JsonKey(name: 'date_request') required String dateRequestHistory,
    @JsonKey(name: 'image_link') @Default('') String imageLinkHistory, // ✅ Sửa đúng thứ tự
    @JsonKey(name: 'date_request_origin') required String dateRequestOriginHistory,
    @JsonKey(name: 'lot_no') required String lotNoHistory,
    @JsonKey(name: 'money_request') required double moneyRequestHistory,
    @JsonKey(name: 'status_name') required String statusNameHistory,
  }) = _RequestHistory;

  /// ✅ Sửa lại phương thức fromJson đúng tên class
  factory RequestHistory.fromJson(Map<String, dynamic> json) => _$RequestHistoryFromJson(json);
}
