// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestItem _$RequestItemFromJson(Map<String, dynamic> json) {
  return _RequestItem.fromJson(json);
}

/// @nodoc
mixin _$RequestItem {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_request')
  String get dateRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_request_origin')
  DateTime get dateRequestOrigin => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot_no')
  String get lotNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'money_request')
  double get moneyRequest => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_name')
  String get statusName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestItemCopyWith<RequestItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestItemCopyWith<$Res> {
  factory $RequestItemCopyWith(
          RequestItem value, $Res Function(RequestItem) then) =
      _$RequestItemCopyWithImpl<$Res, RequestItem>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'date_request') String dateRequest,
      @JsonKey(name: 'date_request_origin') DateTime dateRequestOrigin,
      @JsonKey(name: 'lot_no') String lotNo,
      @JsonKey(name: 'money_request') double moneyRequest,
      int status,
      @JsonKey(name: 'status_name') String statusName});
}

/// @nodoc
class _$RequestItemCopyWithImpl<$Res, $Val extends RequestItem>
    implements $RequestItemCopyWith<$Res> {
  _$RequestItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateRequest = null,
    Object? dateRequestOrigin = null,
    Object? lotNo = null,
    Object? moneyRequest = null,
    Object? status = null,
    Object? statusName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateRequest: null == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as String,
      dateRequestOrigin: null == dateRequestOrigin
          ? _value.dateRequestOrigin
          : dateRequestOrigin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      moneyRequest: null == moneyRequest
          ? _value.moneyRequest
          : moneyRequest // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestItemImplCopyWith<$Res>
    implements $RequestItemCopyWith<$Res> {
  factory _$$RequestItemImplCopyWith(
          _$RequestItemImpl value, $Res Function(_$RequestItemImpl) then) =
      __$$RequestItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'date_request') String dateRequest,
      @JsonKey(name: 'date_request_origin') DateTime dateRequestOrigin,
      @JsonKey(name: 'lot_no') String lotNo,
      @JsonKey(name: 'money_request') double moneyRequest,
      int status,
      @JsonKey(name: 'status_name') String statusName});
}

/// @nodoc
class __$$RequestItemImplCopyWithImpl<$Res>
    extends _$RequestItemCopyWithImpl<$Res, _$RequestItemImpl>
    implements _$$RequestItemImplCopyWith<$Res> {
  __$$RequestItemImplCopyWithImpl(
      _$RequestItemImpl _value, $Res Function(_$RequestItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateRequest = null,
    Object? dateRequestOrigin = null,
    Object? lotNo = null,
    Object? moneyRequest = null,
    Object? status = null,
    Object? statusName = null,
  }) {
    return _then(_$RequestItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateRequest: null == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as String,
      dateRequestOrigin: null == dateRequestOrigin
          ? _value.dateRequestOrigin
          : dateRequestOrigin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lotNo: null == lotNo
          ? _value.lotNo
          : lotNo // ignore: cast_nullable_to_non_nullable
              as String,
      moneyRequest: null == moneyRequest
          ? _value.moneyRequest
          : moneyRequest // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestItemImpl implements _RequestItem {
  const _$RequestItemImpl(
      {required this.id,
      @JsonKey(name: 'date_request') required this.dateRequest,
      @JsonKey(name: 'date_request_origin') required this.dateRequestOrigin,
      @JsonKey(name: 'lot_no') required this.lotNo,
      @JsonKey(name: 'money_request') required this.moneyRequest,
      required this.status,
      @JsonKey(name: 'status_name') required this.statusName});

  factory _$RequestItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestItemImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'date_request')
  final String dateRequest;
  @override
  @JsonKey(name: 'date_request_origin')
  final DateTime dateRequestOrigin;
  @override
  @JsonKey(name: 'lot_no')
  final String lotNo;
  @override
  @JsonKey(name: 'money_request')
  final double moneyRequest;
  @override
  final int status;
  @override
  @JsonKey(name: 'status_name')
  final String statusName;

  @override
  String toString() {
    return 'RequestItem(id: $id, dateRequest: $dateRequest, dateRequestOrigin: $dateRequestOrigin, lotNo: $lotNo, moneyRequest: $moneyRequest, status: $status, statusName: $statusName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateRequest, dateRequest) ||
                other.dateRequest == dateRequest) &&
            (identical(other.dateRequestOrigin, dateRequestOrigin) ||
                other.dateRequestOrigin == dateRequestOrigin) &&
            (identical(other.lotNo, lotNo) || other.lotNo == lotNo) &&
            (identical(other.moneyRequest, moneyRequest) ||
                other.moneyRequest == moneyRequest) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateRequest,
      dateRequestOrigin, lotNo, moneyRequest, status, statusName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestItemImplCopyWith<_$RequestItemImpl> get copyWith =>
      __$$RequestItemImplCopyWithImpl<_$RequestItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestItemImplToJson(
      this,
    );
  }
}

abstract class _RequestItem implements RequestItem {
  const factory _RequestItem(
          {required final int id,
          @JsonKey(name: 'date_request') required final String dateRequest,
          @JsonKey(name: 'date_request_origin')
          required final DateTime dateRequestOrigin,
          @JsonKey(name: 'lot_no') required final String lotNo,
          @JsonKey(name: 'money_request') required final double moneyRequest,
          required final int status,
          @JsonKey(name: 'status_name') required final String statusName}) =
      _$RequestItemImpl;

  factory _RequestItem.fromJson(Map<String, dynamic> json) =
      _$RequestItemImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'date_request')
  String get dateRequest;
  @override
  @JsonKey(name: 'date_request_origin')
  DateTime get dateRequestOrigin;
  @override
  @JsonKey(name: 'lot_no')
  String get lotNo;
  @override
  @JsonKey(name: 'money_request')
  double get moneyRequest;
  @override
  int get status;
  @override
  @JsonKey(name: 'status_name')
  String get statusName;
  @override
  @JsonKey(ignore: true)
  _$$RequestItemImplCopyWith<_$RequestItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
