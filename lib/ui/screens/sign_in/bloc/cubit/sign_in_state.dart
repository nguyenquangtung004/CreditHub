
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/model/auth/user/user.dart';

// import 'package:valuation/src/data/model/model_barrel.dart';

part 'sign_in_state.freezed.dart';

enum SignInStatus { initial, loading, success, failure }

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(SignInStatus.initial)
    final SignInStatus status,
    @Default(UserModel()) final UserModel data,
    @Default('') final String message,
  }) = _SignInState;
}

