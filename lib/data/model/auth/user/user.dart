import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    final int? id,
    @Default(0) final int user_id,
    @Default('') final String username,
    @Default('') final String name,
    @Default('') final String address,
    @Default('') final String token, // ✅ Ánh xạ chính xác
    // @JsonKey(name: "branch_name") @Default('') final String branchName,
    // @JsonKey(name: "email") @Default('') final String email,
    // @JsonKey(name: "phone") @Default('') final String phone,
    // @JsonKey(name: "avatar") final String? avatar,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
