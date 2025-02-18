// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationParams _$PaginationParamsFromJson(Map<String, dynamic> json) {
  return _PaginationParams.fromJson(json);
}

/// @nodoc
mixin _$PaginationParams {
  @JsonKey(name: 'page_no')
  int get pageNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int get pageSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationParamsCopyWith<PaginationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationParamsCopyWith<$Res> {
  factory $PaginationParamsCopyWith(
          PaginationParams value, $Res Function(PaginationParams) then) =
      _$PaginationParamsCopyWithImpl<$Res, PaginationParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page_no') int pageNo,
      @JsonKey(name: 'page_size') int pageSize});
}

/// @nodoc
class _$PaginationParamsCopyWithImpl<$Res, $Val extends PaginationParams>
    implements $PaginationParamsCopyWith<$Res> {
  _$PaginationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNo = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      pageNo: null == pageNo
          ? _value.pageNo
          : pageNo // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationParamsImplCopyWith<$Res>
    implements $PaginationParamsCopyWith<$Res> {
  factory _$$PaginationParamsImplCopyWith(_$PaginationParamsImpl value,
          $Res Function(_$PaginationParamsImpl) then) =
      __$$PaginationParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page_no') int pageNo,
      @JsonKey(name: 'page_size') int pageSize});
}

/// @nodoc
class __$$PaginationParamsImplCopyWithImpl<$Res>
    extends _$PaginationParamsCopyWithImpl<$Res, _$PaginationParamsImpl>
    implements _$$PaginationParamsImplCopyWith<$Res> {
  __$$PaginationParamsImplCopyWithImpl(_$PaginationParamsImpl _value,
      $Res Function(_$PaginationParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNo = null,
    Object? pageSize = null,
  }) {
    return _then(_$PaginationParamsImpl(
      pageNo: null == pageNo
          ? _value.pageNo
          : pageNo // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationParamsImpl implements _PaginationParams {
  const _$PaginationParamsImpl(
      {@JsonKey(name: 'page_no') required this.pageNo,
      @JsonKey(name: 'page_size') required this.pageSize});

  factory _$PaginationParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationParamsImplFromJson(json);

  @override
  @JsonKey(name: 'page_no')
  final int pageNo;
  @override
  @JsonKey(name: 'page_size')
  final int pageSize;

  @override
  String toString() {
    return 'PaginationParams(pageNo: $pageNo, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationParamsImpl &&
            (identical(other.pageNo, pageNo) || other.pageNo == pageNo) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageNo, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationParamsImplCopyWith<_$PaginationParamsImpl> get copyWith =>
      __$$PaginationParamsImplCopyWithImpl<_$PaginationParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationParamsImplToJson(
      this,
    );
  }
}

abstract class _PaginationParams implements PaginationParams {
  const factory _PaginationParams(
          {@JsonKey(name: 'page_no') required final int pageNo,
          @JsonKey(name: 'page_size') required final int pageSize}) =
      _$PaginationParamsImpl;

  factory _PaginationParams.fromJson(Map<String, dynamic> json) =
      _$PaginationParamsImpl.fromJson;

  @override
  @JsonKey(name: 'page_no')
  int get pageNo;
  @override
  @JsonKey(name: 'page_size')
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$PaginationParamsImplCopyWith<_$PaginationParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
