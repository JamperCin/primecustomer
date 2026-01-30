// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prime_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PrimeCartModel _$PrimeCartModelFromJson(Map<String, dynamic> json) {
  return _PrimeCartModel.fromJson(json);
}

/// @nodoc
mixin _$PrimeCartModel {
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'cart_id')
  int get cartId => throw _privateConstructorUsedError;
  List<PrimeCardModel> get cards => throw _privateConstructorUsedError;
  @JsonKey(name: 'cart_status')
  String get cartStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_amount')
  double get netAmount => throw _privateConstructorUsedError;
  double get fees => throw _privateConstructorUsedError;

  /// Serializes this PrimeCartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrimeCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrimeCartModelCopyWith<PrimeCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimeCartModelCopyWith<$Res> {
  factory $PrimeCartModelCopyWith(
    PrimeCartModel value,
    $Res Function(PrimeCartModel) then,
  ) = _$PrimeCartModelCopyWithImpl<$Res, PrimeCartModel>;
  @useResult
  $Res call({
    String status,
    @JsonKey(name: 'total_amount') double totalAmount,
    @JsonKey(name: 'cart_id') int cartId,
    List<PrimeCardModel> cards,
    @JsonKey(name: 'cart_status') String cartStatus,
    @JsonKey(name: 'net_amount') double netAmount,
    double fees,
  });
}

/// @nodoc
class _$PrimeCartModelCopyWithImpl<$Res, $Val extends PrimeCartModel>
    implements $PrimeCartModelCopyWith<$Res> {
  _$PrimeCartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrimeCartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? totalAmount = null,
    Object? cartId = null,
    Object? cards = null,
    Object? cartStatus = null,
    Object? netAmount = null,
    Object? fees = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            cartId: null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                      as int,
            cards: null == cards
                ? _value.cards
                : cards // ignore: cast_nullable_to_non_nullable
                      as List<PrimeCardModel>,
            cartStatus: null == cartStatus
                ? _value.cartStatus
                : cartStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            netAmount: null == netAmount
                ? _value.netAmount
                : netAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            fees: null == fees
                ? _value.fees
                : fees // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrimeCartModelImplCopyWith<$Res>
    implements $PrimeCartModelCopyWith<$Res> {
  factory _$$PrimeCartModelImplCopyWith(
    _$PrimeCartModelImpl value,
    $Res Function(_$PrimeCartModelImpl) then,
  ) = __$$PrimeCartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String status,
    @JsonKey(name: 'total_amount') double totalAmount,
    @JsonKey(name: 'cart_id') int cartId,
    List<PrimeCardModel> cards,
    @JsonKey(name: 'cart_status') String cartStatus,
    @JsonKey(name: 'net_amount') double netAmount,
    double fees,
  });
}

/// @nodoc
class __$$PrimeCartModelImplCopyWithImpl<$Res>
    extends _$PrimeCartModelCopyWithImpl<$Res, _$PrimeCartModelImpl>
    implements _$$PrimeCartModelImplCopyWith<$Res> {
  __$$PrimeCartModelImplCopyWithImpl(
    _$PrimeCartModelImpl _value,
    $Res Function(_$PrimeCartModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrimeCartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? totalAmount = null,
    Object? cartId = null,
    Object? cards = null,
    Object? cartStatus = null,
    Object? netAmount = null,
    Object? fees = null,
  }) {
    return _then(
      _$PrimeCartModelImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        cartId: null == cartId
            ? _value.cartId
            : cartId // ignore: cast_nullable_to_non_nullable
                  as int,
        cards: null == cards
            ? _value._cards
            : cards // ignore: cast_nullable_to_non_nullable
                  as List<PrimeCardModel>,
        cartStatus: null == cartStatus
            ? _value.cartStatus
            : cartStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        netAmount: null == netAmount
            ? _value.netAmount
            : netAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        fees: null == fees
            ? _value.fees
            : fees // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrimeCartModelImpl implements _PrimeCartModel {
  const _$PrimeCartModelImpl({
    this.status = '',
    @JsonKey(name: 'total_amount') this.totalAmount = 0.00,
    @JsonKey(name: 'cart_id') this.cartId = 0,
    final List<PrimeCardModel> cards = const [],
    @JsonKey(name: 'cart_status') this.cartStatus = '',
    @JsonKey(name: 'net_amount') this.netAmount = 0.00,
    this.fees = 0.00,
  }) : _cards = cards;

  factory _$PrimeCartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrimeCartModelImplFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'cart_id')
  final int cartId;
  final List<PrimeCardModel> _cards;
  @override
  @JsonKey()
  List<PrimeCardModel> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  @JsonKey(name: 'cart_status')
  final String cartStatus;
  @override
  @JsonKey(name: 'net_amount')
  final double netAmount;
  @override
  @JsonKey()
  final double fees;

  @override
  String toString() {
    return 'PrimeCartModel(status: $status, totalAmount: $totalAmount, cartId: $cartId, cards: $cards, cartStatus: $cartStatus, netAmount: $netAmount, fees: $fees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrimeCartModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.cartStatus, cartStatus) ||
                other.cartStatus == cartStatus) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.fees, fees) || other.fees == fees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    totalAmount,
    cartId,
    const DeepCollectionEquality().hash(_cards),
    cartStatus,
    netAmount,
    fees,
  );

  /// Create a copy of PrimeCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrimeCartModelImplCopyWith<_$PrimeCartModelImpl> get copyWith =>
      __$$PrimeCartModelImplCopyWithImpl<_$PrimeCartModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrimeCartModelImplToJson(this);
  }
}

abstract class _PrimeCartModel implements PrimeCartModel {
  const factory _PrimeCartModel({
    final String status,
    @JsonKey(name: 'total_amount') final double totalAmount,
    @JsonKey(name: 'cart_id') final int cartId,
    final List<PrimeCardModel> cards,
    @JsonKey(name: 'cart_status') final String cartStatus,
    @JsonKey(name: 'net_amount') final double netAmount,
    final double fees,
  }) = _$PrimeCartModelImpl;

  factory _PrimeCartModel.fromJson(Map<String, dynamic> json) =
      _$PrimeCartModelImpl.fromJson;

  @override
  String get status;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'cart_id')
  int get cartId;
  @override
  List<PrimeCardModel> get cards;
  @override
  @JsonKey(name: 'cart_status')
  String get cartStatus;
  @override
  @JsonKey(name: 'net_amount')
  double get netAmount;
  @override
  double get fees;

  /// Create a copy of PrimeCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrimeCartModelImplCopyWith<_$PrimeCartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
