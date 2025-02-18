// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPassWord _$ForgotPassWordFromJson(Map<String, dynamic> json) {
  return _ForgotPassWord.fromJson(json);
}

/// @nodoc
mixin _$ForgotPassWord {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPassWordCopyWith<ForgotPassWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPassWordCopyWith<$Res> {
  factory $ForgotPassWordCopyWith(
          ForgotPassWord value, $Res Function(ForgotPassWord) then) =
      _$ForgotPassWordCopyWithImpl<$Res, ForgotPassWord>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPassWordCopyWithImpl<$Res, $Val extends ForgotPassWord>
    implements $ForgotPassWordCopyWith<$Res> {
  _$ForgotPassWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPassWordImplCopyWith<$Res>
    implements $ForgotPassWordCopyWith<$Res> {
  factory _$$ForgotPassWordImplCopyWith(_$ForgotPassWordImpl value,
          $Res Function(_$ForgotPassWordImpl) then) =
      __$$ForgotPassWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPassWordImplCopyWithImpl<$Res>
    extends _$ForgotPassWordCopyWithImpl<$Res, _$ForgotPassWordImpl>
    implements _$$ForgotPassWordImplCopyWith<$Res> {
  __$$ForgotPassWordImplCopyWithImpl(
      _$ForgotPassWordImpl _value, $Res Function(_$ForgotPassWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPassWordImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPassWordImpl implements _ForgotPassWord {
  const _$ForgotPassWordImpl({this.email = ''});

  factory _$ForgotPassWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPassWordImplFromJson(json);

  @override
  @JsonKey()
  final String email;

  @override
  String toString() {
    return 'ForgotPassWord(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPassWordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPassWordImplCopyWith<_$ForgotPassWordImpl> get copyWith =>
      __$$ForgotPassWordImplCopyWithImpl<_$ForgotPassWordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPassWordImplToJson(
      this,
    );
  }
}

abstract class _ForgotPassWord implements ForgotPassWord {
  const factory _ForgotPassWord({final String email}) = _$ForgotPassWordImpl;

  factory _ForgotPassWord.fromJson(Map<String, dynamic> json) =
      _$ForgotPassWordImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPassWordImplCopyWith<_$ForgotPassWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
