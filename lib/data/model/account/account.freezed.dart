// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountBank _$AccountBankFromJson(Map<String, dynamic> json) {
  return _AccountBank.fromJson(json);
}

/// @nodoc
mixin _$AccountBank {
  @JsonKey(name: "bank_id")
  int get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_account")
  String? get bankAccount => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_owner")
  String? get bankOwner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountBankCopyWith<AccountBank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBankCopyWith<$Res> {
  factory $AccountBankCopyWith(
          AccountBank value, $Res Function(AccountBank) then) =
      _$AccountBankCopyWithImpl<$Res, AccountBank>;
  @useResult
  $Res call(
      {@JsonKey(name: "bank_id") int bankId,
      @JsonKey(name: "bank_account") String? bankAccount,
      @JsonKey(name: "bank_owner") String? bankOwner});
}

/// @nodoc
class _$AccountBankCopyWithImpl<$Res, $Val extends AccountBank>
    implements $AccountBankCopyWith<$Res> {
  _$AccountBankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankId = null,
    Object? bankAccount = freezed,
    Object? bankOwner = freezed,
  }) {
    return _then(_value.copyWith(
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankOwner: freezed == bankOwner
          ? _value.bankOwner
          : bankOwner // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountBankImplCopyWith<$Res>
    implements $AccountBankCopyWith<$Res> {
  factory _$$AccountBankImplCopyWith(
          _$AccountBankImpl value, $Res Function(_$AccountBankImpl) then) =
      __$$AccountBankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "bank_id") int bankId,
      @JsonKey(name: "bank_account") String? bankAccount,
      @JsonKey(name: "bank_owner") String? bankOwner});
}

/// @nodoc
class __$$AccountBankImplCopyWithImpl<$Res>
    extends _$AccountBankCopyWithImpl<$Res, _$AccountBankImpl>
    implements _$$AccountBankImplCopyWith<$Res> {
  __$$AccountBankImplCopyWithImpl(
      _$AccountBankImpl _value, $Res Function(_$AccountBankImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankId = null,
    Object? bankAccount = freezed,
    Object? bankOwner = freezed,
  }) {
    return _then(_$AccountBankImpl(
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankOwner: freezed == bankOwner
          ? _value.bankOwner
          : bankOwner // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AccountBankImpl implements _AccountBank {
  const _$AccountBankImpl(
      {@JsonKey(name: "bank_id") this.bankId = 0,
      @JsonKey(name: "bank_account") this.bankAccount = '',
      @JsonKey(name: "bank_owner") this.bankOwner = ''});

  factory _$AccountBankImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountBankImplFromJson(json);

  @override
  @JsonKey(name: "bank_id")
  final int bankId;
  @override
  @JsonKey(name: "bank_account")
  final String? bankAccount;
  @override
  @JsonKey(name: "bank_owner")
  final String? bankOwner;

  @override
  String toString() {
    return 'AccountBank(bankId: $bankId, bankAccount: $bankAccount, bankOwner: $bankOwner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountBankImpl &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.bankOwner, bankOwner) ||
                other.bankOwner == bankOwner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bankId, bankAccount, bankOwner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountBankImplCopyWith<_$AccountBankImpl> get copyWith =>
      __$$AccountBankImplCopyWithImpl<_$AccountBankImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountBankImplToJson(
      this,
    );
  }
}

abstract class _AccountBank implements AccountBank {
  const factory _AccountBank(
          {@JsonKey(name: "bank_id") final int bankId,
          @JsonKey(name: "bank_account") final String? bankAccount,
          @JsonKey(name: "bank_owner") final String? bankOwner}) =
      _$AccountBankImpl;

  factory _AccountBank.fromJson(Map<String, dynamic> json) =
      _$AccountBankImpl.fromJson;

  @override
  @JsonKey(name: "bank_id")
  int get bankId;
  @override
  @JsonKey(name: "bank_account")
  String? get bankAccount;
  @override
  @JsonKey(name: "bank_owner")
  String? get bankOwner;
  @override
  @JsonKey(ignore: true)
  _$$AccountBankImplCopyWith<_$AccountBankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
