// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_without.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddWithout _$AddWithoutFromJson(Map<String, dynamic> json) {
  return _AddWithout.fromJson(json);
}

/// @nodoc
mixin _$AddWithout {
  String get lot_no => throw _privateConstructorUsedError;
  double get money_request => throw _privateConstructorUsedError;
  String? get image_link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddWithoutCopyWith<AddWithout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddWithoutCopyWith<$Res> {
  factory $AddWithoutCopyWith(
          AddWithout value, $Res Function(AddWithout) then) =
      _$AddWithoutCopyWithImpl<$Res, AddWithout>;
  @useResult
  $Res call({String lot_no, double money_request, String? image_link});
}

/// @nodoc
class _$AddWithoutCopyWithImpl<$Res, $Val extends AddWithout>
    implements $AddWithoutCopyWith<$Res> {
  _$AddWithoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lot_no = null,
    Object? money_request = null,
    Object? image_link = freezed,
  }) {
    return _then(_value.copyWith(
      lot_no: null == lot_no
          ? _value.lot_no
          : lot_no // ignore: cast_nullable_to_non_nullable
              as String,
      money_request: null == money_request
          ? _value.money_request
          : money_request // ignore: cast_nullable_to_non_nullable
              as double,
      image_link: freezed == image_link
          ? _value.image_link
          : image_link // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddWithoutImplCopyWith<$Res>
    implements $AddWithoutCopyWith<$Res> {
  factory _$$AddWithoutImplCopyWith(
          _$AddWithoutImpl value, $Res Function(_$AddWithoutImpl) then) =
      __$$AddWithoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lot_no, double money_request, String? image_link});
}

/// @nodoc
class __$$AddWithoutImplCopyWithImpl<$Res>
    extends _$AddWithoutCopyWithImpl<$Res, _$AddWithoutImpl>
    implements _$$AddWithoutImplCopyWith<$Res> {
  __$$AddWithoutImplCopyWithImpl(
      _$AddWithoutImpl _value, $Res Function(_$AddWithoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lot_no = null,
    Object? money_request = null,
    Object? image_link = freezed,
  }) {
    return _then(_$AddWithoutImpl(
      lot_no: null == lot_no
          ? _value.lot_no
          : lot_no // ignore: cast_nullable_to_non_nullable
              as String,
      money_request: null == money_request
          ? _value.money_request
          : money_request // ignore: cast_nullable_to_non_nullable
              as double,
      image_link: freezed == image_link
          ? _value.image_link
          : image_link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddWithoutImpl implements _AddWithout {
  const _$AddWithoutImpl(
      {this.lot_no = '', this.money_request = 0.0, this.image_link = ''});

  factory _$AddWithoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddWithoutImplFromJson(json);

  @override
  @JsonKey()
  final String lot_no;
  @override
  @JsonKey()
  final double money_request;
  @override
  @JsonKey()
  final String? image_link;

  @override
  String toString() {
    return 'AddWithout(lot_no: $lot_no, money_request: $money_request, image_link: $image_link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddWithoutImpl &&
            (identical(other.lot_no, lot_no) || other.lot_no == lot_no) &&
            (identical(other.money_request, money_request) ||
                other.money_request == money_request) &&
            (identical(other.image_link, image_link) ||
                other.image_link == image_link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lot_no, money_request, image_link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddWithoutImplCopyWith<_$AddWithoutImpl> get copyWith =>
      __$$AddWithoutImplCopyWithImpl<_$AddWithoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddWithoutImplToJson(
      this,
    );
  }
}

abstract class _AddWithout implements AddWithout {
  const factory _AddWithout(
      {final String lot_no,
      final double money_request,
      final String? image_link}) = _$AddWithoutImpl;

  factory _AddWithout.fromJson(Map<String, dynamic> json) =
      _$AddWithoutImpl.fromJson;

  @override
  String get lot_no;
  @override
  double get money_request;
  @override
  String? get image_link;
  @override
  @JsonKey(ignore: true)
  _$$AddWithoutImplCopyWith<_$AddWithoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
