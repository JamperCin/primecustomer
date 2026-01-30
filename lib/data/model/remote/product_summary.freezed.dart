// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductSummary _$ProductSummaryFromJson(Map<String, dynamic> json) {
  return _ProductSummary.fromJson(json);
}

/// @nodoc
mixin _$ProductSummary {
  int get id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_amount")
  double get unitAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "net_amount")
  double get netAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "gross_amount")
  double get grossAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "payable_amount")
  double get payableAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_discount_amount")
  double get unitDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "total_discount_amount")
  double get totalDiscount => throw _privateConstructorUsedError; //@Default(0.0) double amount,
  double get fees => throw _privateConstructorUsedError;
  String get currency =>
      throw _privateConstructorUsedError; // @JsonKey(name: "total_amount") @Default(0.0) double totalAmount,
  // @JsonKey(name: "discount_amount") @Default(0.0) double discountAmount,
  @JsonKey(name: "discount_percentage")
  String get discountPercent => throw _privateConstructorUsedError;
  ProductModel get product => throw _privateConstructorUsedError;

  /// Serializes this ProductSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductSummaryCopyWith<ProductSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSummaryCopyWith<$Res> {
  factory $ProductSummaryCopyWith(
    ProductSummary value,
    $Res Function(ProductSummary) then,
  ) = _$ProductSummaryCopyWithImpl<$Res, ProductSummary>;
  @useResult
  $Res call({
    int id,
    int quantity,
    @JsonKey(name: "unit_amount") double unitAmount,
    @JsonKey(name: "net_amount") double netAmount,
    @JsonKey(name: "gross_amount") double grossAmount,
    @JsonKey(name: "payable_amount") double payableAmount,
    @JsonKey(name: "unit_discount_amount") double unitDiscount,
    @JsonKey(name: "total_discount_amount") double totalDiscount,
    double fees,
    String currency,
    @JsonKey(name: "discount_percentage") String discountPercent,
    ProductModel product,
  });

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductSummaryCopyWithImpl<$Res, $Val extends ProductSummary>
    implements $ProductSummaryCopyWith<$Res> {
  _$ProductSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? unitAmount = null,
    Object? netAmount = null,
    Object? grossAmount = null,
    Object? payableAmount = null,
    Object? unitDiscount = null,
    Object? totalDiscount = null,
    Object? fees = null,
    Object? currency = null,
    Object? discountPercent = null,
    Object? product = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            unitAmount: null == unitAmount
                ? _value.unitAmount
                : unitAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            netAmount: null == netAmount
                ? _value.netAmount
                : netAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            grossAmount: null == grossAmount
                ? _value.grossAmount
                : grossAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            payableAmount: null == payableAmount
                ? _value.payableAmount
                : payableAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            unitDiscount: null == unitDiscount
                ? _value.unitDiscount
                : unitDiscount // ignore: cast_nullable_to_non_nullable
                      as double,
            totalDiscount: null == totalDiscount
                ? _value.totalDiscount
                : totalDiscount // ignore: cast_nullable_to_non_nullable
                      as double,
            fees: null == fees
                ? _value.fees
                : fees // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            discountPercent: null == discountPercent
                ? _value.discountPercent
                : discountPercent // ignore: cast_nullable_to_non_nullable
                      as String,
            product: null == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as ProductModel,
          )
          as $Val,
    );
  }

  /// Create a copy of ProductSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductSummaryImplCopyWith<$Res>
    implements $ProductSummaryCopyWith<$Res> {
  factory _$$ProductSummaryImplCopyWith(
    _$ProductSummaryImpl value,
    $Res Function(_$ProductSummaryImpl) then,
  ) = __$$ProductSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int quantity,
    @JsonKey(name: "unit_amount") double unitAmount,
    @JsonKey(name: "net_amount") double netAmount,
    @JsonKey(name: "gross_amount") double grossAmount,
    @JsonKey(name: "payable_amount") double payableAmount,
    @JsonKey(name: "unit_discount_amount") double unitDiscount,
    @JsonKey(name: "total_discount_amount") double totalDiscount,
    double fees,
    String currency,
    @JsonKey(name: "discount_percentage") String discountPercent,
    ProductModel product,
  });

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductSummaryImplCopyWithImpl<$Res>
    extends _$ProductSummaryCopyWithImpl<$Res, _$ProductSummaryImpl>
    implements _$$ProductSummaryImplCopyWith<$Res> {
  __$$ProductSummaryImplCopyWithImpl(
    _$ProductSummaryImpl _value,
    $Res Function(_$ProductSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? unitAmount = null,
    Object? netAmount = null,
    Object? grossAmount = null,
    Object? payableAmount = null,
    Object? unitDiscount = null,
    Object? totalDiscount = null,
    Object? fees = null,
    Object? currency = null,
    Object? discountPercent = null,
    Object? product = null,
  }) {
    return _then(
      _$ProductSummaryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitAmount: null == unitAmount
            ? _value.unitAmount
            : unitAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        netAmount: null == netAmount
            ? _value.netAmount
            : netAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        grossAmount: null == grossAmount
            ? _value.grossAmount
            : grossAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        payableAmount: null == payableAmount
            ? _value.payableAmount
            : payableAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        unitDiscount: null == unitDiscount
            ? _value.unitDiscount
            : unitDiscount // ignore: cast_nullable_to_non_nullable
                  as double,
        totalDiscount: null == totalDiscount
            ? _value.totalDiscount
            : totalDiscount // ignore: cast_nullable_to_non_nullable
                  as double,
        fees: null == fees
            ? _value.fees
            : fees // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        discountPercent: null == discountPercent
            ? _value.discountPercent
            : discountPercent // ignore: cast_nullable_to_non_nullable
                  as String,
        product: null == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as ProductModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductSummaryImpl implements _ProductSummary {
  const _$ProductSummaryImpl({
    this.id = 0,
    this.quantity = 0,
    @JsonKey(name: "unit_amount") this.unitAmount = 0.0,
    @JsonKey(name: "net_amount") this.netAmount = 0.0,
    @JsonKey(name: "gross_amount") this.grossAmount = 0.0,
    @JsonKey(name: "payable_amount") this.payableAmount = 0.0,
    @JsonKey(name: "unit_discount_amount") this.unitDiscount = 0.0,
    @JsonKey(name: "total_discount_amount") this.totalDiscount = 0.0,
    this.fees = 0.0,
    this.currency = "",
    @JsonKey(name: "discount_percentage") this.discountPercent = '',
    this.product = const ProductModel(),
  });

  factory _$ProductSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey(name: "unit_amount")
  final double unitAmount;
  @override
  @JsonKey(name: "net_amount")
  final double netAmount;
  @override
  @JsonKey(name: "gross_amount")
  final double grossAmount;
  @override
  @JsonKey(name: "payable_amount")
  final double payableAmount;
  @override
  @JsonKey(name: "unit_discount_amount")
  final double unitDiscount;
  @override
  @JsonKey(name: "total_discount_amount")
  final double totalDiscount;
  //@Default(0.0) double amount,
  @override
  @JsonKey()
  final double fees;
  @override
  @JsonKey()
  final String currency;
  // @JsonKey(name: "total_amount") @Default(0.0) double totalAmount,
  // @JsonKey(name: "discount_amount") @Default(0.0) double discountAmount,
  @override
  @JsonKey(name: "discount_percentage")
  final String discountPercent;
  @override
  @JsonKey()
  final ProductModel product;

  @override
  String toString() {
    return 'ProductSummary(id: $id, quantity: $quantity, unitAmount: $unitAmount, netAmount: $netAmount, grossAmount: $grossAmount, payableAmount: $payableAmount, unitDiscount: $unitDiscount, totalDiscount: $totalDiscount, fees: $fees, currency: $currency, discountPercent: $discountPercent, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitAmount, unitAmount) ||
                other.unitAmount == unitAmount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.payableAmount, payableAmount) ||
                other.payableAmount == payableAmount) &&
            (identical(other.unitDiscount, unitDiscount) ||
                other.unitDiscount == unitDiscount) &&
            (identical(other.totalDiscount, totalDiscount) ||
                other.totalDiscount == totalDiscount) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    quantity,
    unitAmount,
    netAmount,
    grossAmount,
    payableAmount,
    unitDiscount,
    totalDiscount,
    fees,
    currency,
    discountPercent,
    product,
  );

  /// Create a copy of ProductSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSummaryImplCopyWith<_$ProductSummaryImpl> get copyWith =>
      __$$ProductSummaryImplCopyWithImpl<_$ProductSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductSummaryImplToJson(this);
  }
}

abstract class _ProductSummary implements ProductSummary {
  const factory _ProductSummary({
    final int id,
    final int quantity,
    @JsonKey(name: "unit_amount") final double unitAmount,
    @JsonKey(name: "net_amount") final double netAmount,
    @JsonKey(name: "gross_amount") final double grossAmount,
    @JsonKey(name: "payable_amount") final double payableAmount,
    @JsonKey(name: "unit_discount_amount") final double unitDiscount,
    @JsonKey(name: "total_discount_amount") final double totalDiscount,
    final double fees,
    final String currency,
    @JsonKey(name: "discount_percentage") final String discountPercent,
    final ProductModel product,
  }) = _$ProductSummaryImpl;

  factory _ProductSummary.fromJson(Map<String, dynamic> json) =
      _$ProductSummaryImpl.fromJson;

  @override
  int get id;
  @override
  int get quantity;
  @override
  @JsonKey(name: "unit_amount")
  double get unitAmount;
  @override
  @JsonKey(name: "net_amount")
  double get netAmount;
  @override
  @JsonKey(name: "gross_amount")
  double get grossAmount;
  @override
  @JsonKey(name: "payable_amount")
  double get payableAmount;
  @override
  @JsonKey(name: "unit_discount_amount")
  double get unitDiscount;
  @override
  @JsonKey(name: "total_discount_amount")
  double get totalDiscount; //@Default(0.0) double amount,
  @override
  double get fees;
  @override
  String get currency; // @JsonKey(name: "total_amount") @Default(0.0) double totalAmount,
  // @JsonKey(name: "discount_amount") @Default(0.0) double discountAmount,
  @override
  @JsonKey(name: "discount_percentage")
  String get discountPercent;
  @override
  ProductModel get product;

  /// Create a copy of ProductSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductSummaryImplCopyWith<_$ProductSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
