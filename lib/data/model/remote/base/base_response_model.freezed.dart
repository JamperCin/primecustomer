// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) {
  return _BaseResponseModel.fromJson(json);
}

/// @nodoc
mixin _$BaseResponseModel {
  bool get success => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_msg')
  String? get error => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this BaseResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseResponseModelCopyWith<BaseResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseModelCopyWith<$Res> {
  factory $BaseResponseModelCopyWith(
    BaseResponseModel value,
    $Res Function(BaseResponseModel) then,
  ) = _$BaseResponseModelCopyWithImpl<$Res, BaseResponseModel>;
  @useResult
  $Res call({
    bool success,
    int status,
    @JsonKey(name: 'error_msg') String? error,
    Data? data,
  });

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$BaseResponseModelCopyWithImpl<$Res, $Val extends BaseResponseModel>
    implements $BaseResponseModelCopyWith<$Res> {
  _$BaseResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as int,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Data?,
          )
          as $Val,
    );
  }

  /// Create a copy of BaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BaseResponseModelImplCopyWith<$Res>
    implements $BaseResponseModelCopyWith<$Res> {
  factory _$$BaseResponseModelImplCopyWith(
    _$BaseResponseModelImpl value,
    $Res Function(_$BaseResponseModelImpl) then,
  ) = __$$BaseResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    int status,
    @JsonKey(name: 'error_msg') String? error,
    Data? data,
  });

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BaseResponseModelImplCopyWithImpl<$Res>
    extends _$BaseResponseModelCopyWithImpl<$Res, _$BaseResponseModelImpl>
    implements _$$BaseResponseModelImplCopyWith<$Res> {
  __$$BaseResponseModelImplCopyWithImpl(
    _$BaseResponseModelImpl _value,
    $Res Function(_$BaseResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$BaseResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as int,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as Data?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseResponseModelImpl implements _BaseResponseModel {
  const _$BaseResponseModelImpl({
    this.success = false,
    this.status = 0,
    @JsonKey(name: 'error_msg') this.error = '',
    this.data,
  });

  factory _$BaseResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey(name: 'error_msg')
  final String? error;
  @override
  final Data? data;

  @override
  String toString() {
    return 'BaseResponseModel(success: $success, status: $status, error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, status, error, data);

  /// Create a copy of BaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseModelImplCopyWith<_$BaseResponseModelImpl> get copyWith =>
      __$$BaseResponseModelImplCopyWithImpl<_$BaseResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseResponseModelImplToJson(this);
  }
}

abstract class _BaseResponseModel implements BaseResponseModel {
  const factory _BaseResponseModel({
    final bool success,
    final int status,
    @JsonKey(name: 'error_msg') final String? error,
    final Data? data,
  }) = _$BaseResponseModelImpl;

  factory _BaseResponseModel.fromJson(Map<String, dynamic> json) =
      _$BaseResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  int get status;
  @override
  @JsonKey(name: 'error_msg')
  String? get error;
  @override
  Data? get data;

  /// Create a copy of BaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseResponseModelImplCopyWith<_$BaseResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
