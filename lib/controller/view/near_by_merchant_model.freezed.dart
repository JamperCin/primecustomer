// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'near_by_merchant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NearByMerchantModel _$NearByMerchantModelFromJson(Map<String, dynamic> json) {
  return _NearByMerchantModel.fromJson(json);
}

/// @nodoc
mixin _$NearByMerchantModel {
  String get address => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  MerchantDetails get client => throw _privateConstructorUsedError;

  /// Serializes this NearByMerchantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearByMerchantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearByMerchantModelCopyWith<NearByMerchantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearByMerchantModelCopyWith<$Res> {
  factory $NearByMerchantModelCopyWith(
    NearByMerchantModel value,
    $Res Function(NearByMerchantModel) then,
  ) = _$NearByMerchantModelCopyWithImpl<$Res, NearByMerchantModel>;
  @useResult
  $Res call({
    String address,
    String latitude,
    String longitude,
    MerchantDetails client,
  });

  $MerchantDetailsCopyWith<$Res> get client;
}

/// @nodoc
class _$NearByMerchantModelCopyWithImpl<$Res, $Val extends NearByMerchantModel>
    implements $NearByMerchantModelCopyWith<$Res> {
  _$NearByMerchantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearByMerchantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? client = null,
  }) {
    return _then(
      _value.copyWith(
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as String,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as String,
            client: null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                      as MerchantDetails,
          )
          as $Val,
    );
  }

  /// Create a copy of NearByMerchantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MerchantDetailsCopyWith<$Res> get client {
    return $MerchantDetailsCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearByMerchantModelImplCopyWith<$Res>
    implements $NearByMerchantModelCopyWith<$Res> {
  factory _$$NearByMerchantModelImplCopyWith(
    _$NearByMerchantModelImpl value,
    $Res Function(_$NearByMerchantModelImpl) then,
  ) = __$$NearByMerchantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String address,
    String latitude,
    String longitude,
    MerchantDetails client,
  });

  @override
  $MerchantDetailsCopyWith<$Res> get client;
}

/// @nodoc
class __$$NearByMerchantModelImplCopyWithImpl<$Res>
    extends _$NearByMerchantModelCopyWithImpl<$Res, _$NearByMerchantModelImpl>
    implements _$$NearByMerchantModelImplCopyWith<$Res> {
  __$$NearByMerchantModelImplCopyWithImpl(
    _$NearByMerchantModelImpl _value,
    $Res Function(_$NearByMerchantModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NearByMerchantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? client = null,
  }) {
    return _then(
      _$NearByMerchantModelImpl(
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as String,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as String,
        client: null == client
            ? _value.client
            : client // ignore: cast_nullable_to_non_nullable
                  as MerchantDetails,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NearByMerchantModelImpl implements _NearByMerchantModel {
  const _$NearByMerchantModelImpl({
    this.address = "",
    this.latitude = "",
    this.longitude = "",
    this.client = const MerchantDetails(),
  });

  factory _$NearByMerchantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearByMerchantModelImplFromJson(json);

  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;
  @override
  @JsonKey()
  final MerchantDetails client;

  @override
  String toString() {
    return 'NearByMerchantModel(address: $address, latitude: $latitude, longitude: $longitude, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearByMerchantModelImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, address, latitude, longitude, client);

  /// Create a copy of NearByMerchantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearByMerchantModelImplCopyWith<_$NearByMerchantModelImpl> get copyWith =>
      __$$NearByMerchantModelImplCopyWithImpl<_$NearByMerchantModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NearByMerchantModelImplToJson(this);
  }
}

abstract class _NearByMerchantModel implements NearByMerchantModel {
  const factory _NearByMerchantModel({
    final String address,
    final String latitude,
    final String longitude,
    final MerchantDetails client,
  }) = _$NearByMerchantModelImpl;

  factory _NearByMerchantModel.fromJson(Map<String, dynamic> json) =
      _$NearByMerchantModelImpl.fromJson;

  @override
  String get address;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  MerchantDetails get client;

  /// Create a copy of NearByMerchantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearByMerchantModelImplCopyWith<_$NearByMerchantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
