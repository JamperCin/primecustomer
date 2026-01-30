// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) {
  return _ShopModel.fromJson(json);
}

/// @nodoc
mixin _$ShopModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: "logo_url")
  String get logo => throw _privateConstructorUsedError;
  Coordinates? get location => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get terms => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_products')
  List<ProductModel> get latestProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ShopModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShopModelCopyWith<ShopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopModelCopyWith<$Res> {
  factory $ShopModelCopyWith(ShopModel value, $Res Function(ShopModel) then) =
      _$ShopModelCopyWithImpl<$Res, ShopModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String code,
    @JsonKey(name: "logo_url") String logo,
    Coordinates? location,
    String description,
    String website,
    String terms,
    bool verified,
    String currency,
    @JsonKey(name: 'latest_products') List<ProductModel> latestProducts,
    @JsonKey(name: 'created_at') String createdAt,
  });

  $CoordinatesCopyWith<$Res>? get location;
}

/// @nodoc
class _$ShopModelCopyWithImpl<$Res, $Val extends ShopModel>
    implements $ShopModelCopyWith<$Res> {
  _$ShopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? logo = null,
    Object? location = freezed,
    Object? description = null,
    Object? website = null,
    Object? terms = null,
    Object? verified = null,
    Object? currency = null,
    Object? latestProducts = null,
    Object? createdAt = null,
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
            logo: null == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                      as String,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as Coordinates?,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            website: null == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                      as String,
            terms: null == terms
                ? _value.terms
                : terms // ignore: cast_nullable_to_non_nullable
                      as String,
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            latestProducts: null == latestProducts
                ? _value.latestProducts
                : latestProducts // ignore: cast_nullable_to_non_nullable
                      as List<ProductModel>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $CoordinatesCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShopModelImplCopyWith<$Res>
    implements $ShopModelCopyWith<$Res> {
  factory _$$ShopModelImplCopyWith(
    _$ShopModelImpl value,
    $Res Function(_$ShopModelImpl) then,
  ) = __$$ShopModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String code,
    @JsonKey(name: "logo_url") String logo,
    Coordinates? location,
    String description,
    String website,
    String terms,
    bool verified,
    String currency,
    @JsonKey(name: 'latest_products') List<ProductModel> latestProducts,
    @JsonKey(name: 'created_at') String createdAt,
  });

  @override
  $CoordinatesCopyWith<$Res>? get location;
}

/// @nodoc
class __$$ShopModelImplCopyWithImpl<$Res>
    extends _$ShopModelCopyWithImpl<$Res, _$ShopModelImpl>
    implements _$$ShopModelImplCopyWith<$Res> {
  __$$ShopModelImplCopyWithImpl(
    _$ShopModelImpl _value,
    $Res Function(_$ShopModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? logo = null,
    Object? location = freezed,
    Object? description = null,
    Object? website = null,
    Object? terms = null,
    Object? verified = null,
    Object? currency = null,
    Object? latestProducts = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ShopModelImpl(
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
        logo: null == logo
            ? _value.logo
            : logo // ignore: cast_nullable_to_non_nullable
                  as String,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as Coordinates?,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        website: null == website
            ? _value.website
            : website // ignore: cast_nullable_to_non_nullable
                  as String,
        terms: null == terms
            ? _value.terms
            : terms // ignore: cast_nullable_to_non_nullable
                  as String,
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        latestProducts: null == latestProducts
            ? _value._latestProducts
            : latestProducts // ignore: cast_nullable_to_non_nullable
                  as List<ProductModel>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopModelImpl implements _ShopModel {
  const _$ShopModelImpl({
    this.id = 0,
    this.name = '',
    this.code = '',
    @JsonKey(name: "logo_url") this.logo = '',
    this.location,
    this.description = '',
    this.website = '',
    this.terms = '',
    this.verified = false,
    this.currency = 'GHS',
    @JsonKey(name: 'latest_products')
    final List<ProductModel> latestProducts = const <ProductModel>[],
    @JsonKey(name: 'created_at') this.createdAt = '',
  }) : _latestProducts = latestProducts;

  factory _$ShopModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey(name: "logo_url")
  final String logo;
  @override
  final Coordinates? location;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String website;
  @override
  @JsonKey()
  final String terms;
  @override
  @JsonKey()
  final bool verified;
  @override
  @JsonKey()
  final String currency;
  final List<ProductModel> _latestProducts;
  @override
  @JsonKey(name: 'latest_products')
  List<ProductModel> get latestProducts {
    if (_latestProducts is EqualUnmodifiableListView) return _latestProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestProducts);
  }

  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'ShopModel(id: $id, name: $name, code: $code, logo: $logo, location: $location, description: $description, website: $website, terms: $terms, verified: $verified, currency: $currency, latestProducts: $latestProducts, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.terms, terms) || other.terms == terms) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(
              other._latestProducts,
              _latestProducts,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    code,
    logo,
    location,
    description,
    website,
    terms,
    verified,
    currency,
    const DeepCollectionEquality().hash(_latestProducts),
    createdAt,
  );

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopModelImplCopyWith<_$ShopModelImpl> get copyWith =>
      __$$ShopModelImplCopyWithImpl<_$ShopModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopModelImplToJson(this);
  }
}

abstract class _ShopModel implements ShopModel {
  const factory _ShopModel({
    final int id,
    final String name,
    final String code,
    @JsonKey(name: "logo_url") final String logo,
    final Coordinates? location,
    final String description,
    final String website,
    final String terms,
    final bool verified,
    final String currency,
    @JsonKey(name: 'latest_products') final List<ProductModel> latestProducts,
    @JsonKey(name: 'created_at') final String createdAt,
  }) = _$ShopModelImpl;

  factory _ShopModel.fromJson(Map<String, dynamic> json) =
      _$ShopModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(name: "logo_url")
  String get logo;
  @override
  Coordinates? get location;
  @override
  String get description;
  @override
  String get website;
  @override
  String get terms;
  @override
  bool get verified;
  @override
  String get currency;
  @override
  @JsonKey(name: 'latest_products')
  List<ProductModel> get latestProducts;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShopModelImplCopyWith<_$ShopModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
