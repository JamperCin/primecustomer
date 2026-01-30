// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccountLogs _$AccountLogsFromJson(Map<String, dynamic> json) {
  return _AccountLogs.fromJson(json);
}

/// @nodoc
mixin _$AccountLogs {
  @JsonKey(name: 'purchased_at')
  String get purchasedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_currency')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_balance')
  String get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_discount')
  String get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_to')
  String get purchasedTo => throw _privateConstructorUsedError;
  bool get gifted => throw _privateConstructorUsedError;
  @JsonKey(name: "logs")
  List<RedemptionLogs> get redemptionLogs => throw _privateConstructorUsedError;

  /// Serializes this AccountLogs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountLogsCopyWith<AccountLogs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountLogsCopyWith<$Res> {
  factory $AccountLogsCopyWith(
    AccountLogs value,
    $Res Function(AccountLogs) then,
  ) = _$AccountLogsCopyWithImpl<$Res, AccountLogs>;
  @useResult
  $Res call({
    @JsonKey(name: 'purchased_at') String purchasedDate,
    @JsonKey(name: 'account_id') int accountId,
    @JsonKey(name: 'account_currency') String currency,
    @JsonKey(name: 'current_balance') String balance,
    @JsonKey(name: 'account_discount') String discount,
    @JsonKey(name: 'account_status') String status,
    @JsonKey(name: 'purchase_to') String purchasedTo,
    bool gifted,
    @JsonKey(name: "logs") List<RedemptionLogs> redemptionLogs,
  });
}

/// @nodoc
class _$AccountLogsCopyWithImpl<$Res, $Val extends AccountLogs>
    implements $AccountLogsCopyWith<$Res> {
  _$AccountLogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchasedDate = null,
    Object? accountId = null,
    Object? currency = null,
    Object? balance = null,
    Object? discount = null,
    Object? status = null,
    Object? purchasedTo = null,
    Object? gifted = null,
    Object? redemptionLogs = null,
  }) {
    return _then(
      _value.copyWith(
            purchasedDate: null == purchasedDate
                ? _value.purchasedDate
                : purchasedDate // ignore: cast_nullable_to_non_nullable
                      as String,
            accountId: null == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as int,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            balance: null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as String,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            purchasedTo: null == purchasedTo
                ? _value.purchasedTo
                : purchasedTo // ignore: cast_nullable_to_non_nullable
                      as String,
            gifted: null == gifted
                ? _value.gifted
                : gifted // ignore: cast_nullable_to_non_nullable
                      as bool,
            redemptionLogs: null == redemptionLogs
                ? _value.redemptionLogs
                : redemptionLogs // ignore: cast_nullable_to_non_nullable
                      as List<RedemptionLogs>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccountLogsImplCopyWith<$Res>
    implements $AccountLogsCopyWith<$Res> {
  factory _$$AccountLogsImplCopyWith(
    _$AccountLogsImpl value,
    $Res Function(_$AccountLogsImpl) then,
  ) = __$$AccountLogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'purchased_at') String purchasedDate,
    @JsonKey(name: 'account_id') int accountId,
    @JsonKey(name: 'account_currency') String currency,
    @JsonKey(name: 'current_balance') String balance,
    @JsonKey(name: 'account_discount') String discount,
    @JsonKey(name: 'account_status') String status,
    @JsonKey(name: 'purchase_to') String purchasedTo,
    bool gifted,
    @JsonKey(name: "logs") List<RedemptionLogs> redemptionLogs,
  });
}

/// @nodoc
class __$$AccountLogsImplCopyWithImpl<$Res>
    extends _$AccountLogsCopyWithImpl<$Res, _$AccountLogsImpl>
    implements _$$AccountLogsImplCopyWith<$Res> {
  __$$AccountLogsImplCopyWithImpl(
    _$AccountLogsImpl _value,
    $Res Function(_$AccountLogsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchasedDate = null,
    Object? accountId = null,
    Object? currency = null,
    Object? balance = null,
    Object? discount = null,
    Object? status = null,
    Object? purchasedTo = null,
    Object? gifted = null,
    Object? redemptionLogs = null,
  }) {
    return _then(
      _$AccountLogsImpl(
        purchasedDate: null == purchasedDate
            ? _value.purchasedDate
            : purchasedDate // ignore: cast_nullable_to_non_nullable
                  as String,
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as int,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        balance: null == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as String,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        purchasedTo: null == purchasedTo
            ? _value.purchasedTo
            : purchasedTo // ignore: cast_nullable_to_non_nullable
                  as String,
        gifted: null == gifted
            ? _value.gifted
            : gifted // ignore: cast_nullable_to_non_nullable
                  as bool,
        redemptionLogs: null == redemptionLogs
            ? _value._redemptionLogs
            : redemptionLogs // ignore: cast_nullable_to_non_nullable
                  as List<RedemptionLogs>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountLogsImpl implements _AccountLogs {
  const _$AccountLogsImpl({
    @JsonKey(name: 'purchased_at') this.purchasedDate = "",
    @JsonKey(name: 'account_id') this.accountId = 0,
    @JsonKey(name: 'account_currency') this.currency = "GHS",
    @JsonKey(name: 'current_balance') this.balance = "0.0",
    @JsonKey(name: 'account_discount') this.discount = "0.0",
    @JsonKey(name: 'account_status') this.status = "",
    @JsonKey(name: 'purchase_to') this.purchasedTo = "",
    this.gifted = false,
    @JsonKey(name: "logs") final List<RedemptionLogs> redemptionLogs = const [],
  }) : _redemptionLogs = redemptionLogs;

  factory _$AccountLogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountLogsImplFromJson(json);

  @override
  @JsonKey(name: 'purchased_at')
  final String purchasedDate;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  @JsonKey(name: 'account_currency')
  final String currency;
  @override
  @JsonKey(name: 'current_balance')
  final String balance;
  @override
  @JsonKey(name: 'account_discount')
  final String discount;
  @override
  @JsonKey(name: 'account_status')
  final String status;
  @override
  @JsonKey(name: 'purchase_to')
  final String purchasedTo;
  @override
  @JsonKey()
  final bool gifted;
  final List<RedemptionLogs> _redemptionLogs;
  @override
  @JsonKey(name: "logs")
  List<RedemptionLogs> get redemptionLogs {
    if (_redemptionLogs is EqualUnmodifiableListView) return _redemptionLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_redemptionLogs);
  }

  @override
  String toString() {
    return 'AccountLogs(purchasedDate: $purchasedDate, accountId: $accountId, currency: $currency, balance: $balance, discount: $discount, status: $status, purchasedTo: $purchasedTo, gifted: $gifted, redemptionLogs: $redemptionLogs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountLogsImpl &&
            (identical(other.purchasedDate, purchasedDate) ||
                other.purchasedDate == purchasedDate) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purchasedTo, purchasedTo) ||
                other.purchasedTo == purchasedTo) &&
            (identical(other.gifted, gifted) || other.gifted == gifted) &&
            const DeepCollectionEquality().equals(
              other._redemptionLogs,
              _redemptionLogs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    purchasedDate,
    accountId,
    currency,
    balance,
    discount,
    status,
    purchasedTo,
    gifted,
    const DeepCollectionEquality().hash(_redemptionLogs),
  );

  /// Create a copy of AccountLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountLogsImplCopyWith<_$AccountLogsImpl> get copyWith =>
      __$$AccountLogsImplCopyWithImpl<_$AccountLogsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountLogsImplToJson(this);
  }
}

abstract class _AccountLogs implements AccountLogs {
  const factory _AccountLogs({
    @JsonKey(name: 'purchased_at') final String purchasedDate,
    @JsonKey(name: 'account_id') final int accountId,
    @JsonKey(name: 'account_currency') final String currency,
    @JsonKey(name: 'current_balance') final String balance,
    @JsonKey(name: 'account_discount') final String discount,
    @JsonKey(name: 'account_status') final String status,
    @JsonKey(name: 'purchase_to') final String purchasedTo,
    final bool gifted,
    @JsonKey(name: "logs") final List<RedemptionLogs> redemptionLogs,
  }) = _$AccountLogsImpl;

  factory _AccountLogs.fromJson(Map<String, dynamic> json) =
      _$AccountLogsImpl.fromJson;

  @override
  @JsonKey(name: 'purchased_at')
  String get purchasedDate;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  @JsonKey(name: 'account_currency')
  String get currency;
  @override
  @JsonKey(name: 'current_balance')
  String get balance;
  @override
  @JsonKey(name: 'account_discount')
  String get discount;
  @override
  @JsonKey(name: 'account_status')
  String get status;
  @override
  @JsonKey(name: 'purchase_to')
  String get purchasedTo;
  @override
  bool get gifted;
  @override
  @JsonKey(name: "logs")
  List<RedemptionLogs> get redemptionLogs;

  /// Create a copy of AccountLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountLogsImplCopyWith<_$AccountLogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
