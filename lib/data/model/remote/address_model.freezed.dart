// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  int get id => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'person_id')
  int get personId => throw _privateConstructorUsedError;
  bool get isWithinRange => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_name')
  String get locationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'residential_address')
  String get residentialAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  Coordinates get coordinate => throw _privateConstructorUsedError;

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
    AddressModel value,
    $Res Function(AddressModel) then,
  ) = _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call({
    int id,
    double distance,
    @JsonKey(name: 'is_default') bool isDefault,
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'person_id') int personId,
    bool isWithinRange,
    bool isSelected,
    bool archived,
    String latitude,
    String longitude,
    @JsonKey(name: 'full_name') String name,
    @JsonKey(name: 'location_name') String locationName,
    @JsonKey(name: 'residential_address') String residentialAddress,
    @JsonKey(name: 'phone_number') String phone,
    @JsonKey(name: 'created_at') String createdAt,
    Coordinates coordinate,
  });

  $CoordinatesCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? distance = null,
    Object? isDefault = null,
    Object? userId = null,
    Object? personId = null,
    Object? isWithinRange = null,
    Object? isSelected = null,
    Object? archived = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? name = null,
    Object? locationName = null,
    Object? residentialAddress = null,
    Object? phone = null,
    Object? createdAt = null,
    Object? coordinate = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            distance: null == distance
                ? _value.distance
                : distance // ignore: cast_nullable_to_non_nullable
                      as double,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            personId: null == personId
                ? _value.personId
                : personId // ignore: cast_nullable_to_non_nullable
                      as int,
            isWithinRange: null == isWithinRange
                ? _value.isWithinRange
                : isWithinRange // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSelected: null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as bool,
            archived: null == archived
                ? _value.archived
                : archived // ignore: cast_nullable_to_non_nullable
                      as bool,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as String,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            locationName: null == locationName
                ? _value.locationName
                : locationName // ignore: cast_nullable_to_non_nullable
                      as String,
            residentialAddress: null == residentialAddress
                ? _value.residentialAddress
                : residentialAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            coordinate: null == coordinate
                ? _value.coordinate
                : coordinate // ignore: cast_nullable_to_non_nullable
                      as Coordinates,
          )
          as $Val,
    );
  }

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res> get coordinate {
    return $CoordinatesCopyWith<$Res>(_value.coordinate, (value) {
      return _then(_value.copyWith(coordinate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
    _$AddressModelImpl value,
    $Res Function(_$AddressModelImpl) then,
  ) = __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    double distance,
    @JsonKey(name: 'is_default') bool isDefault,
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'person_id') int personId,
    bool isWithinRange,
    bool isSelected,
    bool archived,
    String latitude,
    String longitude,
    @JsonKey(name: 'full_name') String name,
    @JsonKey(name: 'location_name') String locationName,
    @JsonKey(name: 'residential_address') String residentialAddress,
    @JsonKey(name: 'phone_number') String phone,
    @JsonKey(name: 'created_at') String createdAt,
    Coordinates coordinate,
  });

  @override
  $CoordinatesCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
    _$AddressModelImpl _value,
    $Res Function(_$AddressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? distance = null,
    Object? isDefault = null,
    Object? userId = null,
    Object? personId = null,
    Object? isWithinRange = null,
    Object? isSelected = null,
    Object? archived = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? name = null,
    Object? locationName = null,
    Object? residentialAddress = null,
    Object? phone = null,
    Object? createdAt = null,
    Object? coordinate = null,
  }) {
    return _then(
      _$AddressModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        distance: null == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                  as double,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        personId: null == personId
            ? _value.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as int,
        isWithinRange: null == isWithinRange
            ? _value.isWithinRange
            : isWithinRange // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSelected: null == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool,
        archived: null == archived
            ? _value.archived
            : archived // ignore: cast_nullable_to_non_nullable
                  as bool,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as String,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        locationName: null == locationName
            ? _value.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String,
        residentialAddress: null == residentialAddress
            ? _value.residentialAddress
            : residentialAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinate: null == coordinate
            ? _value.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as Coordinates,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl implements _AddressModel {
  const _$AddressModelImpl({
    this.id = 0,
    this.distance = 0.0,
    @JsonKey(name: 'is_default') this.isDefault = false,
    @JsonKey(name: 'user_id') this.userId = 0,
    @JsonKey(name: 'person_id') this.personId = 0,
    this.isWithinRange = false,
    this.isSelected = false,
    this.archived = false,
    this.latitude = '',
    this.longitude = '',
    @JsonKey(name: 'full_name') this.name = '',
    @JsonKey(name: 'location_name') this.locationName = '',
    @JsonKey(name: 'residential_address') this.residentialAddress = '',
    @JsonKey(name: 'phone_number') this.phone = '',
    @JsonKey(name: 'created_at') this.createdAt = '',
    this.coordinate = const Coordinates(),
  });

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final double distance;
  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'person_id')
  final int personId;
  @override
  @JsonKey()
  final bool isWithinRange;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final bool archived;
  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;
  @override
  @JsonKey(name: 'full_name')
  final String name;
  @override
  @JsonKey(name: 'location_name')
  final String locationName;
  @override
  @JsonKey(name: 'residential_address')
  final String residentialAddress;
  @override
  @JsonKey(name: 'phone_number')
  final String phone;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey()
  final Coordinates coordinate;

  @override
  String toString() {
    return 'AddressModel(id: $id, distance: $distance, isDefault: $isDefault, userId: $userId, personId: $personId, isWithinRange: $isWithinRange, isSelected: $isSelected, archived: $archived, latitude: $latitude, longitude: $longitude, name: $name, locationName: $locationName, residentialAddress: $residentialAddress, phone: $phone, createdAt: $createdAt, coordinate: $coordinate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.isWithinRange, isWithinRange) ||
                other.isWithinRange == isWithinRange) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.residentialAddress, residentialAddress) ||
                other.residentialAddress == residentialAddress) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    distance,
    isDefault,
    userId,
    personId,
    isWithinRange,
    isSelected,
    archived,
    latitude,
    longitude,
    name,
    locationName,
    residentialAddress,
    phone,
    createdAt,
    coordinate,
  );

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(this);
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel({
    final int id,
    final double distance,
    @JsonKey(name: 'is_default') final bool isDefault,
    @JsonKey(name: 'user_id') final int userId,
    @JsonKey(name: 'person_id') final int personId,
    final bool isWithinRange,
    final bool isSelected,
    final bool archived,
    final String latitude,
    final String longitude,
    @JsonKey(name: 'full_name') final String name,
    @JsonKey(name: 'location_name') final String locationName,
    @JsonKey(name: 'residential_address') final String residentialAddress,
    @JsonKey(name: 'phone_number') final String phone,
    @JsonKey(name: 'created_at') final String createdAt,
    final Coordinates coordinate,
  }) = _$AddressModelImpl;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  int get id;
  @override
  double get distance;
  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'person_id')
  int get personId;
  @override
  bool get isWithinRange;
  @override
  bool get isSelected;
  @override
  bool get archived;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(name: 'full_name')
  String get name;
  @override
  @JsonKey(name: 'location_name')
  String get locationName;
  @override
  @JsonKey(name: 'residential_address')
  String get residentialAddress;
  @override
  @JsonKey(name: 'phone_number')
  String get phone;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  Coordinates get coordinate;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
