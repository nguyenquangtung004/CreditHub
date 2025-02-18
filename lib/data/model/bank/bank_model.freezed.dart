// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return _BankModel.fromJson(json);
}

/// @nodoc
mixin _$BankModel {
  @JsonKey(name: 'id')
  int get idBank => throw _privateConstructorUsedError; // ✅ ID ngân hàng
  @JsonKey(name: 'avatar')
  String get avatarBank =>
      throw _privateConstructorUsedError; // ✅ URL logo ngân hàng
  @JsonKey(name: 'name')
  String get nameBank => throw _privateConstructorUsedError; // ✅ Tên ngân hàng
  @JsonKey(name: 'description')
  String get descriptionBank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankModelCopyWith<BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankModelCopyWith<$Res> {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) then) =
      _$BankModelCopyWithImpl<$Res, BankModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int idBank,
      @JsonKey(name: 'avatar') String avatarBank,
      @JsonKey(name: 'name') String nameBank,
      @JsonKey(name: 'description') String descriptionBank});
}

/// @nodoc
class _$BankModelCopyWithImpl<$Res, $Val extends BankModel>
    implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBank = null,
    Object? avatarBank = null,
    Object? nameBank = null,
    Object? descriptionBank = null,
  }) {
    return _then(_value.copyWith(
      idBank: null == idBank
          ? _value.idBank
          : idBank // ignore: cast_nullable_to_non_nullable
              as int,
      avatarBank: null == avatarBank
          ? _value.avatarBank
          : avatarBank // ignore: cast_nullable_to_non_nullable
              as String,
      nameBank: null == nameBank
          ? _value.nameBank
          : nameBank // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionBank: null == descriptionBank
          ? _value.descriptionBank
          : descriptionBank // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankModelImplCopyWith<$Res>
    implements $BankModelCopyWith<$Res> {
  factory _$$BankModelImplCopyWith(
          _$BankModelImpl value, $Res Function(_$BankModelImpl) then) =
      __$$BankModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int idBank,
      @JsonKey(name: 'avatar') String avatarBank,
      @JsonKey(name: 'name') String nameBank,
      @JsonKey(name: 'description') String descriptionBank});
}

/// @nodoc
class __$$BankModelImplCopyWithImpl<$Res>
    extends _$BankModelCopyWithImpl<$Res, _$BankModelImpl>
    implements _$$BankModelImplCopyWith<$Res> {
  __$$BankModelImplCopyWithImpl(
      _$BankModelImpl _value, $Res Function(_$BankModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBank = null,
    Object? avatarBank = null,
    Object? nameBank = null,
    Object? descriptionBank = null,
  }) {
    return _then(_$BankModelImpl(
      idBank: null == idBank
          ? _value.idBank
          : idBank // ignore: cast_nullable_to_non_nullable
              as int,
      avatarBank: null == avatarBank
          ? _value.avatarBank
          : avatarBank // ignore: cast_nullable_to_non_nullable
              as String,
      nameBank: null == nameBank
          ? _value.nameBank
          : nameBank // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionBank: null == descriptionBank
          ? _value.descriptionBank
          : descriptionBank // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankModelImpl implements _BankModel {
  const _$BankModelImpl(
      {@JsonKey(name: 'id') required this.idBank,
      @JsonKey(name: 'avatar') required this.avatarBank,
      @JsonKey(name: 'name') required this.nameBank,
      @JsonKey(name: 'description') required this.descriptionBank});

  factory _$BankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int idBank;
// ✅ ID ngân hàng
  @override
  @JsonKey(name: 'avatar')
  final String avatarBank;
// ✅ URL logo ngân hàng
  @override
  @JsonKey(name: 'name')
  final String nameBank;
// ✅ Tên ngân hàng
  @override
  @JsonKey(name: 'description')
  final String descriptionBank;

  @override
  String toString() {
    return 'BankModel(idBank: $idBank, avatarBank: $avatarBank, nameBank: $nameBank, descriptionBank: $descriptionBank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankModelImpl &&
            (identical(other.idBank, idBank) || other.idBank == idBank) &&
            (identical(other.avatarBank, avatarBank) ||
                other.avatarBank == avatarBank) &&
            (identical(other.nameBank, nameBank) ||
                other.nameBank == nameBank) &&
            (identical(other.descriptionBank, descriptionBank) ||
                other.descriptionBank == descriptionBank));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idBank, avatarBank, nameBank, descriptionBank);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      __$$BankModelImplCopyWithImpl<_$BankModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankModelImplToJson(
      this,
    );
  }
}

abstract class _BankModel implements BankModel {
  const factory _BankModel(
      {@JsonKey(name: 'id') required final int idBank,
      @JsonKey(name: 'avatar') required final String avatarBank,
      @JsonKey(name: 'name') required final String nameBank,
      @JsonKey(name: 'description')
      required final String descriptionBank}) = _$BankModelImpl;

  factory _BankModel.fromJson(Map<String, dynamic> json) =
      _$BankModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get idBank;
  @override // ✅ ID ngân hàng
  @JsonKey(name: 'avatar')
  String get avatarBank;
  @override // ✅ URL logo ngân hàng
  @JsonKey(name: 'name')
  String get nameBank;
  @override // ✅ Tên ngân hàng
  @JsonKey(name: 'description')
  String get descriptionBank;
  @override
  @JsonKey(ignore: true)
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
