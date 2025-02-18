// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtpModel _$OtpModelFromJson(Map<String, dynamic> json) {
  return _OtpModel.fromJson(json);
}

/// @nodoc
mixin _$OtpModel {
  @JsonKey(name: 'otp_code')
  String? get otp =>
      throw _privateConstructorUsedError; // ✅ Dùng name đúng với API
  @JsonKey(name: 'email')
  String? get email =>
      throw _privateConstructorUsedError; // ✅ Dùng name đúng với API
  @JsonKey(name: 'new_password')
  String? get newPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpModelCopyWith<OtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpModelCopyWith<$Res> {
  factory $OtpModelCopyWith(OtpModel value, $Res Function(OtpModel) then) =
      _$OtpModelCopyWithImpl<$Res, OtpModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'otp_code') String? otp,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'new_password') String? newPassword});
}

/// @nodoc
class _$OtpModelCopyWithImpl<$Res, $Val extends OtpModel>
    implements $OtpModelCopyWith<$Res> {
  _$OtpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? email = freezed,
    Object? newPassword = freezed,
  }) {
    return _then(_value.copyWith(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpModelImplCopyWith<$Res>
    implements $OtpModelCopyWith<$Res> {
  factory _$$OtpModelImplCopyWith(
          _$OtpModelImpl value, $Res Function(_$OtpModelImpl) then) =
      __$$OtpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'otp_code') String? otp,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'new_password') String? newPassword});
}

/// @nodoc
class __$$OtpModelImplCopyWithImpl<$Res>
    extends _$OtpModelCopyWithImpl<$Res, _$OtpModelImpl>
    implements _$$OtpModelImplCopyWith<$Res> {
  __$$OtpModelImplCopyWithImpl(
      _$OtpModelImpl _value, $Res Function(_$OtpModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? email = freezed,
    Object? newPassword = freezed,
  }) {
    return _then(_$OtpModelImpl(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpModelImpl implements _OtpModel {
  const _$OtpModelImpl(
      {@JsonKey(name: 'otp_code') this.otp,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'new_password') this.newPassword});

  factory _$OtpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpModelImplFromJson(json);

  @override
  @JsonKey(name: 'otp_code')
  final String? otp;
// ✅ Dùng name đúng với API
  @override
  @JsonKey(name: 'email')
  final String? email;
// ✅ Dùng name đúng với API
  @override
  @JsonKey(name: 'new_password')
  final String? newPassword;

  @override
  String toString() {
    return 'OtpModel(otp: $otp, email: $email, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpModelImpl &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, otp, email, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpModelImplCopyWith<_$OtpModelImpl> get copyWith =>
      __$$OtpModelImplCopyWithImpl<_$OtpModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpModelImplToJson(
      this,
    );
  }
}

abstract class _OtpModel implements OtpModel {
  const factory _OtpModel(
          {@JsonKey(name: 'otp_code') final String? otp,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'new_password') final String? newPassword}) =
      _$OtpModelImpl;

  factory _OtpModel.fromJson(Map<String, dynamic> json) =
      _$OtpModelImpl.fromJson;

  @override
  @JsonKey(name: 'otp_code')
  String? get otp;
  @override // ✅ Dùng name đúng với API
  @JsonKey(name: 'email')
  String? get email;
  @override // ✅ Dùng name đúng với API
  @JsonKey(name: 'new_password')
  String? get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$OtpModelImplCopyWith<_$OtpModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
