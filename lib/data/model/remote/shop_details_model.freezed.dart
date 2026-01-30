// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShopDetailModel _$ShopDetailModelFromJson(Map<String, dynamic> json) {
  return _ShopDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ShopDetailModel {
  @JsonKey(name: 'shop_products')
  List<ProductModel> get shopProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_details')
  ShopModel get shopDetails => throw _privateConstructorUsedError;

  /// Serializes this ShopDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShopDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShopDetailModelCopyWith<ShopDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDetailModelCopyWith<$Res> {
  factory $ShopDetailModelCopyWith(
    ShopDetailModel value,
    $Res Function(ShopDetailModel) then,
  ) = _$ShopDetailModelCopyWithImpl<$Res, ShopDetailModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'shop_products') List<ProductModel> shopProducts,
    @JsonKey(name: 'shop_details') ShopModel shopDetails,
  });

  $ShopModelCopyWith<$Res> get shopDetails;
}

/// @nodoc
class _$ShopDetailModelCopyWithImpl<$Res, $Val extends ShopDetailModel>
    implements $ShopDetailModelCopyWith<$Res> {
  _$ShopDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShopDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shopProducts = null, Object? shopDetails = null}) {
    return _then(
      _value.copyWith(
            shopProducts: null == shopProducts
                ? _value.shopProducts
                : shopProducts // ignore: cast_nullable_to_non_nullable
                      as List<ProductModel>,
            shopDetails: null == shopDetails
                ? _value.shopDetails
                : shopDetails // ignore: cast_nullable_to_non_nullable
                      as ShopModel,
          )
          as $Val,
    );
  }

  /// Create a copy of ShopDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShopModelCopyWith<$Res> get shopDetails {
    return $ShopModelCopyWith<$Res>(_value.shopDetails, (value) {
      return _then(_value.copyWith(shopDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShopDetailModelImplCopyWith<$Res>
    implements $ShopDetailModelCopyWith<$Res> {
  factory _$$ShopDetailModelImplCopyWith(
    _$ShopDetailModelImpl value,
    $Res Function(_$ShopDetailModelImpl) then,
  ) = __$$ShopDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'shop_products') List<ProductModel> shopProducts,
    @JsonKey(name: 'shop_details') ShopModel shopDetails,
  });

  @override
  $ShopModelCopyWith<$Res> get shopDetails;
}

/// @nodoc
class __$$ShopDetailModelImplCopyWithImpl<$Res>
    extends _$ShopDetailModelCopyWithImpl<$Res, _$ShopDetailModelImpl>
    implements _$$ShopDetailModelImplCopyWith<$Res> {
  __$$ShopDetailModelImplCopyWithImpl(
    _$ShopDetailModelImpl _value,
    $Res Function(_$ShopDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shopProducts = null, Object? shopDetails = null}) {
    return _then(
      _$ShopDetailModelImpl(
        shopProducts: null == shopProducts
            ? _value._shopProducts
            : shopProducts // ignore: cast_nullable_to_non_nullable
                  as List<ProductModel>,
        shopDetails: null == shopDetails
            ? _value.shopDetails
            : shopDetails // ignore: cast_nullable_to_non_nullable
                  as ShopModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopDetailModelImpl implements _ShopDetailModel {
  const _$ShopDetailModelImpl({
    @JsonKey(name: 'shop_products')
    final List<ProductModel> shopProducts = const <ProductModel>[],
    @JsonKey(name: 'shop_details') this.shopDetails = const ShopModel(),
  }) : _shopProducts = shopProducts;

  factory _$ShopDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopDetailModelImplFromJson(json);

  final List<ProductModel> _shopProducts;
  @override
  @JsonKey(name: 'shop_products')
  List<ProductModel> get shopProducts {
    if (_shopProducts is EqualUnmodifiableListView) return _shopProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopProducts);
  }

  @override
  @JsonKey(name: 'shop_details')
  final ShopModel shopDetails;

  @override
  String toString() {
    return 'ShopDetailModel(shopProducts: $shopProducts, shopDetails: $shopDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopDetailModelImpl &&
            const DeepCollectionEquality().equals(
              other._shopProducts,
              _shopProducts,
            ) &&
            (identical(other.shopDetails, shopDetails) ||
                other.shopDetails == shopDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_shopProducts),
    shopDetails,
  );

  /// Create a copy of ShopDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopDetailModelImplCopyWith<_$ShopDetailModelImpl> get copyWith =>
      __$$ShopDetailModelImplCopyWithImpl<_$ShopDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopDetailModelImplToJson(this);
  }
}

abstract class _ShopDetailModel implements ShopDetailModel {
  const factory _ShopDetailModel({
    @JsonKey(name: 'shop_products') final List<ProductModel> shopProducts,
    @JsonKey(name: 'shop_details') final ShopModel shopDetails,
  }) = _$ShopDetailModelImpl;

  factory _ShopDetailModel.fromJson(Map<String, dynamic> json) =
      _$ShopDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'shop_products')
  List<ProductModel> get shopProducts;
  @override
  @JsonKey(name: 'shop_details')
  ShopModel get shopDetails;

  /// Create a copy of ShopDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShopDetailModelImplCopyWith<_$ShopDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
