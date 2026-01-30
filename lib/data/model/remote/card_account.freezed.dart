// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardAccount _$CardAccountFromJson(Map<String, dynamic> json) {
  return _CardAccount.fromJson(json);
}

/// @nodoc
mixin _$CardAccount {
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_currency')
  String get accountCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_balance')
  String get currentBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchased_at')
  String get purchasedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'puchase_code')
  String get purchaseCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_discount')
  String get accountDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_id')
  int get cardId => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_status')
  String get accountStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_to')
  String get purchaseTo => throw _privateConstructorUsedError;
  PrimeCardModel get card => throw _privateConstructorUsedError;
  bool get gifted => throw _privateConstructorUsedError;

  /// Serializes this CardAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardAccountCopyWith<CardAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardAccountCopyWith<$Res> {
  factory $CardAccountCopyWith(
    CardAccount value,
    $Res Function(CardAccount) then,
  ) = _$CardAccountCopyWithImpl<$Res, CardAccount>;
  @useResult
  $Res call({
    @JsonKey(name: 'account_id') int accountId,
    @JsonKey(name: 'account_currency') String accountCurrency,
    @JsonKey(name: 'current_balance') String currentBalance,
    @JsonKey(name: 'purchased_at') String purchasedAt,
    @JsonKey(name: 'puchase_code') String purchaseCode,
    @JsonKey(name: 'account_discount') String accountDiscount,
    @JsonKey(name: 'card_id') int cardId,
    bool blocked,
    @JsonKey(name: 'account_status') String accountStatus,
    @JsonKey(name: 'purchase_to') String purchaseTo,
    PrimeCardModel card,
    bool gifted,
  });

  $PrimeCardModelCopyWith<$Res> get card;
}

/// @nodoc
class _$CardAccountCopyWithImpl<$Res, $Val extends CardAccount>
    implements $CardAccountCopyWith<$Res> {
  _$CardAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? accountCurrency = null,
    Object? currentBalance = null,
    Object? purchasedAt = null,
    Object? purchaseCode = null,
    Object? accountDiscount = null,
    Object? cardId = null,
    Object? blocked = null,
    Object? accountStatus = null,
    Object? purchaseTo = null,
    Object? card = null,
    Object? gifted = null,
  }) {
    return _then(
      _value.copyWith(
            accountId: null == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as int,
            accountCurrency: null == accountCurrency
                ? _value.accountCurrency
                : accountCurrency // ignore: cast_nullable_to_non_nullable
                      as String,
            currentBalance: null == currentBalance
                ? _value.currentBalance
                : currentBalance // ignore: cast_nullable_to_non_nullable
                      as String,
            purchasedAt: null == purchasedAt
                ? _value.purchasedAt
                : purchasedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            purchaseCode: null == purchaseCode
                ? _value.purchaseCode
                : purchaseCode // ignore: cast_nullable_to_non_nullable
                      as String,
            accountDiscount: null == accountDiscount
                ? _value.accountDiscount
                : accountDiscount // ignore: cast_nullable_to_non_nullable
                      as String,
            cardId: null == cardId
                ? _value.cardId
                : cardId // ignore: cast_nullable_to_non_nullable
                      as int,
            blocked: null == blocked
                ? _value.blocked
                : blocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            accountStatus: null == accountStatus
                ? _value.accountStatus
                : accountStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            purchaseTo: null == purchaseTo
                ? _value.purchaseTo
                : purchaseTo // ignore: cast_nullable_to_non_nullable
                      as String,
            card: null == card
                ? _value.card
                : card // ignore: cast_nullable_to_non_nullable
                      as PrimeCardModel,
            gifted: null == gifted
                ? _value.gifted
                : gifted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of CardAccount
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
abstract class _$$CardAccountImplCopyWith<$Res>
    implements $CardAccountCopyWith<$Res> {
  factory _$$CardAccountImplCopyWith(
    _$CardAccountImpl value,
    $Res Function(_$CardAccountImpl) then,
  ) = __$$CardAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'account_id') int accountId,
    @JsonKey(name: 'account_currency') String accountCurrency,
    @JsonKey(name: 'current_balance') String currentBalance,
    @JsonKey(name: 'purchased_at') String purchasedAt,
    @JsonKey(name: 'puchase_code') String purchaseCode,
    @JsonKey(name: 'account_discount') String accountDiscount,
    @JsonKey(name: 'card_id') int cardId,
    bool blocked,
    @JsonKey(name: 'account_status') String accountStatus,
    @JsonKey(name: 'purchase_to') String purchaseTo,
    PrimeCardModel card,
    bool gifted,
  });

  @override
  $PrimeCardModelCopyWith<$Res> get card;
}

/// @nodoc
class __$$CardAccountImplCopyWithImpl<$Res>
    extends _$CardAccountCopyWithImpl<$Res, _$CardAccountImpl>
    implements _$$CardAccountImplCopyWith<$Res> {
  __$$CardAccountImplCopyWithImpl(
    _$CardAccountImpl _value,
    $Res Function(_$CardAccountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? accountCurrency = null,
    Object? currentBalance = null,
    Object? purchasedAt = null,
    Object? purchaseCode = null,
    Object? accountDiscount = null,
    Object? cardId = null,
    Object? blocked = null,
    Object? accountStatus = null,
    Object? purchaseTo = null,
    Object? card = null,
    Object? gifted = null,
  }) {
    return _then(
      _$CardAccountImpl(
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as int,
        accountCurrency: null == accountCurrency
            ? _value.accountCurrency
            : accountCurrency // ignore: cast_nullable_to_non_nullable
                  as String,
        currentBalance: null == currentBalance
            ? _value.currentBalance
            : currentBalance // ignore: cast_nullable_to_non_nullable
                  as String,
        purchasedAt: null == purchasedAt
            ? _value.purchasedAt
            : purchasedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        purchaseCode: null == purchaseCode
            ? _value.purchaseCode
            : purchaseCode // ignore: cast_nullable_to_non_nullable
                  as String,
        accountDiscount: null == accountDiscount
            ? _value.accountDiscount
            : accountDiscount // ignore: cast_nullable_to_non_nullable
                  as String,
        cardId: null == cardId
            ? _value.cardId
            : cardId // ignore: cast_nullable_to_non_nullable
                  as int,
        blocked: null == blocked
            ? _value.blocked
            : blocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        accountStatus: null == accountStatus
            ? _value.accountStatus
            : accountStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        purchaseTo: null == purchaseTo
            ? _value.purchaseTo
            : purchaseTo // ignore: cast_nullable_to_non_nullable
                  as String,
        card: null == card
            ? _value.card
            : card // ignore: cast_nullable_to_non_nullable
                  as PrimeCardModel,
        gifted: null == gifted
            ? _value.gifted
            : gifted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CardAccountImpl implements _CardAccount {
  const _$CardAccountImpl({
    @JsonKey(name: 'account_id') this.accountId = 0,
    @JsonKey(name: 'account_currency') this.accountCurrency = '',
    @JsonKey(name: 'current_balance') this.currentBalance = '',
    @JsonKey(name: 'purchased_at') this.purchasedAt = '',
    @JsonKey(name: 'puchase_code') this.purchaseCode = '',
    @JsonKey(name: 'account_discount') this.accountDiscount = '',
    @JsonKey(name: 'card_id') this.cardId = 0,
    this.blocked = false,
    @JsonKey(name: 'account_status') this.accountStatus = '',
    @JsonKey(name: 'purchase_to') this.purchaseTo = '',
    this.card = const PrimeCardModel(),
    this.gifted = false,
  });

  factory _$CardAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardAccountImplFromJson(json);

  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  @JsonKey(name: 'account_currency')
  final String accountCurrency;
  @override
  @JsonKey(name: 'current_balance')
  final String currentBalance;
  @override
  @JsonKey(name: 'purchased_at')
  final String purchasedAt;
  @override
  @JsonKey(name: 'puchase_code')
  final String purchaseCode;
  @override
  @JsonKey(name: 'account_discount')
  final String accountDiscount;
  @override
  @JsonKey(name: 'card_id')
  final int cardId;
  @override
  @JsonKey()
  final bool blocked;
  @override
  @JsonKey(name: 'account_status')
  final String accountStatus;
  @override
  @JsonKey(name: 'purchase_to')
  final String purchaseTo;
  @override
  @JsonKey()
  final PrimeCardModel card;
  @override
  @JsonKey()
  final bool gifted;

  @override
  String toString() {
    return 'CardAccount(accountId: $accountId, accountCurrency: $accountCurrency, currentBalance: $currentBalance, purchasedAt: $purchasedAt, purchaseCode: $purchaseCode, accountDiscount: $accountDiscount, cardId: $cardId, blocked: $blocked, accountStatus: $accountStatus, purchaseTo: $purchaseTo, card: $card, gifted: $gifted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardAccountImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountCurrency, accountCurrency) ||
                other.accountCurrency == accountCurrency) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.purchasedAt, purchasedAt) ||
                other.purchasedAt == purchasedAt) &&
            (identical(other.purchaseCode, purchaseCode) ||
                other.purchaseCode == purchaseCode) &&
            (identical(other.accountDiscount, accountDiscount) ||
                other.accountDiscount == accountDiscount) &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.accountStatus, accountStatus) ||
                other.accountStatus == accountStatus) &&
            (identical(other.purchaseTo, purchaseTo) ||
                other.purchaseTo == purchaseTo) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.gifted, gifted) || other.gifted == gifted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountId,
    accountCurrency,
    currentBalance,
    purchasedAt,
    purchaseCode,
    accountDiscount,
    cardId,
    blocked,
    accountStatus,
    purchaseTo,
    card,
    gifted,
  );

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardAccountImplCopyWith<_$CardAccountImpl> get copyWith =>
      __$$CardAccountImplCopyWithImpl<_$CardAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardAccountImplToJson(this);
  }
}

abstract class _CardAccount implements CardAccount {
  const factory _CardAccount({
    @JsonKey(name: 'account_id') final int accountId,
    @JsonKey(name: 'account_currency') final String accountCurrency,
    @JsonKey(name: 'current_balance') final String currentBalance,
    @JsonKey(name: 'purchased_at') final String purchasedAt,
    @JsonKey(name: 'puchase_code') final String purchaseCode,
    @JsonKey(name: 'account_discount') final String accountDiscount,
    @JsonKey(name: 'card_id') final int cardId,
    final bool blocked,
    @JsonKey(name: 'account_status') final String accountStatus,
    @JsonKey(name: 'purchase_to') final String purchaseTo,
    final PrimeCardModel card,
    final bool gifted,
  }) = _$CardAccountImpl;

  factory _CardAccount.fromJson(Map<String, dynamic> json) =
      _$CardAccountImpl.fromJson;

  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  @JsonKey(name: 'account_currency')
  String get accountCurrency;
  @override
  @JsonKey(name: 'current_balance')
  String get currentBalance;
  @override
  @JsonKey(name: 'purchased_at')
  String get purchasedAt;
  @override
  @JsonKey(name: 'puchase_code')
  String get purchaseCode;
  @override
  @JsonKey(name: 'account_discount')
  String get accountDiscount;
  @override
  @JsonKey(name: 'card_id')
  int get cardId;
  @override
  bool get blocked;
  @override
  @JsonKey(name: 'account_status')
  String get accountStatus;
  @override
  @JsonKey(name: 'purchase_to')
  String get purchaseTo;
  @override
  PrimeCardModel get card;
  @override
  bool get gifted;

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardAccountImplCopyWith<_$CardAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
