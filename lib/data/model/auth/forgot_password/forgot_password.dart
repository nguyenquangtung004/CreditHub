import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password.freezed.dart';
part 'forgot_password.g.dart';

@freezed
class ForgotPassWord with _$ForgotPassWord {
  const factory ForgotPassWord({
    @Default('') final String email,
    
  }) = _ForgotPassWord;

  factory ForgotPassWord.fromJson(Map<String, dynamic> json) => _$ForgotPassWordFromJson(json);
}