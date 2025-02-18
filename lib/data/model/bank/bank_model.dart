import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class BankModel with _$BankModel {
  const factory BankModel({
    @JsonKey(name: 'id') required int idBank, // ✅ ID ngân hàng
    @JsonKey(name: 'avatar') required String avatarBank, // ✅ URL logo ngân hàng
    @JsonKey(name: 'name') required String nameBank, // ✅ Tên ngân hàng
    @JsonKey(name: 'description') required String descriptionBank, // ✅ Mô tả ngân hàng
  }) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);
}
