// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eFund_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EfundCardModel _$EfundCardModelFromJson(Map<String, dynamic> json) {
  return _EfundCardModel.fromJson(json);
}

/// @nodoc
mixin _$EfundCardModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "efund_id")
  int get eFundId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get fees => throw _privateConstructorUsedError;
  bool get paid => throw _privateConstructorUsedError;
  bool get cancelled => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_amount")
  double get unitAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "total_amount")
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_amount")
  double get discountAmount => throw _privateConstructorUsedError;
  PrimeCardModel get card => throw _privateConstructorUsedError;

  /// Serializes this EfundCardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EfundCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EfundCardModelCopyWith<EfundCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EfundCardModelCopyWith<$Res> {
  factory $EfundCardModelCopyWith(
    EfundCardModel value,
    $Res Function(EfundCardModel) then,
  ) = _$EfundCardModelCopyWithImpl<$Res, EfundCardModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: "efund_id") int eFundId,
    int quantity,
    double amount,
    double fees,
    bool paid,
    bool cancelled,
    String currency,
    @JsonKey(name: "unit_amount") double unitAmount,
    @JsonKey(name: "total_amount") double totalAmount,
    @JsonKey(name: "discount_amount") double discountAmount,
    PrimeCardModel card,
  });

  $PrimeCardModelCopyWith<$Res> get card;
}

/// @nodoc
class _$EfundCardModelCopyWithImpl<$Res, $Val extends EfundCardModel>
    implements $EfundCardModelCopyWith<$Res> {
  _$EfundCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EfundCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eFundId = null,
    Object? quantity = null,
    Object? amount = null,
    Object? fees = null,
    Object? paid = null,
    Object? cancelled = null,
    Object? currency = null,
    Object? unitAmount = null,
    Object? totalAmount = null,
    Object? discountAmount = null,
    Object? card = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            eFundId: null == eFundId
                ? _value.eFundId
                : eFundId // ignore: cast_nullable_to_non_nullable
                      as int,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            fees: null == fees
                ? _value.fees
                : fees // ignore: cast_nullable_to_non_nullable
                      as double,
            paid: null == paid
                ? _value.paid
                : paid // ignore: cast_nullable_to_non_nullable
                      as bool,
            cancelled: null == cancelled
                ? _value.cancelled
                : cancelled // ignore: cast_nullable_to_non_nullable
                      as bool,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            unitAmount: null == unitAmount
                ? _value.unitAmount
                : unitAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            discountAmount: null == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            card: null == card
                ? _value.card
                : card // ignore: cast_nullable_to_non_nullable
                      as PrimeCardModel,
          )
          as $Val,
    );
  }

  /// Create a copy of EfundCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrimeCardModelCopyWith<$Res> get card {
    return $PrimeCardModelCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EfundCardModelImplCopyWith<$Res>
    implements $EfundCardModelCopyWith<$Res> {
  factory _$$EfundCardModelImplCopyWith(
    _$EfundCardModelImpl value,
    $Res Function(_$EfundCardModelImpl) then,
  ) = __$$EfundCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: "efund_id") int eFundId,
    int quantity,
    double amount,
    double fees,
    bool paid,
    bool cancelled,
    String currency,
    @JsonKey(name: "unit_amount") double unitAmount,
    @JsonKey(name: "total_amount") double totalAmount,
    @JsonKey(name: "discount_amount") double discountAmount,
    PrimeCardModel card,
  });

  @override
  $PrimeCardModelCopyWith<$Res> get card;
}

/// @nodoc
class __$$EfundCardModelImplCopyWithImpl<$Res>
    extends _$EfundCardModelCopyWithImpl<$Res, _$EfundCardModelImpl>
    implements _$$EfundCardModelImplCopyWith<$Res> {
  __$$EfundCardModelImplCopyWithImpl(
    _$EfundCardModelImpl _value,
    $Res Function(_$EfundCardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EfundCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eFundId = null,
    Object? quantity = null,
    Object? amount = null,
    Object? fees = null,
    Object? paid = null,
    Object? cancelled = null,
    Object? currency = null,
    Object? unitAmount = null,
    Object? totalAmount = null,
    Object? discountAmount = null,
    Object? card = null,
  }) {
    return _then(
      _$EfundCardModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        eFundId: null == eFundId
            ? _value.eFundId
            : eFundId // ignore: cast_nullable_to_non_nullable
                  as int,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        fees: null == fees
            ? _value.fees
            : fees // ignore: cast_nullable_to_non_nullable
                  as double,
        paid: null == paid
            ? _value.paid
            : paid // ignore: cast_nullable_to_non_nullable
                  as bool,
        cancelled: null == cancelled
            ? _value.cancelled
            : cancelled // ignore: cast_nullable_to_non_nullable
                  as bool,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        unitAmount: null == unitAmount
            ? _value.unitAmount
            : unitAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        discountAmount: null == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        card: null == card
            ? _value.card
            : card // ignore: cast_nullable_to_non_nullable
                  as PrimeCardModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EfundCardModelImpl implements _EfundCardModel {
  const _$EfundCardModelImpl({
    this.id = 0,
    @JsonKey(name: "efund_id") this.eFundId = 0,
    this.quantity = 0,
    this.amount = 0.0,
    this.fees = 0.0,
    this.paid = false,
    this.cancelled = false,
    this.currency = "GHS",
    @JsonKey(name: "unit_amount") this.unitAmount = 0.0,
    @JsonKey(name: "total_amount") this.totalAmount = 0.0,
    @JsonKey(name: "discount_amount") this.discountAmount = 0.0,
    this.card = const PrimeCardModel(),
  });

  factory _$EfundCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EfundCardModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: "efund_id")
  final int eFundId;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final double fees;
  @override
  @JsonKey()
  final bool paid;
  @override
  @JsonKey()
  final bool cancelled;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: "unit_amount")
  final double unitAmount;
  @override
  @JsonKey(name: "total_amount")
  final double totalAmount;
  @override
  @JsonKey(name: "discount_amount")
  final double discountAmount;
  @override
  @JsonKey()
  final PrimeCardModel card;

  @override
  String toString() {
    return 'EfundCardModel(id: $id, eFundId: $eFundId, quantity: $quantity, amount: $amount, fees: $fees, paid: $paid, cancelled: $cancelled, currency: $currency, unitAmount: $unitAmount, totalAmount: $totalAmount, discountAmount: $discountAmount, card: $card)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EfundCardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eFundId, eFundId) || other.eFundId == eFundId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.cancelled, cancelled) ||
                other.cancelled == cancelled) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.unitAmount, unitAmount) ||
                other.unitAmount == unitAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.card, card) || other.card == card));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    eFundId,
    quantity,
    amount,
    fees,
    paid,
    cancelled,
    currency,
    unitAmount,
    totalAmount,
    discountAmount,
    card,
  );

  /// Create a copy of EfundCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EfundCardModelImplCopyWith<_$EfundCardModelImpl> get copyWith =>
      __$$EfundCardModelImplCopyWithImpl<_$EfundCardModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EfundCardModelImplToJson(this);
  }
}

abstract class _EfundCardModel implements EfundCardModel {
  const factory _EfundCardModel({
    final int id,
    @JsonKey(name: "efund_id") final int eFundId,
    final int quantity,
    final double amount,
    final double fees,
    final bool paid,
    final bool cancelled,
    final String currency,
    @JsonKey(name: "unit_amount") final double unitAmount,
    @JsonKey(name: "total_amount") final double totalAmount,
    @JsonKey(name: "discount_amount") final double discountAmount,
    final PrimeCardModel card,
  }) = _$EfundCardModelImpl;

  factory _EfundCardModel.fromJson(Map<String, dynamic> json) =
      _$EfundCardModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "efund_id")
  int get eFundId;
  @override
  int get quantity;
  @override
  double get amount;
  @override
  double get fees;
  @override
  bool get paid;
  @override
  bool get cancelled;
  @override
  String get currency;
  @override
  @JsonKey(name: "unit_amount")
  double get unitAmount;
  @override
  @JsonKey(name: "total_amount")
  double get totalAmount;
  @override
  @JsonKey(name: "discount_amount")
  double get discountAmount;
  @override
  PrimeCardModel get card;

  /// Create a copy of EfundCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EfundCardModelImplCopyWith<_$EfundCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
