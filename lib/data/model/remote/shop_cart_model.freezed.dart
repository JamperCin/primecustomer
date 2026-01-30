// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShopCartModel _$ShopCartModelFromJson(Map<String, dynamic> json) {
  return _ShopCartModel.fromJson(json);
}

/// @nodoc
mixin _$ShopCartModel {
  @JsonKey(name: "shop_cart_id")
  int get cartId => throw _privateConstructorUsedError;
  @JsonKey(name: "total_items")
  int get totalItems => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "total_amount")
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "net_amount")
  double get netAmount => throw _privateConstructorUsedError;
  double get fees => throw _privateConstructorUsedError;
  List<ProductSummary> get items => throw _privateConstructorUsedError;

  /// Serializes this ShopCartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShopCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShopCartModelCopyWith<ShopCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCartModelCopyWith<$Res> {
  factory $ShopCartModelCopyWith(
    ShopCartModel value,
    $Res Function(ShopCartModel) then,
  ) = _$ShopCartModelCopyWithImpl<$Res, ShopCartModel>;
  @useResult
  $Res call({
    @JsonKey(name: "shop_cart_id") int cartId,
    @JsonKey(name: "total_items") int totalItems,
    @JsonKey(name: "created_at") String createdAt,
    String description,
    @JsonKey(name: "total_amount") double totalAmount,
    @JsonKey(name: "net_amount") double netAmount,
    double fees,
    List<ProductSummary> items,
  });
}

/// @nodoc
class _$ShopCartModelCopyWithImpl<$Res, $Val extends ShopCartModel>
    implements $ShopCartModelCopyWith<$Res> {
  _$ShopCartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShopCartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? totalItems = null,
    Object? createdAt = null,
    Object? description = null,
    Object? totalAmount = null,
    Object? netAmount = null,
    Object? fees = null,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            cartId: null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                      as int,
            totalItems: null == totalItems
                ? _value.totalItems
                : totalItems // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            netAmount: null == netAmount
                ? _value.netAmount
                : netAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            fees: null == fees
                ? _value.fees
                : fees // ignore: cast_nullable_to_non_nullable
                      as double,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<ProductSummary>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShopCartModelImplCopyWith<$Res>
    implements $ShopCartModelCopyWith<$Res> {
  factory _$$ShopCartModelImplCopyWith(
    _$ShopCartModelImpl value,
    $Res Function(_$ShopCartModelImpl) then,
  ) = __$$ShopCartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "shop_cart_id") int cartId,
    @JsonKey(name: "total_items") int totalItems,
    @JsonKey(name: "created_at") String createdAt,
    String description,
    @JsonKey(name: "total_amount") double totalAmount,
    @JsonKey(name: "net_amount") double netAmount,
    double fees,
    List<ProductSummary> items,
  });
}

/// @nodoc
class __$$ShopCartModelImplCopyWithImpl<$Res>
    extends _$ShopCartModelCopyWithImpl<$Res, _$ShopCartModelImpl>
    implements _$$ShopCartModelImplCopyWith<$Res> {
  __$$ShopCartModelImplCopyWithImpl(
    _$ShopCartModelImpl _value,
    $Res Function(_$ShopCartModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopCartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? totalItems = null,
    Object? createdAt = null,
    Object? description = null,
    Object? totalAmount = null,
    Object? netAmount = null,
    Object? fees = null,
    Object? items = null,
  }) {
    return _then(
      _$ShopCartModelImpl(
        cartId: null == cartId
            ? _value.cartId
            : cartId // ignore: cast_nullable_to_non_nullable
                  as int,
        totalItems: null == totalItems
            ? _value.totalItems
            : totalItems // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        netAmount: null == netAmount
            ? _value.netAmount
            : netAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        fees: null == fees
            ? _value.fees
            : fees // ignore: cast_nullable_to_non_nullable
                  as double,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<ProductSummary>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopCartModelImpl implements _ShopCartModel {
  const _$ShopCartModelImpl({
    @JsonKey(name: "shop_cart_id") this.cartId = 0,
    @JsonKey(name: "total_items") this.totalItems = 0,
    @JsonKey(name: "created_at") this.createdAt = "",
    this.description = "",
    @JsonKey(name: "total_amount") this.totalAmount = 0.0,
    @JsonKey(name: "net_amount") this.netAmount = 0.0,
    this.fees = 0.0,
    final List<ProductSummary> items = const <ProductSummary>[],
  }) : _items = items;

  factory _$ShopCartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopCartModelImplFromJson(json);

  @override
  @JsonKey(name: "shop_cart_id")
  final int cartId;
  @override
  @JsonKey(name: "total_items")
  final int totalItems;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: "total_amount")
  final double totalAmount;
  @override
  @JsonKey(name: "net_amount")
  final double netAmount;
  @override
  @JsonKey()
  final double fees;
  final List<ProductSummary> _items;
  @override
  @JsonKey()
  List<ProductSummary> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ShopCartModel(cartId: $cartId, totalItems: $totalItems, createdAt: $createdAt, description: $description, totalAmount: $totalAmount, netAmount: $netAmount, fees: $fees, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopCartModelImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cartId,
    totalItems,
    createdAt,
    description,
    totalAmount,
    netAmount,
    fees,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of ShopCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopCartModelImplCopyWith<_$ShopCartModelImpl> get copyWith =>
      __$$ShopCartModelImplCopyWithImpl<_$ShopCartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopCartModelImplToJson(this);
  }
}

abstract class _ShopCartModel implements ShopCartModel {
  const factory _ShopCartModel({
    @JsonKey(name: "shop_cart_id") final int cartId,
    @JsonKey(name: "total_items") final int totalItems,
    @JsonKey(name: "created_at") final String createdAt,
    final String description,
    @JsonKey(name: "total_amount") final double totalAmount,
    @JsonKey(name: "net_amount") final double netAmount,
    final double fees,
    final List<ProductSummary> items,
  }) = _$ShopCartModelImpl;

  factory _ShopCartModel.fromJson(Map<String, dynamic> json) =
      _$ShopCartModelImpl.fromJson;

  @override
  @JsonKey(name: "shop_cart_id")
  int get cartId;
  @override
  @JsonKey(name: "total_items")
  int get totalItems;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  String get description;
  @override
  @JsonKey(name: "total_amount")
  double get totalAmount;
  @override
  @JsonKey(name: "net_amount")
  double get netAmount;
  @override
  double get fees;
  @override
  List<ProductSummary> get items;

  /// Create a copy of ShopCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShopCartModelImplCopyWith<_$ShopCartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
