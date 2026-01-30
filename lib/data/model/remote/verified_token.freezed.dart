// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verified_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VerifiedToken _$VerifiedTokenFromJson(Map<String, dynamic> json) {
  return _VerifiedToken.fromJson(json);
}

/// @nodoc
mixin _$VerifiedToken {
  @JsonKey(name: 'verified_at')
  String get verifiedAt => throw _privateConstructorUsedError;
  String get signed => throw _privateConstructorUsedError;

  /// Serializes this VerifiedToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifiedToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifiedTokenCopyWith<VerifiedToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifiedTokenCopyWith<$Res> {
  factory $VerifiedTokenCopyWith(
    VerifiedToken value,
    $Res Function(VerifiedToken) then,
  ) = _$VerifiedTokenCopyWithImpl<$Res, VerifiedToken>;
  @useResult
  $Res call({@JsonKey(name: 'verified_at') String verifiedAt, String signed});
}

/// @nodoc
class _$VerifiedTokenCopyWithImpl<$Res, $Val extends VerifiedToken>
    implements $VerifiedTokenCopyWith<$Res> {
  _$VerifiedTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifiedToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? verifiedAt = null, Object? signed = null}) {
    return _then(
      _value.copyWith(
            verifiedAt: null == verifiedAt
                ? _value.verifiedAt
                : verifiedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            signed: null == signed
                ? _value.signed
                : signed // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifiedTokenImplCopyWith<$Res>
    implements $VerifiedTokenCopyWith<$Res> {
  factory _$$VerifiedTokenImplCopyWith(
    _$VerifiedTokenImpl value,
    $Res Function(_$VerifiedTokenImpl) then,
  ) = __$$VerifiedTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'verified_at') String verifiedAt, String signed});
}

/// @nodoc
class __$$VerifiedTokenImplCopyWithImpl<$Res>
    extends _$VerifiedTokenCopyWithImpl<$Res, _$VerifiedTokenImpl>
    implements _$$VerifiedTokenImplCopyWith<$Res> {
  __$$VerifiedTokenImplCopyWithImpl(
    _$VerifiedTokenImpl _value,
    $Res Function(_$VerifiedTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifiedToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? verifiedAt = null, Object? signed = null}) {
    return _then(
      _$VerifiedTokenImpl(
        verifiedAt: null == verifiedAt
            ? _value.verifiedAt
            : verifiedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        signed: null == signed
            ? _value.signed
            : signed // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifiedTokenImpl implements _VerifiedToken {
  const _$VerifiedTokenImpl({
    @JsonKey(name: 'verified_at') this.verifiedAt = '',
    this.signed = '',
  });

  factory _$VerifiedTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifiedTokenImplFromJson(json);

  @override
  @JsonKey(name: 'verified_at')
  final String verifiedAt;
  @override
  @JsonKey()
  final String signed;

  @override
  String toString() {
    return 'VerifiedToken(verifiedAt: $verifiedAt, signed: $signed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifiedTokenImpl &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.signed, signed) || other.signed == signed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, verifiedAt, signed);

  /// Create a copy of VerifiedToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifiedTokenImplCopyWith<_$VerifiedTokenImpl> get copyWith =>
      __$$VerifiedTokenImplCopyWithImpl<_$VerifiedTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifiedTokenImplToJson(this);
  }
}

abstract class _VerifiedToken implements VerifiedToken {
  const factory _VerifiedToken({
    @JsonKey(name: 'verified_at') final String verifiedAt,
    final String signed,
  }) = _$VerifiedTokenImpl;

  factory _VerifiedToken.fromJson(Map<String, dynamic> json) =
      _$VerifiedTokenImpl.fromJson;

  @override
  @JsonKey(name: 'verified_at')
  String get verifiedAt;
  @override
  String get signed;

  /// Create a copy of VerifiedToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifiedTokenImplCopyWith<_$VerifiedTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
