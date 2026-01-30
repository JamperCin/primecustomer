// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_checker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppUpdateChecker _$AppUpdateCheckerFromJson(Map<String, dynamic> json) {
  return _AppUpdateChecker.fromJson(json);
}

/// @nodoc
mixin _$AppUpdateChecker {
  int get versionCode => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get buttonTitle => throw _privateConstructorUsedError;
  String get feature => throw _privateConstructorUsedError;
  bool get forceUpdate => throw _privateConstructorUsedError;

  /// Serializes this AppUpdateChecker to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUpdateChecker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUpdateCheckerCopyWith<AppUpdateChecker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateCheckerCopyWith<$Res> {
  factory $AppUpdateCheckerCopyWith(
    AppUpdateChecker value,
    $Res Function(AppUpdateChecker) then,
  ) = _$AppUpdateCheckerCopyWithImpl<$Res, AppUpdateChecker>;
  @useResult
  $Res call({
    int versionCode,
    String title,
    String buttonTitle,
    String feature,
    bool forceUpdate,
  });
}

/// @nodoc
class _$AppUpdateCheckerCopyWithImpl<$Res, $Val extends AppUpdateChecker>
    implements $AppUpdateCheckerCopyWith<$Res> {
  _$AppUpdateCheckerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUpdateChecker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionCode = null,
    Object? title = null,
    Object? buttonTitle = null,
    Object? feature = null,
    Object? forceUpdate = null,
  }) {
    return _then(
      _value.copyWith(
            versionCode: null == versionCode
                ? _value.versionCode
                : versionCode // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            buttonTitle: null == buttonTitle
                ? _value.buttonTitle
                : buttonTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            feature: null == feature
                ? _value.feature
                : feature // ignore: cast_nullable_to_non_nullable
                      as String,
            forceUpdate: null == forceUpdate
                ? _value.forceUpdate
                : forceUpdate // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppUpdateCheckerImplCopyWith<$Res>
    implements $AppUpdateCheckerCopyWith<$Res> {
  factory _$$AppUpdateCheckerImplCopyWith(
    _$AppUpdateCheckerImpl value,
    $Res Function(_$AppUpdateCheckerImpl) then,
  ) = __$$AppUpdateCheckerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int versionCode,
    String title,
    String buttonTitle,
    String feature,
    bool forceUpdate,
  });
}

/// @nodoc
class __$$AppUpdateCheckerImplCopyWithImpl<$Res>
    extends _$AppUpdateCheckerCopyWithImpl<$Res, _$AppUpdateCheckerImpl>
    implements _$$AppUpdateCheckerImplCopyWith<$Res> {
  __$$AppUpdateCheckerImplCopyWithImpl(
    _$AppUpdateCheckerImpl _value,
    $Res Function(_$AppUpdateCheckerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppUpdateChecker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionCode = null,
    Object? title = null,
    Object? buttonTitle = null,
    Object? feature = null,
    Object? forceUpdate = null,
  }) {
    return _then(
      _$AppUpdateCheckerImpl(
        versionCode: null == versionCode
            ? _value.versionCode
            : versionCode // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        buttonTitle: null == buttonTitle
            ? _value.buttonTitle
            : buttonTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        feature: null == feature
            ? _value.feature
            : feature // ignore: cast_nullable_to_non_nullable
                  as String,
        forceUpdate: null == forceUpdate
            ? _value.forceUpdate
            : forceUpdate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUpdateCheckerImpl implements _AppUpdateChecker {
  const _$AppUpdateCheckerImpl({
    this.versionCode = 0,
    this.title = "",
    this.buttonTitle = "",
    this.feature = "",
    this.forceUpdate = false,
  });

  factory _$AppUpdateCheckerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUpdateCheckerImplFromJson(json);

  @override
  @JsonKey()
  final int versionCode;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String buttonTitle;
  @override
  @JsonKey()
  final String feature;
  @override
  @JsonKey()
  final bool forceUpdate;

  @override
  String toString() {
    return 'AppUpdateChecker(versionCode: $versionCode, title: $title, buttonTitle: $buttonTitle, feature: $feature, forceUpdate: $forceUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUpdateCheckerImpl &&
            (identical(other.versionCode, versionCode) ||
                other.versionCode == versionCode) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.buttonTitle, buttonTitle) ||
                other.buttonTitle == buttonTitle) &&
            (identical(other.feature, feature) || other.feature == feature) &&
            (identical(other.forceUpdate, forceUpdate) ||
                other.forceUpdate == forceUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    versionCode,
    title,
    buttonTitle,
    feature,
    forceUpdate,
  );

  /// Create a copy of AppUpdateChecker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUpdateCheckerImplCopyWith<_$AppUpdateCheckerImpl> get copyWith =>
      __$$AppUpdateCheckerImplCopyWithImpl<_$AppUpdateCheckerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUpdateCheckerImplToJson(this);
  }
}

abstract class _AppUpdateChecker implements AppUpdateChecker {
  const factory _AppUpdateChecker({
    final int versionCode,
    final String title,
    final String buttonTitle,
    final String feature,
    final bool forceUpdate,
  }) = _$AppUpdateCheckerImpl;

  factory _AppUpdateChecker.fromJson(Map<String, dynamic> json) =
      _$AppUpdateCheckerImpl.fromJson;

  @override
  int get versionCode;
  @override
  String get title;
  @override
  String get buttonTitle;
  @override
  String get feature;
  @override
  bool get forceUpdate;

  /// Create a copy of AppUpdateChecker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUpdateCheckerImplCopyWith<_$AppUpdateCheckerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
