// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaymentOptions _$PaymentOptionsFromJson(Map<String, dynamic> json) {
  return _PaymentOptions.fromJson(json);
}

/// @nodoc
mixin _$PaymentOptions {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PaymentOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentOptionsCopyWith<PaymentOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentOptionsCopyWith<$Res> {
  factory $PaymentOptionsCopyWith(
    PaymentOptions value,
    $Res Function(PaymentOptions) then,
  ) = _$PaymentOptionsCopyWithImpl<$Res, PaymentOptions>;
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    bool blocked,
    bool archived,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class _$PaymentOptionsCopyWithImpl<$Res, $Val extends PaymentOptions>
    implements $PaymentOptionsCopyWith<$Res> {
  _$PaymentOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? blocked = null,
    Object? archived = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            blocked: null == blocked
                ? _value.blocked
                : blocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            archived: null == archived
                ? _value.archived
                : archived // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentOptionsImplCopyWith<$Res>
    implements $PaymentOptionsCopyWith<$Res> {
  factory _$$PaymentOptionsImplCopyWith(
    _$PaymentOptionsImpl value,
    $Res Function(_$PaymentOptionsImpl) then,
  ) = __$$PaymentOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    bool blocked,
    bool archived,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class __$$PaymentOptionsImplCopyWithImpl<$Res>
    extends _$PaymentOptionsCopyWithImpl<$Res, _$PaymentOptionsImpl>
    implements _$$PaymentOptionsImplCopyWith<$Res> {
  __$$PaymentOptionsImplCopyWithImpl(
    _$PaymentOptionsImpl _value,
    $Res Function(_$PaymentOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? blocked = null,
    Object? archived = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PaymentOptionsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        blocked: null == blocked
            ? _value.blocked
            : blocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        archived: null == archived
            ? _value.archived
            : archived // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentOptionsImpl implements _PaymentOptions {
  const _$PaymentOptionsImpl({
    this.id = 0,
    this.code = '',
    this.name = '',
    this.blocked = false,
    this.archived = false,
    @JsonKey(name: 'created_at') this.createdAt = '',
    @JsonKey(name: 'updated_at') this.updatedAt = '',
  });

  factory _$PaymentOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentOptionsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final bool blocked;
  @override
  @JsonKey()
  final bool archived;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'PaymentOptions(id: $id, code: $code, name: $name, blocked: $blocked, archived: $archived, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentOptionsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    name,
    blocked,
    archived,
    createdAt,
    updatedAt,
  );

  /// Create a copy of PaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentOptionsImplCopyWith<_$PaymentOptionsImpl> get copyWith =>
      __$$PaymentOptionsImplCopyWithImpl<_$PaymentOptionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentOptionsImplToJson(this);
  }
}

abstract class _PaymentOptions implements PaymentOptions {
  const factory _PaymentOptions({
    final int id,
    final String code,
    final String name,
    final bool blocked,
    final bool archived,
    @JsonKey(name: 'created_at') final String createdAt,
    @JsonKey(name: 'updated_at') final String updatedAt,
  }) = _$PaymentOptionsImpl;

  factory _PaymentOptions.fromJson(Map<String, dynamic> json) =
      _$PaymentOptionsImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  bool get blocked;
  @override
  bool get archived;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of PaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentOptionsImplCopyWith<_$PaymentOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
