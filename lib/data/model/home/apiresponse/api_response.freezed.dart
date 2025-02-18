// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiResponse {
  String get code => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call({String code, String? error, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? error = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseImplCopyWith(
          _$ApiResponseImpl value, $Res Function(_$ApiResponseImpl) then) =
      __$$ApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String? error, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseImpl>
    implements _$$ApiResponseImplCopyWith<$Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl _value, $Res Function(_$ApiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? error = freezed,
    Object? data = null,
  }) {
    return _then(_$ApiResponseImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseImpl implements _ApiResponse {
  const _$ApiResponseImpl({required this.code, this.error, required this.data});

  factory _$ApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseImplFromJson(json);

  @override
  final String code;
  @override
  final String? error;
  @override
  final Data data;

  @override
  String toString() {
    return 'ApiResponse(code: $code, error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, error, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<_$ApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseImplToJson(
      this,
    );
  }
}

abstract class _ApiResponse implements ApiResponse {
  const factory _ApiResponse(
      {required final String code,
      final String? error,
      required final Data data}) = _$ApiResponseImpl;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$ApiResponseImpl.fromJson;

  @override
  String get code;
  @override
  String? get error;
  @override
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_name')
  String get branchName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'branch_name') String branchName,
      String email,
      String phone,
      String address,
      String? avatar});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? branchName = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'branch_name') String branchName,
      String email,
      String phone,
      String address,
      String? avatar});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? branchName = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? avatar = freezed,
  }) {
    return _then(_$UserInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {required this.id,
      @JsonKey(name: 'branch_name') required this.branchName,
      required this.email,
      required this.phone,
      required this.address,
      this.avatar});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'branch_name')
  final String branchName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'UserInfo(id: $id, branchName: $branchName, email: $email, phone: $phone, address: $address, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, branchName, email, phone, address, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {required final int id,
      @JsonKey(name: 'branch_name') required final String branchName,
      required final String email,
      required final String phone,
      required final String address,
      final String? avatar}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'branch_name')
  String get branchName;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get address;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestItem _$RequestItemFromJson(Map<String, dynamic> json) {
  return _RequestItem.fromJson(json);
}

/// @nodoc
mixin _$RequestItem {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_request')
  String get dateRequest => throw _privateConstructorUsedError;
  String? get image_link => throw _privateConstructorUsedError;
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
      String? image_link,
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
    Object? image_link = freezed,
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
      image_link: freezed == image_link
          ? _value.image_link
          : image_link // ignore: cast_nullable_to_non_nullable
              as String?,
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
      String? image_link,
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
    Object? image_link = freezed,
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
      image_link: freezed == image_link
          ? _value.image_link
          : image_link // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.image_link = '',
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
  @JsonKey()
  final String? image_link;
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
    return 'RequestItem(id: $id, dateRequest: $dateRequest, image_link: $image_link, dateRequestOrigin: $dateRequestOrigin, lotNo: $lotNo, moneyRequest: $moneyRequest, status: $status, statusName: $statusName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateRequest, dateRequest) ||
                other.dateRequest == dateRequest) &&
            (identical(other.image_link, image_link) ||
                other.image_link == image_link) &&
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
  int get hashCode => Object.hash(runtimeType, id, dateRequest, image_link,
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
          final String? image_link,
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
  String? get image_link;
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
