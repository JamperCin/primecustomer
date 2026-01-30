// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redemption_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RedemptionLogs _$RedemptionLogsFromJson(Map<String, dynamic> json) {
  return _RedemptionLogs.fromJson(json);
}

/// @nodoc
mixin _$RedemptionLogs {
  @JsonKey(name: 'account_log_id')
  int get logId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_currency')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_after')
  String get balanceAfter => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_before')
  String get balanceBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get transactionDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_reference')
  String get paymentRef => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get branch => throw _privateConstructorUsedError;
  String get merchant => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type')
  String get transactionType => throw _privateConstructorUsedError;

  /// Serializes this RedemptionLogs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RedemptionLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RedemptionLogsCopyWith<RedemptionLogs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedemptionLogsCopyWith<$Res> {
  factory $RedemptionLogsCopyWith(
    RedemptionLogs value,
    $Res Function(RedemptionLogs) then,
  ) = _$RedemptionLogsCopyWithImpl<$Res, RedemptionLogs>;
  @useResult
  $Res call({
    @JsonKey(name: 'account_log_id') int logId,
    @JsonKey(name: 'account_id') int accountId,
    @JsonKey(name: 'account_currency') String currency,
    @JsonKey(name: 'balance_after') String balanceAfter,
    @JsonKey(name: 'balance_before') String balanceBefore,
    @JsonKey(name: 'created_at') String transactionDate,
    String status,
    @JsonKey(name: 'payment_reference') String paymentRef,
    String amount,
    String branch,
    String merchant,
    @JsonKey(name: 'transaction_type') String transactionType,
  });
}

/// @nodoc
class _$RedemptionLogsCopyWithImpl<$Res, $Val extends RedemptionLogs>
    implements $RedemptionLogsCopyWith<$Res> {
  _$RedemptionLogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RedemptionLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logId = null,
    Object? accountId = null,
    Object? currency = null,
    Object? balanceAfter = null,
    Object? balanceBefore = null,
    Object? transactionDate = null,
    Object? status = null,
    Object? paymentRef = null,
    Object? amount = null,
    Object? branch = null,
    Object? merchant = null,
    Object? transactionType = null,
  }) {
    return _then(
      _value.copyWith(
            logId: null == logId
                ? _value.logId
                : logId // ignore: cast_nullable_to_non_nullable
                      as int,
            accountId: null == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as int,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            balanceAfter: null == balanceAfter
                ? _value.balanceAfter
                : balanceAfter // ignore: cast_nullable_to_non_nullable
                      as String,
            balanceBefore: null == balanceBefore
                ? _value.balanceBefore
                : balanceBefore // ignore: cast_nullable_to_non_nullable
                      as String,
            transactionDate: null == transactionDate
                ? _value.transactionDate
                : transactionDate // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentRef: null == paymentRef
                ? _value.paymentRef
                : paymentRef // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as String,
            branch: null == branch
                ? _value.branch
                : branch // ignore: cast_nullable_to_non_nullable
                      as String,
            merchant: null == merchant
                ? _value.merchant
                : merchant // ignore: cast_nullable_to_non_nullable
                      as String,
            transactionType: null == transactionType
                ? _value.transactionType
                : transactionType // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RedemptionLogsImplCopyWith<$Res>
    implements $RedemptionLogsCopyWith<$Res> {
  factory _$$RedemptionLogsImplCopyWith(
    _$RedemptionLogsImpl value,
    $Res Function(_$RedemptionLogsImpl) then,
  ) = __$$RedemptionLogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'account_log_id') int logId,
    @JsonKey(name: 'account_id') int accountId,
    @JsonKey(name: 'account_currency') String currency,
    @JsonKey(name: 'balance_after') String balanceAfter,
    @JsonKey(name: 'balance_before') String balanceBefore,
    @JsonKey(name: 'created_at') String transactionDate,
    String status,
    @JsonKey(name: 'payment_reference') String paymentRef,
    String amount,
    String branch,
    String merchant,
    @JsonKey(name: 'transaction_type') String transactionType,
  });
}

/// @nodoc
class __$$RedemptionLogsImplCopyWithImpl<$Res>
    extends _$RedemptionLogsCopyWithImpl<$Res, _$RedemptionLogsImpl>
    implements _$$RedemptionLogsImplCopyWith<$Res> {
  __$$RedemptionLogsImplCopyWithImpl(
    _$RedemptionLogsImpl _value,
    $Res Function(_$RedemptionLogsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RedemptionLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logId = null,
    Object? accountId = null,
    Object? currency = null,
    Object? balanceAfter = null,
    Object? balanceBefore = null,
    Object? transactionDate = null,
    Object? status = null,
    Object? paymentRef = null,
    Object? amount = null,
    Object? branch = null,
    Object? merchant = null,
    Object? transactionType = null,
  }) {
    return _then(
      _$RedemptionLogsImpl(
        logId: null == logId
            ? _value.logId
            : logId // ignore: cast_nullable_to_non_nullable
                  as int,
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as int,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        balanceAfter: null == balanceAfter
            ? _value.balanceAfter
            : balanceAfter // ignore: cast_nullable_to_non_nullable
                  as String,
        balanceBefore: null == balanceBefore
            ? _value.balanceBefore
            : balanceBefore // ignore: cast_nullable_to_non_nullable
                  as String,
        transactionDate: null == transactionDate
            ? _value.transactionDate
            : transactionDate // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentRef: null == paymentRef
            ? _value.paymentRef
            : paymentRef // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as String,
        branch: null == branch
            ? _value.branch
            : branch // ignore: cast_nullable_to_non_nullable
                  as String,
        merchant: null == merchant
            ? _value.merchant
            : merchant // ignore: cast_nullable_to_non_nullable
                  as String,
        transactionType: null == transactionType
            ? _value.transactionType
            : transactionType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RedemptionLogsImpl implements _RedemptionLogs {
  const _$RedemptionLogsImpl({
    @JsonKey(name: 'account_log_id') this.logId = 0,
    @JsonKey(name: 'account_id') this.accountId = 0,
    @JsonKey(name: 'account_currency') this.currency = "GHS",
    @JsonKey(name: 'balance_after') this.balanceAfter = "0.0",
    @JsonKey(name: 'balance_before') this.balanceBefore = "0.0",
    @JsonKey(name: 'created_at') this.transactionDate = "",
    this.status = "",
    @JsonKey(name: 'payment_reference') this.paymentRef = "",
    this.amount = "0.0",
    this.branch = "",
    this.merchant = "",
    @JsonKey(name: 'transaction_type') this.transactionType = "",
  });

  factory _$RedemptionLogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedemptionLogsImplFromJson(json);

  @override
  @JsonKey(name: 'account_log_id')
  final int logId;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  @JsonKey(name: 'account_currency')
  final String currency;
  @override
  @JsonKey(name: 'balance_after')
  final String balanceAfter;
  @override
  @JsonKey(name: 'balance_before')
  final String balanceBefore;
  @override
  @JsonKey(name: 'created_at')
  final String transactionDate;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'payment_reference')
  final String paymentRef;
  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey()
  final String branch;
  @override
  @JsonKey()
  final String merchant;
  @override
  @JsonKey(name: 'transaction_type')
  final String transactionType;

  @override
  String toString() {
    return 'RedemptionLogs(logId: $logId, accountId: $accountId, currency: $currency, balanceAfter: $balanceAfter, balanceBefore: $balanceBefore, transactionDate: $transactionDate, status: $status, paymentRef: $paymentRef, amount: $amount, branch: $branch, merchant: $merchant, transactionType: $transactionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedemptionLogsImpl &&
            (identical(other.logId, logId) || other.logId == logId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.balanceAfter, balanceAfter) ||
                other.balanceAfter == balanceAfter) &&
            (identical(other.balanceBefore, balanceBefore) ||
                other.balanceBefore == balanceBefore) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentRef, paymentRef) ||
                other.paymentRef == paymentRef) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    logId,
    accountId,
    currency,
    balanceAfter,
    balanceBefore,
    transactionDate,
    status,
    paymentRef,
    amount,
    branch,
    merchant,
    transactionType,
  );

  /// Create a copy of RedemptionLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedemptionLogsImplCopyWith<_$RedemptionLogsImpl> get copyWith =>
      __$$RedemptionLogsImplCopyWithImpl<_$RedemptionLogsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RedemptionLogsImplToJson(this);
  }
}

abstract class _RedemptionLogs implements RedemptionLogs {
  const factory _RedemptionLogs({
    @JsonKey(name: 'account_log_id') final int logId,
    @JsonKey(name: 'account_id') final int accountId,
    @JsonKey(name: 'account_currency') final String currency,
    @JsonKey(name: 'balance_after') final String balanceAfter,
    @JsonKey(name: 'balance_before') final String balanceBefore,
    @JsonKey(name: 'created_at') final String transactionDate,
    final String status,
    @JsonKey(name: 'payment_reference') final String paymentRef,
    final String amount,
    final String branch,
    final String merchant,
    @JsonKey(name: 'transaction_type') final String transactionType,
  }) = _$RedemptionLogsImpl;

  factory _RedemptionLogs.fromJson(Map<String, dynamic> json) =
      _$RedemptionLogsImpl.fromJson;

  @override
  @JsonKey(name: 'account_log_id')
  int get logId;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  @JsonKey(name: 'account_currency')
  String get currency;
  @override
  @JsonKey(name: 'balance_after')
  String get balanceAfter;
  @override
  @JsonKey(name: 'balance_before')
  String get balanceBefore;
  @override
  @JsonKey(name: 'created_at')
  String get transactionDate;
  @override
  String get status;
  @override
  @JsonKey(name: 'payment_reference')
  String get paymentRef;
  @override
  String get amount;
  @override
  String get branch;
  @override
  String get merchant;
  @override
  @JsonKey(name: 'transaction_type')
  String get transactionType;

  /// Create a copy of RedemptionLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedemptionLogsImplCopyWith<_$RedemptionLogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
