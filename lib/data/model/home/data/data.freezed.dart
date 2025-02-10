// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  UserInfo get userInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_request')
  int get totalRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_money')
  double get totalMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'lstRequests')
  List<RequestItem> get lstRequests => throw _privateConstructorUsedError;
  @JsonKey(name: 'lstBranchReports')
  List<dynamic> get lstBranchReports => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {UserInfo userInfo,
      @JsonKey(name: 'total_request') int totalRequest,
      @JsonKey(name: 'total_money') double totalMoney,
      @JsonKey(name: 'lstRequests') List<RequestItem> lstRequests,
      @JsonKey(name: 'lstBranchReports') List<dynamic> lstBranchReports});

  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
    Object? totalRequest = null,
    Object? totalMoney = null,
    Object? lstRequests = null,
    Object? lstBranchReports = null,
  }) {
    return _then(_value.copyWith(
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      totalRequest: null == totalRequest
          ? _value.totalRequest
          : totalRequest // ignore: cast_nullable_to_non_nullable
              as int,
      totalMoney: null == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as double,
      lstRequests: null == lstRequests
          ? _value.lstRequests
          : lstRequests // ignore: cast_nullable_to_non_nullable
              as List<RequestItem>,
      lstBranchReports: null == lstBranchReports
          ? _value.lstBranchReports
          : lstBranchReports // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserInfo userInfo,
      @JsonKey(name: 'total_request') int totalRequest,
      @JsonKey(name: 'total_money') double totalMoney,
      @JsonKey(name: 'lstRequests') List<RequestItem> lstRequests,
      @JsonKey(name: 'lstBranchReports') List<dynamic> lstBranchReports});

  @override
  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
    Object? totalRequest = null,
    Object? totalMoney = null,
    Object? lstRequests = null,
    Object? lstBranchReports = null,
  }) {
    return _then(_$DataImpl(
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      totalRequest: null == totalRequest
          ? _value.totalRequest
          : totalRequest // ignore: cast_nullable_to_non_nullable
              as int,
      totalMoney: null == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as double,
      lstRequests: null == lstRequests
          ? _value._lstRequests
          : lstRequests // ignore: cast_nullable_to_non_nullable
              as List<RequestItem>,
      lstBranchReports: null == lstBranchReports
          ? _value._lstBranchReports
          : lstBranchReports // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {required this.userInfo,
      @JsonKey(name: 'total_request') required this.totalRequest,
      @JsonKey(name: 'total_money') required this.totalMoney,
      @JsonKey(name: 'lstRequests')
      required final List<RequestItem> lstRequests,
      @JsonKey(name: 'lstBranchReports')
      required final List<dynamic> lstBranchReports})
      : _lstRequests = lstRequests,
        _lstBranchReports = lstBranchReports;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final UserInfo userInfo;
  @override
  @JsonKey(name: 'total_request')
  final int totalRequest;
  @override
  @JsonKey(name: 'total_money')
  final double totalMoney;
  final List<RequestItem> _lstRequests;
  @override
  @JsonKey(name: 'lstRequests')
  List<RequestItem> get lstRequests {
    if (_lstRequests is EqualUnmodifiableListView) return _lstRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstRequests);
  }

  final List<dynamic> _lstBranchReports;
  @override
  @JsonKey(name: 'lstBranchReports')
  List<dynamic> get lstBranchReports {
    if (_lstBranchReports is EqualUnmodifiableListView)
      return _lstBranchReports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstBranchReports);
  }

  @override
  String toString() {
    return 'Data(userInfo: $userInfo, totalRequest: $totalRequest, totalMoney: $totalMoney, lstRequests: $lstRequests, lstBranchReports: $lstBranchReports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.totalRequest, totalRequest) ||
                other.totalRequest == totalRequest) &&
            (identical(other.totalMoney, totalMoney) ||
                other.totalMoney == totalMoney) &&
            const DeepCollectionEquality()
                .equals(other._lstRequests, _lstRequests) &&
            const DeepCollectionEquality()
                .equals(other._lstBranchReports, _lstBranchReports));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userInfo,
      totalRequest,
      totalMoney,
      const DeepCollectionEquality().hash(_lstRequests),
      const DeepCollectionEquality().hash(_lstBranchReports));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {required final UserInfo userInfo,
      @JsonKey(name: 'total_request') required final int totalRequest,
      @JsonKey(name: 'total_money') required final double totalMoney,
      @JsonKey(name: 'lstRequests')
      required final List<RequestItem> lstRequests,
      @JsonKey(name: 'lstBranchReports')
      required final List<dynamic> lstBranchReports}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  UserInfo get userInfo;
  @override
  @JsonKey(name: 'total_request')
  int get totalRequest;
  @override
  @JsonKey(name: 'total_money')
  double get totalMoney;
  @override
  @JsonKey(name: 'lstRequests')
  List<RequestItem> get lstRequests;
  @override
  @JsonKey(name: 'lstBranchReports')
  List<dynamic> get lstBranchReports;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
