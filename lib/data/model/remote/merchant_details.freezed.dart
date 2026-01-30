// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MerchantDetails _$MerchantDetailsFromJson(Map<String, dynamic> json) {
  return _MerchantDetails.fromJson(json);
}

/// @nodoc
mixin _$MerchantDetails {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code =>
      throw _privateConstructorUsedError; // @Default('') String location,
  String get telephone => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'website_url')
  String get webSiteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_number')
  String get registrationNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_card_price')
  double get minPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_card_price')
  double get maxPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'cordinates')
  Coordinates? get coordinates => throw _privateConstructorUsedError;

  /// Serializes this MerchantDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MerchantDetailsCopyWith<MerchantDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantDetailsCopyWith<$Res> {
  factory $MerchantDetailsCopyWith(
    MerchantDetails value,
    $Res Function(MerchantDetails) then,
  ) = _$MerchantDetailsCopyWithImpl<$Res, MerchantDetails>;
  @useResult
  $Res call({
    int id,
    String name,
    String code,
    String telephone,
    String description,
    bool verified,
    @JsonKey(name: 'logo_url') String logoUrl,
    @JsonKey(name: 'website_url') String webSiteUrl,
    @JsonKey(name: 'registration_number') String registrationNum,
    @JsonKey(name: 'min_card_price') double minPrice,
    @JsonKey(name: 'max_card_price') double maxPrice,
    @JsonKey(name: 'cordinates') Coordinates? coordinates,
  });

  $CoordinatesCopyWith<$Res>? get coordinates;
}

/// @nodoc
class _$MerchantDetailsCopyWithImpl<$Res, $Val extends MerchantDetails>
    implements $MerchantDetailsCopyWith<$Res> {
  _$MerchantDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? telephone = null,
    Object? description = null,
    Object? verified = null,
    Object? logoUrl = null,
    Object? webSiteUrl = null,
    Object? registrationNum = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? coordinates = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            telephone: null == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
            logoUrl: null == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            webSiteUrl: null == webSiteUrl
                ? _value.webSiteUrl
                : webSiteUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            registrationNum: null == registrationNum
                ? _value.registrationNum
                : registrationNum // ignore: cast_nullable_to_non_nullable
                      as String,
            minPrice: null == minPrice
                ? _value.minPrice
                : minPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            maxPrice: null == maxPrice
                ? _value.maxPrice
                : maxPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            coordinates: freezed == coordinates
                ? _value.coordinates
                : coordinates // ignore: cast_nullable_to_non_nullable
                      as Coordinates?,
          )
          as $Val,
    );
  }

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res>? get coordinates {
    if (_value.coordinates == null) {
      return null;
    }

    return $CoordinatesCopyWith<$Res>(_value.coordinates!, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MerchantDetailsImplCopyWith<$Res>
    implements $MerchantDetailsCopyWith<$Res> {
  factory _$$MerchantDetailsImplCopyWith(
    _$MerchantDetailsImpl value,
    $Res Function(_$MerchantDetailsImpl) then,
  ) = __$$MerchantDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String code,
    String telephone,
    String description,
    bool verified,
    @JsonKey(name: 'logo_url') String logoUrl,
    @JsonKey(name: 'website_url') String webSiteUrl,
    @JsonKey(name: 'registration_number') String registrationNum,
    @JsonKey(name: 'min_card_price') double minPrice,
    @JsonKey(name: 'max_card_price') double maxPrice,
    @JsonKey(name: 'cordinates') Coordinates? coordinates,
  });

  @override
  $CoordinatesCopyWith<$Res>? get coordinates;
}

/// @nodoc
class __$$MerchantDetailsImplCopyWithImpl<$Res>
    extends _$MerchantDetailsCopyWithImpl<$Res, _$MerchantDetailsImpl>
    implements _$$MerchantDetailsImplCopyWith<$Res> {
  __$$MerchantDetailsImplCopyWithImpl(
    _$MerchantDetailsImpl _value,
    $Res Function(_$MerchantDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? telephone = null,
    Object? description = null,
    Object? verified = null,
    Object? logoUrl = null,
    Object? webSiteUrl = null,
    Object? registrationNum = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? coordinates = freezed,
  }) {
    return _then(
      _$MerchantDetailsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        telephone: null == telephone
            ? _value.telephone
            : telephone // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
        logoUrl: null == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        webSiteUrl: null == webSiteUrl
            ? _value.webSiteUrl
            : webSiteUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        registrationNum: null == registrationNum
            ? _value.registrationNum
            : registrationNum // ignore: cast_nullable_to_non_nullable
                  as String,
        minPrice: null == minPrice
            ? _value.minPrice
            : minPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        maxPrice: null == maxPrice
            ? _value.maxPrice
            : maxPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        coordinates: freezed == coordinates
            ? _value.coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as Coordinates?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchantDetailsImpl implements _MerchantDetails {
  const _$MerchantDetailsImpl({
    this.id = 0,
    this.name = '',
    this.code = '',
    this.telephone = '',
    this.description = '',
    this.verified = false,
    @JsonKey(name: 'logo_url') this.logoUrl = '',
    @JsonKey(name: 'website_url') this.webSiteUrl = '',
    @JsonKey(name: 'registration_number') this.registrationNum = '',
    @JsonKey(name: 'min_card_price') this.minPrice = 0,
    @JsonKey(name: 'max_card_price') this.maxPrice = 0,
    @JsonKey(name: 'cordinates') this.coordinates,
  });

  factory _$MerchantDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchantDetailsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;
  // @Default('') String location,
  @override
  @JsonKey()
  final String telephone;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool verified;
  @override
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @override
  @JsonKey(name: 'website_url')
  final String webSiteUrl;
  @override
  @JsonKey(name: 'registration_number')
  final String registrationNum;
  @override
  @JsonKey(name: 'min_card_price')
  final double minPrice;
  @override
  @JsonKey(name: 'max_card_price')
  final double maxPrice;
  @override
  @JsonKey(name: 'cordinates')
  final Coordinates? coordinates;

  @override
  String toString() {
    return 'MerchantDetails(id: $id, name: $name, code: $code, telephone: $telephone, description: $description, verified: $verified, logoUrl: $logoUrl, webSiteUrl: $webSiteUrl, registrationNum: $registrationNum, minPrice: $minPrice, maxPrice: $maxPrice, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.webSiteUrl, webSiteUrl) ||
                other.webSiteUrl == webSiteUrl) &&
            (identical(other.registrationNum, registrationNum) ||
                other.registrationNum == registrationNum) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    code,
    telephone,
    description,
    verified,
    logoUrl,
    webSiteUrl,
    registrationNum,
    minPrice,
    maxPrice,
    coordinates,
  );

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantDetailsImplCopyWith<_$MerchantDetailsImpl> get copyWith =>
      __$$MerchantDetailsImplCopyWithImpl<_$MerchantDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchantDetailsImplToJson(this);
  }
}

abstract class _MerchantDetails implements MerchantDetails {
  const factory _MerchantDetails({
    final int id,
    final String name,
    final String code,
    final String telephone,
    final String description,
    final bool verified,
    @JsonKey(name: 'logo_url') final String logoUrl,
    @JsonKey(name: 'website_url') final String webSiteUrl,
    @JsonKey(name: 'registration_number') final String registrationNum,
    @JsonKey(name: 'min_card_price') final double minPrice,
    @JsonKey(name: 'max_card_price') final double maxPrice,
    @JsonKey(name: 'cordinates') final Coordinates? coordinates,
  }) = _$MerchantDetailsImpl;

  factory _MerchantDetails.fromJson(Map<String, dynamic> json) =
      _$MerchantDetailsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code; // @Default('') String location,
  @override
  String get telephone;
  @override
  String get description;
  @override
  bool get verified;
  @override
  @JsonKey(name: 'logo_url')
  String get logoUrl;
  @override
  @JsonKey(name: 'website_url')
  String get webSiteUrl;
  @override
  @JsonKey(name: 'registration_number')
  String get registrationNum;
  @override
  @JsonKey(name: 'min_card_price')
  double get minPrice;
  @override
  @JsonKey(name: 'max_card_price')
  double get maxPrice;
  @override
  @JsonKey(name: 'cordinates')
  Coordinates? get coordinates;

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MerchantDetailsImplCopyWith<_$MerchantDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
