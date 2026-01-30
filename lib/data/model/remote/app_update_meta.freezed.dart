// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppUpdateMeta _$AppUpdateMetaFromJson(Map<String, dynamic> json) {
  return _AppUpdateMeta.fromJson(json);
}

/// @nodoc
mixin _$AppUpdateMeta {
  AppUpdateChecker get ios => throw _privateConstructorUsedError;
  AppUpdateChecker get android => throw _privateConstructorUsedError;

  /// Serializes this AppUpdateMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUpdateMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUpdateMetaCopyWith<AppUpdateMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateMetaCopyWith<$Res> {
  factory $AppUpdateMetaCopyWith(
    AppUpdateMeta value,
    $Res Function(AppUpdateMeta) then,
  ) = _$AppUpdateMetaCopyWithImpl<$Res, AppUpdateMeta>;
  @useResult
  $Res call({AppUpdateChecker ios, AppUpdateChecker android});

  $AppUpdateCheckerCopyWith<$Res> get ios;
  $AppUpdateCheckerCopyWith<$Res> get android;
}

/// @nodoc
class _$AppUpdateMetaCopyWithImpl<$Res, $Val extends AppUpdateMeta>
    implements $AppUpdateMetaCopyWith<$Res> {
  _$AppUpdateMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUpdateMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ios = null, Object? android = null}) {
    return _then(
      _value.copyWith(
            ios: null == ios
                ? _value.ios
                : ios // ignore: cast_nullable_to_non_nullable
                      as AppUpdateChecker,
            android: null == android
                ? _value.android
                : android // ignore: cast_nullable_to_non_nullable
                      as AppUpdateChecker,
          )
          as $Val,
    );
  }

  /// Create a copy of AppUpdateMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUpdateCheckerCopyWith<$Res> get ios {
    return $AppUpdateCheckerCopyWith<$Res>(_value.ios, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  /// Create a copy of AppUpdateMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUpdateCheckerCopyWith<$Res> get android {
    return $AppUpdateCheckerCopyWith<$Res>(_value.android, (value) {
      return _then(_value.copyWith(android: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppUpdateMetaImplCopyWith<$Res>
    implements $AppUpdateMetaCopyWith<$Res> {
  factory _$$AppUpdateMetaImplCopyWith(
    _$AppUpdateMetaImpl value,
    $Res Function(_$AppUpdateMetaImpl) then,
  ) = __$$AppUpdateMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppUpdateChecker ios, AppUpdateChecker android});

  @override
  $AppUpdateCheckerCopyWith<$Res> get ios;
  @override
  $AppUpdateCheckerCopyWith<$Res> get android;
}

/// @nodoc
class __$$AppUpdateMetaImplCopyWithImpl<$Res>
    extends _$AppUpdateMetaCopyWithImpl<$Res, _$AppUpdateMetaImpl>
    implements _$$AppUpdateMetaImplCopyWith<$Res> {
  __$$AppUpdateMetaImplCopyWithImpl(
    _$AppUpdateMetaImpl _value,
    $Res Function(_$AppUpdateMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppUpdateMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ios = null, Object? android = null}) {
    return _then(
      _$AppUpdateMetaImpl(
        ios: null == ios
            ? _value.ios
            : ios // ignore: cast_nullable_to_non_nullable
                  as AppUpdateChecker,
        android: null == android
            ? _value.android
            : android // ignore: cast_nullable_to_non_nullable
                  as AppUpdateChecker,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUpdateMetaImpl implements _AppUpdateMeta {
  const _$AppUpdateMetaImpl({
    this.ios = const AppUpdateChecker(),
    this.android = const AppUpdateChecker(),
  });

  factory _$AppUpdateMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUpdateMetaImplFromJson(json);

  @override
  @JsonKey()
  final AppUpdateChecker ios;
  @override
  @JsonKey()
  final AppUpdateChecker android;

  @override
  String toString() {
    return 'AppUpdateMeta(ios: $ios, android: $android)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUpdateMetaImpl &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.android, android) || other.android == android));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ios, android);

  /// Create a copy of AppUpdateMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUpdateMetaImplCopyWith<_$AppUpdateMetaImpl> get copyWith =>
      __$$AppUpdateMetaImplCopyWithImpl<_$AppUpdateMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUpdateMetaImplToJson(this);
  }
}

abstract class _AppUpdateMeta implements AppUpdateMeta {
  const factory _AppUpdateMeta({
    final AppUpdateChecker ios,
    final AppUpdateChecker android,
  }) = _$AppUpdateMetaImpl;

  factory _AppUpdateMeta.fromJson(Map<String, dynamic> json) =
      _$AppUpdateMetaImpl.fromJson;

  @override
  AppUpdateChecker get ios;
  @override
  AppUpdateChecker get android;

  /// Create a copy of AppUpdateMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUpdateMetaImplCopyWith<_$AppUpdateMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
