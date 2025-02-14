import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class BankModel with _$BankModel {
  const factory BankModel({
    @JsonKey(name: 'id') required int id, // ✅ ID ngân hàng
    @JsonKey(name: 'avatar') required String avatar, // ✅ URL logo ngân hàng
    @JsonKey(name: 'name') required String name, // ✅ Tên ngân hàng
    @JsonKey(name: 'description') required String description, // ✅ Mô tả ngân hàng
  }) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);
}
