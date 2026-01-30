// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_type_id')
  int get walletTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'acc_number')
  String get accNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  bool? get archived => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_type')
  WalletType get walletType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;

  /// Serializes this WalletModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
    WalletModel value,
    $Res Function(WalletModel) then,
  ) = _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'wallet_type_id') int walletTypeId,
    @JsonKey(name: 'acc_number') String accNumber,
    @JsonKey(name: 'created_at') String createdAt,
    bool blocked,
    bool verified,
    bool? archived,
    @JsonKey(name: 'wallet_type') WalletType walletType,
    String description,
    String provider,
    @JsonKey(name: 'customer_id') String customerId,
  });

  $WalletTypeCopyWith<$Res> get walletType;
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletTypeId = null,
    Object? accNumber = null,
    Object? createdAt = null,
    Object? blocked = null,
    Object? verified = null,
    Object? archived = freezed,
    Object? walletType = null,
    Object? description = null,
    Object? provider = null,
    Object? customerId = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            walletTypeId: null == walletTypeId
                ? _value.walletTypeId
                : walletTypeId // ignore: cast_nullable_to_non_nullable
                      as int,
            accNumber: null == accNumber
                ? _value.accNumber
                : accNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            blocked: null == blocked
                ? _value.blocked
                : blocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
            archived: freezed == archived
                ? _value.archived
                : archived // ignore: cast_nullable_to_non_nullable
                      as bool?,
            walletType: null == walletType
                ? _value.walletType
                : walletType // ignore: cast_nullable_to_non_nullable
                      as WalletType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String,
            customerId: null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of WalletModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletTypeCopyWith<$Res> get walletType {
    return $WalletTypeCopyWith<$Res>(_value.walletType, (value) {
      return _then(_value.copyWith(walletType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletModelImplCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$WalletModelImplCopyWith(
    _$WalletModelImpl value,
    $Res Function(_$WalletModelImpl) then,
  ) = __$$WalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'wallet_type_id') int walletTypeId,
    @JsonKey(name: 'acc_number') String accNumber,
    @JsonKey(name: 'created_at') String createdAt,
    bool blocked,
    bool verified,
    bool? archived,
    @JsonKey(name: 'wallet_type') WalletType walletType,
    String description,
    String provider,
    @JsonKey(name: 'customer_id') String customerId,
  });

  @override
  $WalletTypeCopyWith<$Res> get walletType;
}

/// @nodoc
class __$$WalletModelImplCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$WalletModelImpl>
    implements _$$WalletModelImplCopyWith<$Res> {
  __$$WalletModelImplCopyWithImpl(
    _$WalletModelImpl _value,
    $Res Function(_$WalletModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WalletModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletTypeId = null,
    Object? accNumber = null,
    Object? createdAt = null,
    Object? blocked = null,
    Object? verified = null,
    Object? archived = freezed,
    Object? walletType = null,
    Object? description = null,
    Object? provider = null,
    Object? customerId = null,
  }) {
    return _then(
      _$WalletModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        walletTypeId: null == walletTypeId
            ? _value.walletTypeId
            : walletTypeId // ignore: cast_nullable_to_non_nullable
                  as int,
        accNumber: null == accNumber
            ? _value.accNumber
            : accNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        blocked: null == blocked
            ? _value.blocked
            : blocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
        archived: freezed == archived
            ? _value.archived
            : archived // ignore: cast_nullable_to_non_nullable
                  as bool?,
        walletType: null == walletType
            ? _value.walletType
            : walletType // ignore: cast_nullable_to_non_nullable
                  as WalletType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        customerId: null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletModelImpl implements _WalletModel {
  const _$WalletModelImpl({
    this.id = 0,
    @JsonKey(name: 'wallet_type_id') this.walletTypeId = 0,
    @JsonKey(name: 'acc_number') this.accNumber = '',
    @JsonKey(name: 'created_at') this.createdAt = '',
    this.blocked = false,
    this.verified = false,
    this.archived,
    @JsonKey(name: 'wallet_type') this.walletType = const WalletType(),
    this.description = '',
    this.provider = '',
    @JsonKey(name: 'customer_id') this.customerId = '',
  });

  factory _$WalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'wallet_type_id')
  final int walletTypeId;
  @override
  @JsonKey(name: 'acc_number')
  final String accNumber;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey()
  final bool blocked;
  @override
  @JsonKey()
  final bool verified;
  @override
  final bool? archived;
  @override
  @JsonKey(name: 'wallet_type')
  final WalletType walletType;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String provider;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;

  @override
  String toString() {
    return 'WalletModel(id: $id, walletTypeId: $walletTypeId, accNumber: $accNumber, createdAt: $createdAt, blocked: $blocked, verified: $verified, archived: $archived, walletType: $walletType, description: $description, provider: $provider, customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletTypeId, walletTypeId) ||
                other.walletTypeId == walletTypeId) &&
            (identical(other.accNumber, accNumber) ||
                other.accNumber == accNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    walletTypeId,
    accNumber,
    createdAt,
    blocked,
    verified,
    archived,
    walletType,
    description,
    provider,
    customerId,
  );

  /// Create a copy of WalletModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      __$$WalletModelImplCopyWithImpl<_$WalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletModelImplToJson(this);
  }
}

abstract class _WalletModel implements WalletModel {
  const factory _WalletModel({
    final int id,
    @JsonKey(name: 'wallet_type_id') final int walletTypeId,
    @JsonKey(name: 'acc_number') final String accNumber,
    @JsonKey(name: 'created_at') final String createdAt,
    final bool blocked,
    final bool verified,
    final bool? archived,
    @JsonKey(name: 'wallet_type') final WalletType walletType,
    final String description,
    final String provider,
    @JsonKey(name: 'customer_id') final String customerId,
  }) = _$WalletModelImpl;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$WalletModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'wallet_type_id')
  int get walletTypeId;
  @override
  @JsonKey(name: 'acc_number')
  String get accNumber;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  bool get blocked;
  @override
  bool get verified;
  @override
  bool? get archived;
  @override
  @JsonKey(name: 'wallet_type')
  WalletType get walletType;
  @override
  String get description;
  @override
  String get provider;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;

  /// Create a copy of WalletModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
