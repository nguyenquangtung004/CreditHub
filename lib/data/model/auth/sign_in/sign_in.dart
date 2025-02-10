import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    @Default('') final String username,
    @Default('') final String password,
    @Default('') final String device_id,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
}