// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  int get id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_amount')
  double get netAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'gross_amount')
  double get grossAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_amount')
  double get unitAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_discount')
  double get totalDiscount => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_status')
  String get deliveryStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_option')
  String get deliveryOption => throw _privateConstructorUsedError;
  Customer get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_information')
  MerchantDetails get client => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  AddressModel get deliveryAddress => throw _privateConstructorUsedError;
  ProductModel get product => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
    OrderModel value,
    $Res Function(OrderModel) then,
  ) = _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call({
    int id,
    int quantity,
    String reference,
    @JsonKey(name: 'net_amount') double netAmount,
    @JsonKey(name: 'gross_amount') double grossAmount,
    @JsonKey(name: 'unit_amount') double unitAmount,
    @JsonKey(name: 'total_discount') double totalDiscount,
    bool selected,
    @JsonKey(name: 'delivery_status') String deliveryStatus,
    @JsonKey(name: 'payment_status') String paymentStatus,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'delivery_option') String deliveryOption,
    Customer customer,
    @JsonKey(name: 'store_information') MerchantDetails client,
    @JsonKey(name: 'delivery_address') AddressModel deliveryAddress,
    ProductModel product,
  });

  $CustomerCopyWith<$Res> get customer;
  $MerchantDetailsCopyWith<$Res> get client;
  $AddressModelCopyWith<$Res> get deliveryAddress;
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? reference = null,
    Object? netAmount = null,
    Object? grossAmount = null,
    Object? unitAmount = null,
    Object? totalDiscount = null,
    Object? selected = null,
    Object? deliveryStatus = null,
    Object? paymentStatus = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deliveryOption = null,
    Object? customer = null,
    Object? client = null,
    Object? deliveryAddress = null,
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
            reference: null == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as String,
            netAmount: null == netAmount
                ? _value.netAmount
                : netAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            grossAmount: null == grossAmount
                ? _value.grossAmount
                : grossAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            unitAmount: null == unitAmount
                ? _value.unitAmount
                : unitAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            totalDiscount: null == totalDiscount
                ? _value.totalDiscount
                : totalDiscount // ignore: cast_nullable_to_non_nullable
                      as double,
            selected: null == selected
                ? _value.selected
                : selected // ignore: cast_nullable_to_non_nullable
                      as bool,
            deliveryStatus: null == deliveryStatus
                ? _value.deliveryStatus
                : deliveryStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentStatus: null == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            deliveryOption: null == deliveryOption
                ? _value.deliveryOption
                : deliveryOption // ignore: cast_nullable_to_non_nullable
                      as String,
            customer: null == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                      as Customer,
            client: null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                      as MerchantDetails,
            deliveryAddress: null == deliveryAddress
                ? _value.deliveryAddress
                : deliveryAddress // ignore: cast_nullable_to_non_nullable
                      as AddressModel,
            product: null == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as ProductModel,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MerchantDetailsCopyWith<$Res> get client {
    return $MerchantDetailsCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get deliveryAddress {
    return $AddressModelCopyWith<$Res>(_value.deliveryAddress, (value) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
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
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
    _$OrderModelImpl value,
    $Res Function(_$OrderModelImpl) then,
  ) = __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int quantity,
    String reference,
    @JsonKey(name: 'net_amount') double netAmount,
    @JsonKey(name: 'gross_amount') double grossAmount,
    @JsonKey(name: 'unit_amount') double unitAmount,
    @JsonKey(name: 'total_discount') double totalDiscount,
    bool selected,
    @JsonKey(name: 'delivery_status') String deliveryStatus,
    @JsonKey(name: 'payment_status') String paymentStatus,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'delivery_option') String deliveryOption,
    Customer customer,
    @JsonKey(name: 'store_information') MerchantDetails client,
    @JsonKey(name: 'delivery_address') AddressModel deliveryAddress,
    ProductModel product,
  });

  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $MerchantDetailsCopyWith<$Res> get client;
  @override
  $AddressModelCopyWith<$Res> get deliveryAddress;
  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
    _$OrderModelImpl _value,
    $Res Function(_$OrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? reference = null,
    Object? netAmount = null,
    Object? grossAmount = null,
    Object? unitAmount = null,
    Object? totalDiscount = null,
    Object? selected = null,
    Object? deliveryStatus = null,
    Object? paymentStatus = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deliveryOption = null,
    Object? customer = null,
    Object? client = null,
    Object? deliveryAddress = null,
    Object? product = null,
  }) {
    return _then(
      _$OrderModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        reference: null == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as String,
        netAmount: null == netAmount
            ? _value.netAmount
            : netAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        grossAmount: null == grossAmount
            ? _value.grossAmount
            : grossAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        unitAmount: null == unitAmount
            ? _value.unitAmount
            : unitAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        totalDiscount: null == totalDiscount
            ? _value.totalDiscount
            : totalDiscount // ignore: cast_nullable_to_non_nullable
                  as double,
        selected: null == selected
            ? _value.selected
            : selected // ignore: cast_nullable_to_non_nullable
                  as bool,
        deliveryStatus: null == deliveryStatus
            ? _value.deliveryStatus
            : deliveryStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentStatus: null == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        deliveryOption: null == deliveryOption
            ? _value.deliveryOption
            : deliveryOption // ignore: cast_nullable_to_non_nullable
                  as String,
        customer: null == customer
            ? _value.customer
            : customer // ignore: cast_nullable_to_non_nullable
                  as Customer,
        client: null == client
            ? _value.client
            : client // ignore: cast_nullable_to_non_nullable
                  as MerchantDetails,
        deliveryAddress: null == deliveryAddress
            ? _value.deliveryAddress
            : deliveryAddress // ignore: cast_nullable_to_non_nullable
                  as AddressModel,
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
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl({
    this.id = 0,
    this.quantity = 0,
    this.reference = '',
    @JsonKey(name: 'net_amount') this.netAmount = 0,
    @JsonKey(name: 'gross_amount') this.grossAmount = 0,
    @JsonKey(name: 'unit_amount') this.unitAmount = 0,
    @JsonKey(name: 'total_discount') this.totalDiscount = 0,
    this.selected = false,
    @JsonKey(name: 'delivery_status') this.deliveryStatus = '',
    @JsonKey(name: 'payment_status') this.paymentStatus = '',
    @JsonKey(name: 'created_at') this.createdAt = '',
    @JsonKey(name: 'updated_at') this.updatedAt = '',
    @JsonKey(name: 'delivery_option') this.deliveryOption = '',
    this.customer = const Customer(),
    @JsonKey(name: 'store_information') this.client = const MerchantDetails(),
    @JsonKey(name: 'delivery_address')
    this.deliveryAddress = const AddressModel(),
    this.product = const ProductModel(),
  });

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final String reference;
  @override
  @JsonKey(name: 'net_amount')
  final double netAmount;
  @override
  @JsonKey(name: 'gross_amount')
  final double grossAmount;
  @override
  @JsonKey(name: 'unit_amount')
  final double unitAmount;
  @override
  @JsonKey(name: 'total_discount')
  final double totalDiscount;
  @override
  @JsonKey()
  final bool selected;
  @override
  @JsonKey(name: 'delivery_status')
  final String deliveryStatus;
  @override
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'delivery_option')
  final String deliveryOption;
  @override
  @JsonKey()
  final Customer customer;
  @override
  @JsonKey(name: 'store_information')
  final MerchantDetails client;
  @override
  @JsonKey(name: 'delivery_address')
  final AddressModel deliveryAddress;
  @override
  @JsonKey()
  final ProductModel product;

  @override
  String toString() {
    return 'OrderModel(id: $id, quantity: $quantity, reference: $reference, netAmount: $netAmount, grossAmount: $grossAmount, unitAmount: $unitAmount, totalDiscount: $totalDiscount, selected: $selected, deliveryStatus: $deliveryStatus, paymentStatus: $paymentStatus, createdAt: $createdAt, updatedAt: $updatedAt, deliveryOption: $deliveryOption, customer: $customer, client: $client, deliveryAddress: $deliveryAddress, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.unitAmount, unitAmount) ||
                other.unitAmount == unitAmount) &&
            (identical(other.totalDiscount, totalDiscount) ||
                other.totalDiscount == totalDiscount) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deliveryOption, deliveryOption) ||
                other.deliveryOption == deliveryOption) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    quantity,
    reference,
    netAmount,
    grossAmount,
    unitAmount,
    totalDiscount,
    selected,
    deliveryStatus,
    paymentStatus,
    createdAt,
    updatedAt,
    deliveryOption,
    customer,
    client,
    deliveryAddress,
    product,
  );

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel({
    final int id,
    final int quantity,
    final String reference,
    @JsonKey(name: 'net_amount') final double netAmount,
    @JsonKey(name: 'gross_amount') final double grossAmount,
    @JsonKey(name: 'unit_amount') final double unitAmount,
    @JsonKey(name: 'total_discount') final double totalDiscount,
    final bool selected,
    @JsonKey(name: 'delivery_status') final String deliveryStatus,
    @JsonKey(name: 'payment_status') final String paymentStatus,
    @JsonKey(name: 'created_at') final String createdAt,
    @JsonKey(name: 'updated_at') final String updatedAt,
    @JsonKey(name: 'delivery_option') final String deliveryOption,
    final Customer customer,
    @JsonKey(name: 'store_information') final MerchantDetails client,
    @JsonKey(name: 'delivery_address') final AddressModel deliveryAddress,
    final ProductModel product,
  }) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  int get id;
  @override
  int get quantity;
  @override
  String get reference;
  @override
  @JsonKey(name: 'net_amount')
  double get netAmount;
  @override
  @JsonKey(name: 'gross_amount')
  double get grossAmount;
  @override
  @JsonKey(name: 'unit_amount')
  double get unitAmount;
  @override
  @JsonKey(name: 'total_discount')
  double get totalDiscount;
  @override
  bool get selected;
  @override
  @JsonKey(name: 'delivery_status')
  String get deliveryStatus;
  @override
  @JsonKey(name: 'payment_status')
  String get paymentStatus;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'delivery_option')
  String get deliveryOption;
  @override
  Customer get customer;
  @override
  @JsonKey(name: 'store_information')
  MerchantDetails get client;
  @override
  @JsonKey(name: 'delivery_address')
  AddressModel get deliveryAddress;
  @override
  ProductModel get product;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
