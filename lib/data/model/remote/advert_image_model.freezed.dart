// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advert_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AdvertImageModel _$AdvertImageModelFromJson(Map<String, dynamic> json) {
  return _AdvertImageModel.fromJson(json);
}

/// @nodoc
mixin _$AdvertImageModel {
  int get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'ad_type')
  String get adType => throw _privateConstructorUsedError;

  /// Serializes this AdvertImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdvertImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdvertImageModelCopyWith<AdvertImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertImageModelCopyWith<$Res> {
  factory $AdvertImageModelCopyWith(
    AdvertImageModel value,
    $Res Function(AdvertImageModel) then,
  ) = _$AdvertImageModelCopyWithImpl<$Res, AdvertImageModel>;
  @useResult
  $Res call({int id, String url, @JsonKey(name: 'ad_type') String adType});
}

/// @nodoc
class _$AdvertImageModelCopyWithImpl<$Res, $Val extends AdvertImageModel>
    implements $AdvertImageModelCopyWith<$Res> {
  _$AdvertImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdvertImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? url = null, Object? adType = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            adType: null == adType
                ? _value.adType
                : adType // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdvertImageModelImplCopyWith<$Res>
    implements $AdvertImageModelCopyWith<$Res> {
  factory _$$AdvertImageModelImplCopyWith(
    _$AdvertImageModelImpl value,
    $Res Function(_$AdvertImageModelImpl) then,
  ) = __$$AdvertImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String url, @JsonKey(name: 'ad_type') String adType});
}

/// @nodoc
class __$$AdvertImageModelImplCopyWithImpl<$Res>
    extends _$AdvertImageModelCopyWithImpl<$Res, _$AdvertImageModelImpl>
    implements _$$AdvertImageModelImplCopyWith<$Res> {
  __$$AdvertImageModelImplCopyWithImpl(
    _$AdvertImageModelImpl _value,
    $Res Function(_$AdvertImageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdvertImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? url = null, Object? adType = null}) {
    return _then(
      _$AdvertImageModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        adType: null == adType
            ? _value.adType
            : adType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvertImageModelImpl implements _AdvertImageModel {
  const _$AdvertImageModelImpl({
    required this.id,
    this.url = '',
    @JsonKey(name: 'ad_type') this.adType = '',
  });

  factory _$AdvertImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvertImageModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey(name: 'ad_type')
  final String adType;

  @override
  String toString() {
    return 'AdvertImageModel(id: $id, url: $url, adType: $adType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.adType, adType) || other.adType == adType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, adType);

  /// Create a copy of AdvertImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvertImageModelImplCopyWith<_$AdvertImageModelImpl> get copyWith =>
      __$$AdvertImageModelImplCopyWithImpl<_$AdvertImageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvertImageModelImplToJson(this);
  }
}

abstract class _AdvertImageModel implements AdvertImageModel {
  const factory _AdvertImageModel({
    required final int id,
    final String url,
    @JsonKey(name: 'ad_type') final String adType,
  }) = _$AdvertImageModelImpl;

  factory _AdvertImageModel.fromJson(Map<String, dynamic> json) =
      _$AdvertImageModelImpl.fromJson;

  @override
  int get id;
  @override
  String get url;
  @override
  @JsonKey(name: 'ad_type')
  String get adType;

  /// Create a copy of AdvertImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdvertImageModelImplCopyWith<_$AdvertImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
