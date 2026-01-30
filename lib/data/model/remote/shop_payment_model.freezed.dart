// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShopPaymentModel _$ShopPaymentModelFromJson(Map<String, dynamic> json) {
  return _ShopPaymentModel.fromJson(json);
}

/// @nodoc
mixin _$ShopPaymentModel {
  String get reference => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get orderStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createAt => throw _privateConstructorUsedError;
  List<OrderModel> get orders => throw _privateConstructorUsedError;

  /// Serializes this ShopPaymentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShopPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShopPaymentModelCopyWith<ShopPaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopPaymentModelCopyWith<$Res> {
  factory $ShopPaymentModelCopyWith(
    ShopPaymentModel value,
    $Res Function(ShopPaymentModel) then,
  ) = _$ShopPaymentModelCopyWithImpl<$Res, ShopPaymentModel>;
  @useResult
  $Res call({
    String reference,
    String amount,
    String status,
    String orderStats,
    @JsonKey(name: 'created_at') String createAt,
    List<OrderModel> orders,
  });
}

/// @nodoc
class _$ShopPaymentModelCopyWithImpl<$Res, $Val extends ShopPaymentModel>
    implements $ShopPaymentModelCopyWith<$Res> {
  _$ShopPaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShopPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? amount = null,
    Object? status = null,
    Object? orderStats = null,
    Object? createAt = null,
    Object? orders = null,
  }) {
    return _then(
      _value.copyWith(
            reference: null == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            orderStats: null == orderStats
                ? _value.orderStats
                : orderStats // ignore: cast_nullable_to_non_nullable
                      as String,
            createAt: null == createAt
                ? _value.createAt
                : createAt // ignore: cast_nullable_to_non_nullable
                      as String,
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<OrderModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShopPaymentModelImplCopyWith<$Res>
    implements $ShopPaymentModelCopyWith<$Res> {
  factory _$$ShopPaymentModelImplCopyWith(
    _$ShopPaymentModelImpl value,
    $Res Function(_$ShopPaymentModelImpl) then,
  ) = __$$ShopPaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String reference,
    String amount,
    String status,
    String orderStats,
    @JsonKey(name: 'created_at') String createAt,
    List<OrderModel> orders,
  });
}

/// @nodoc
class __$$ShopPaymentModelImplCopyWithImpl<$Res>
    extends _$ShopPaymentModelCopyWithImpl<$Res, _$ShopPaymentModelImpl>
    implements _$$ShopPaymentModelImplCopyWith<$Res> {
  __$$ShopPaymentModelImplCopyWithImpl(
    _$ShopPaymentModelImpl _value,
    $Res Function(_$ShopPaymentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? amount = null,
    Object? status = null,
    Object? orderStats = null,
    Object? createAt = null,
    Object? orders = null,
  }) {
    return _then(
      _$ShopPaymentModelImpl(
        reference: null == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        orderStats: null == orderStats
            ? _value.orderStats
            : orderStats // ignore: cast_nullable_to_non_nullable
                  as String,
        createAt: null == createAt
            ? _value.createAt
            : createAt // ignore: cast_nullable_to_non_nullable
                  as String,
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<OrderModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopPaymentModelImpl implements _ShopPaymentModel {
  const _$ShopPaymentModelImpl({
    this.reference = '',
    this.amount = '',
    this.status = '',
    this.orderStats = '',
    @JsonKey(name: 'created_at') this.createAt = '',
    final List<OrderModel> orders = const [],
  }) : _orders = orders;

  factory _$ShopPaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopPaymentModelImplFromJson(json);

  @override
  @JsonKey()
  final String reference;
  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String orderStats;
  @override
  @JsonKey(name: 'created_at')
  final String createAt;
  final List<OrderModel> _orders;
  @override
  @JsonKey()
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'ShopPaymentModel(reference: $reference, amount: $amount, status: $status, orderStats: $orderStats, createAt: $createAt, orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopPaymentModelImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderStats, orderStats) ||
                other.orderStats == orderStats) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reference,
    amount,
    status,
    orderStats,
    createAt,
    const DeepCollectionEquality().hash(_orders),
  );

  /// Create a copy of ShopPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopPaymentModelImplCopyWith<_$ShopPaymentModelImpl> get copyWith =>
      __$$ShopPaymentModelImplCopyWithImpl<_$ShopPaymentModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopPaymentModelImplToJson(this);
  }
}

abstract class _ShopPaymentModel implements ShopPaymentModel {
  const factory _ShopPaymentModel({
    final String reference,
    final String amount,
    final String status,
    final String orderStats,
    @JsonKey(name: 'created_at') final String createAt,
    final List<OrderModel> orders,
  }) = _$ShopPaymentModelImpl;

  factory _ShopPaymentModel.fromJson(Map<String, dynamic> json) =
      _$ShopPaymentModelImpl.fromJson;

  @override
  String get reference;
  @override
  String get amount;
  @override
  String get status;
  @override
  String get orderStats;
  @override
  @JsonKey(name: 'created_at')
  String get createAt;
  @override
  List<OrderModel> get orders;

  /// Create a copy of ShopPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShopPaymentModelImplCopyWith<_$ShopPaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
