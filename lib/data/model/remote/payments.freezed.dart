// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Payments _$PaymentsFromJson(Map<String, dynamic> json) {
  return _Payments.fromJson(json);
}

/// @nodoc
mixin _$Payments {
  int get id => throw _privateConstructorUsedError;
  String get ref => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type')
  String get transactionType => throw _privateConstructorUsedError;
  String get merchant => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  PrimeCartModel get cart => throw _privateConstructorUsedError;
  PrimeCardModel get card => throw _privateConstructorUsedError;
  Person get person => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_to')
  String get paymentTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_url')
  String get paymentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_account')
  CardAccount get cardAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'merchant_meta')
  MerchantDetails get redeemedMerchant => throw _privateConstructorUsedError;

  /// Serializes this Payments to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentsCopyWith<Payments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentsCopyWith<$Res> {
  factory $PaymentsCopyWith(Payments value, $Res Function(Payments) then) =
      _$PaymentsCopyWithImpl<$Res, Payments>;
  @useResult
  $Res call({
    int id,
    String ref,
    @JsonKey(name: 'transaction_type') String transactionType,
    String merchant,
    String amount,
    @JsonKey(name: 'created_at') String createdAt,
    PrimeCartModel cart,
    PrimeCardModel card,
    Person person,
    String status,
    @JsonKey(name: 'payment_to') String paymentTo,
    @JsonKey(name: 'payment_url') String paymentUrl,
    @JsonKey(name: 'card_account') CardAccount cardAccount,
    @JsonKey(name: 'merchant_meta') MerchantDetails redeemedMerchant,
  });

  $PrimeCartModelCopyWith<$Res> get cart;
  $PrimeCardModelCopyWith<$Res> get card;
  $PersonCopyWith<$Res> get person;
  $CardAccountCopyWith<$Res> get cardAccount;
  $MerchantDetailsCopyWith<$Res> get redeemedMerchant;
}

/// @nodoc
class _$PaymentsCopyWithImpl<$Res, $Val extends Payments>
    implements $PaymentsCopyWith<$Res> {
  _$PaymentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ref = null,
    Object? transactionType = null,
    Object? merchant = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? cart = null,
    Object? card = null,
    Object? person = null,
    Object? status = null,
    Object? paymentTo = null,
    Object? paymentUrl = null,
    Object? cardAccount = null,
    Object? redeemedMerchant = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            ref: null == ref
                ? _value.ref
                : ref // ignore: cast_nullable_to_non_nullable
                      as String,
            transactionType: null == transactionType
                ? _value.transactionType
                : transactionType // ignore: cast_nullable_to_non_nullable
                      as String,
            merchant: null == merchant
                ? _value.merchant
                : merchant // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            cart: null == cart
                ? _value.cart
                : cart // ignore: cast_nullable_to_non_nullable
                      as PrimeCartModel,
            card: null == card
                ? _value.card
                : card // ignore: cast_nullable_to_non_nullable
                      as PrimeCardModel,
            person: null == person
                ? _value.person
                : person // ignore: cast_nullable_to_non_nullable
                      as Person,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentTo: null == paymentTo
                ? _value.paymentTo
                : paymentTo // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentUrl: null == paymentUrl
                ? _value.paymentUrl
                : paymentUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            cardAccount: null == cardAccount
                ? _value.cardAccount
                : cardAccount // ignore: cast_nullable_to_non_nullable
                      as CardAccount,
            redeemedMerchant: null == redeemedMerchant
                ? _value.redeemedMerchant
                : redeemedMerchant // ignore: cast_nullable_to_non_nullable
                      as MerchantDetails,
          )
          as $Val,
    );
  }

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrimeCartModelCopyWith<$Res> get cart {
    return $PrimeCartModelCopyWith<$Res>(_value.cart, (value) {
      return _then(_value.copyWith(cart: value) as $Val);
    });
  }

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrimeCardModelCopyWith<$Res> get card {
    return $PrimeCardModelCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get person {
    return $PersonCopyWith<$Res>(_value.person, (value) {
      return _then(_value.copyWith(person: value) as $Val);
    });
  }

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardAccountCopyWith<$Res> get cardAccount {
    return $CardAccountCopyWith<$Res>(_value.cardAccount, (value) {
      return _then(_value.copyWith(cardAccount: value) as $Val);
    });
  }

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MerchantDetailsCopyWith<$Res> get redeemedMerchant {
    return $MerchantDetailsCopyWith<$Res>(_value.redeemedMerchant, (value) {
      return _then(_value.copyWith(redeemedMerchant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentsImplCopyWith<$Res>
    implements $PaymentsCopyWith<$Res> {
  factory _$$PaymentsImplCopyWith(
    _$PaymentsImpl value,
    $Res Function(_$PaymentsImpl) then,
  ) = __$$PaymentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String ref,
    @JsonKey(name: 'transaction_type') String transactionType,
    String merchant,
    String amount,
    @JsonKey(name: 'created_at') String createdAt,
    PrimeCartModel cart,
    PrimeCardModel card,
    Person person,
    String status,
    @JsonKey(name: 'payment_to') String paymentTo,
    @JsonKey(name: 'payment_url') String paymentUrl,
    @JsonKey(name: 'card_account') CardAccount cardAccount,
    @JsonKey(name: 'merchant_meta') MerchantDetails redeemedMerchant,
  });

  @override
  $PrimeCartModelCopyWith<$Res> get cart;
  @override
  $PrimeCardModelCopyWith<$Res> get card;
  @override
  $PersonCopyWith<$Res> get person;
  @override
  $CardAccountCopyWith<$Res> get cardAccount;
  @override
  $MerchantDetailsCopyWith<$Res> get redeemedMerchant;
}

/// @nodoc
class __$$PaymentsImplCopyWithImpl<$Res>
    extends _$PaymentsCopyWithImpl<$Res, _$PaymentsImpl>
    implements _$$PaymentsImplCopyWith<$Res> {
  __$$PaymentsImplCopyWithImpl(
    _$PaymentsImpl _value,
    $Res Function(_$PaymentsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ref = null,
    Object? transactionType = null,
    Object? merchant = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? cart = null,
    Object? card = null,
    Object? person = null,
    Object? status = null,
    Object? paymentTo = null,
    Object? paymentUrl = null,
    Object? cardAccount = null,
    Object? redeemedMerchant = null,
  }) {
    return _then(
      _$PaymentsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        ref: null == ref
            ? _value.ref
            : ref // ignore: cast_nullable_to_non_nullable
                  as String,
        transactionType: null == transactionType
            ? _value.transactionType
            : transactionType // ignore: cast_nullable_to_non_nullable
                  as String,
        merchant: null == merchant
            ? _value.merchant
            : merchant // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        cart: null == cart
            ? _value.cart
            : cart // ignore: cast_nullable_to_non_nullable
                  as PrimeCartModel,
        card: null == card
            ? _value.card
            : card // ignore: cast_nullable_to_non_nullable
                  as PrimeCardModel,
        person: null == person
            ? _value.person
            : person // ignore: cast_nullable_to_non_nullable
                  as Person,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentTo: null == paymentTo
            ? _value.paymentTo
            : paymentTo // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentUrl: null == paymentUrl
            ? _value.paymentUrl
            : paymentUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        cardAccount: null == cardAccount
            ? _value.cardAccount
            : cardAccount // ignore: cast_nullable_to_non_nullable
                  as CardAccount,
        redeemedMerchant: null == redeemedMerchant
            ? _value.redeemedMerchant
            : redeemedMerchant // ignore: cast_nullable_to_non_nullable
                  as MerchantDetails,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentsImpl implements _Payments {
  const _$PaymentsImpl({
    this.id = 0,
    this.ref = '',
    @JsonKey(name: 'transaction_type') this.transactionType = '',
    this.merchant = '',
    this.amount = '',
    @JsonKey(name: 'created_at') this.createdAt = '',
    this.cart = const PrimeCartModel(),
    this.card = const PrimeCardModel(),
    this.person = const Person(),
    this.status = '',
    @JsonKey(name: 'payment_to') this.paymentTo = '',
    @JsonKey(name: 'payment_url') this.paymentUrl = '',
    @JsonKey(name: 'card_account') this.cardAccount = const CardAccount(),
    @JsonKey(name: 'merchant_meta')
    this.redeemedMerchant = const MerchantDetails(),
  });

  factory _$PaymentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String ref;
  @override
  @JsonKey(name: 'transaction_type')
  final String transactionType;
  @override
  @JsonKey()
  final String merchant;
  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey()
  final PrimeCartModel cart;
  @override
  @JsonKey()
  final PrimeCardModel card;
  @override
  @JsonKey()
  final Person person;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'payment_to')
  final String paymentTo;
  @override
  @JsonKey(name: 'payment_url')
  final String paymentUrl;
  @override
  @JsonKey(name: 'card_account')
  final CardAccount cardAccount;
  @override
  @JsonKey(name: 'merchant_meta')
  final MerchantDetails redeemedMerchant;

  @override
  String toString() {
    return 'Payments(id: $id, ref: $ref, transactionType: $transactionType, merchant: $merchant, amount: $amount, createdAt: $createdAt, cart: $cart, card: $card, person: $person, status: $status, paymentTo: $paymentTo, paymentUrl: $paymentUrl, cardAccount: $cardAccount, redeemedMerchant: $redeemedMerchant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentTo, paymentTo) ||
                other.paymentTo == paymentTo) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.cardAccount, cardAccount) ||
                other.cardAccount == cardAccount) &&
            (identical(other.redeemedMerchant, redeemedMerchant) ||
                other.redeemedMerchant == redeemedMerchant));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    ref,
    transactionType,
    merchant,
    amount,
    createdAt,
    cart,
    card,
    person,
    status,
    paymentTo,
    paymentUrl,
    cardAccount,
    redeemedMerchant,
  );

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentsImplCopyWith<_$PaymentsImpl> get copyWith =>
      __$$PaymentsImplCopyWithImpl<_$PaymentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentsImplToJson(this);
  }
}

abstract class _Payments implements Payments {
  const factory _Payments({
    final int id,
    final String ref,
    @JsonKey(name: 'transaction_type') final String transactionType,
    final String merchant,
    final String amount,
    @JsonKey(name: 'created_at') final String createdAt,
    final PrimeCartModel cart,
    final PrimeCardModel card,
    final Person person,
    final String status,
    @JsonKey(name: 'payment_to') final String paymentTo,
    @JsonKey(name: 'payment_url') final String paymentUrl,
    @JsonKey(name: 'card_account') final CardAccount cardAccount,
    @JsonKey(name: 'merchant_meta') final MerchantDetails redeemedMerchant,
  }) = _$PaymentsImpl;

  factory _Payments.fromJson(Map<String, dynamic> json) =
      _$PaymentsImpl.fromJson;

  @override
  int get id;
  @override
  String get ref;
  @override
  @JsonKey(name: 'transaction_type')
  String get transactionType;
  @override
  String get merchant;
  @override
  String get amount;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  PrimeCartModel get cart;
  @override
  PrimeCardModel get card;
  @override
  Person get person;
  @override
  String get status;
  @override
  @JsonKey(name: 'payment_to')
  String get paymentTo;
  @override
  @JsonKey(name: 'payment_url')
  String get paymentUrl;
  @override
  @JsonKey(name: 'card_account')
  CardAccount get cardAccount;
  @override
  @JsonKey(name: 'merchant_meta')
  MerchantDetails get redeemedMerchant;

  /// Create a copy of Payments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentsImplCopyWith<_$PaymentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
