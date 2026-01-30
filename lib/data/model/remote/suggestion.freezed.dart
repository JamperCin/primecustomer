// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Suggestion _$SuggestionFromJson(Map<String, dynamic> json) {
  return _Suggestion.fromJson(json);
}

/// @nodoc
mixin _$Suggestion {
  String get placeId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this Suggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestionCopyWith<Suggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionCopyWith<$Res> {
  factory $SuggestionCopyWith(
    Suggestion value,
    $Res Function(Suggestion) then,
  ) = _$SuggestionCopyWithImpl<$Res, Suggestion>;
  @useResult
  $Res call({
    String placeId,
    String description,
    String address,
    double latitude,
    double longitude,
  });
}

/// @nodoc
class _$SuggestionCopyWithImpl<$Res, $Val extends Suggestion>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(
      _value.copyWith(
            placeId: null == placeId
                ? _value.placeId
                : placeId // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuggestionImplCopyWith<$Res>
    implements $SuggestionCopyWith<$Res> {
  factory _$$SuggestionImplCopyWith(
    _$SuggestionImpl value,
    $Res Function(_$SuggestionImpl) then,
  ) = __$$SuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String placeId,
    String description,
    String address,
    double latitude,
    double longitude,
  });
}

/// @nodoc
class __$$SuggestionImplCopyWithImpl<$Res>
    extends _$SuggestionCopyWithImpl<$Res, _$SuggestionImpl>
    implements _$$SuggestionImplCopyWith<$Res> {
  __$$SuggestionImplCopyWithImpl(
    _$SuggestionImpl _value,
    $Res Function(_$SuggestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(
      _$SuggestionImpl(
        placeId: null == placeId
            ? _value.placeId
            : placeId // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionImpl implements _Suggestion {
  const _$SuggestionImpl({
    this.placeId = '',
    this.description = '',
    this.address = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  factory _$SuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionImplFromJson(json);

  @override
  @JsonKey()
  final String placeId;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;

  @override
  String toString() {
    return 'Suggestion(placeId: $placeId, description: $description, address: $address, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    placeId,
    description,
    address,
    latitude,
    longitude,
  );

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      __$$SuggestionImplCopyWithImpl<_$SuggestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionImplToJson(this);
  }
}

abstract class _Suggestion implements Suggestion {
  const factory _Suggestion({
    final String placeId,
    final String description,
    final String address,
    final double latitude,
    final double longitude,
  }) = _$SuggestionImpl;

  factory _Suggestion.fromJson(Map<String, dynamic> json) =
      _$SuggestionImpl.fromJson;

  @override
  String get placeId;
  @override
  String get description;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
