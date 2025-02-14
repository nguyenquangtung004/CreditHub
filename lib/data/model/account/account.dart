import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class AccountBank with _$AccountBank {
  @JsonSerializable(explicitToJson: true) // ✅ Bắt buộc để JSON hóa dữ liệu
  const factory AccountBank({
    @JsonKey(name: 'icons') @Default('') String? imageAccountBank,
    @JsonKey(name: "bank_id") @Default(0) int bankId,
    @JsonKey(name: "bank_account") @Default('') String? bankAccount,
    @JsonKey(name: "bank_name") @Default('') String? bankName,
    @JsonKey(name: "bank_owner") @Default('') String? bankOwner,
  }) = _AccountBank;

  factory AccountBank.fromJson(Map<String, dynamic> json) => _$AccountBankFromJson(json);
}
