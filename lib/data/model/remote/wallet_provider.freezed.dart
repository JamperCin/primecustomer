// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WalletProvider _$WalletProviderFromJson(Map<String, dynamic> json) {
  return _WalletProvider.fromJson(json);
}

/// @nodoc
mixin _$WalletProvider {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Serializes this WalletProvider to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletProviderCopyWith<WalletProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletProviderCopyWith<$Res> {
  factory $WalletProviderCopyWith(
    WalletProvider value,
    $Res Function(WalletProvider) then,
  ) = _$WalletProviderCopyWithImpl<$Res, WalletProvider>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$WalletProviderCopyWithImpl<$Res, $Val extends WalletProvider>
    implements $WalletProviderCopyWith<$Res> {
  _$WalletProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? code = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WalletProviderImplCopyWith<$Res>
    implements $WalletProviderCopyWith<$Res> {
  factory _$$WalletProviderImplCopyWith(
    _$WalletProviderImpl value,
    $Res Function(_$WalletProviderImpl) then,
  ) = __$$WalletProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$WalletProviderImplCopyWithImpl<$Res>
    extends _$WalletProviderCopyWithImpl<$Res, _$WalletProviderImpl>
    implements _$$WalletProviderImplCopyWith<$Res> {
  __$$WalletProviderImplCopyWithImpl(
    _$WalletProviderImpl _value,
    $Res Function(_$WalletProviderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WalletProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? code = null}) {
    return _then(
      _$WalletProviderImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletProviderImpl implements _WalletProvider {
  const _$WalletProviderImpl({this.name = '', this.code = ''});

  factory _$WalletProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletProviderImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'WalletProvider(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletProviderImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  /// Create a copy of WalletProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletProviderImplCopyWith<_$WalletProviderImpl> get copyWith =>
      __$$WalletProviderImplCopyWithImpl<_$WalletProviderImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletProviderImplToJson(this);
  }
}

abstract class _WalletProvider implements WalletProvider {
  const factory _WalletProvider({final String name, final String code}) =
      _$WalletProviderImpl;

  factory _WalletProvider.fromJson(Map<String, dynamic> json) =
      _$WalletProviderImpl.fromJson;

  @override
  String get name;
  @override
  String get code;

  /// Create a copy of WalletProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletProviderImplCopyWith<_$WalletProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
