// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RedemptionLogsImpl _$$RedemptionLogsImplFromJson(Map<String, dynamic> json) =>
    _$RedemptionLogsImpl(
      logId: (json['account_log_id'] as num?)?.toInt() ?? 0,
      accountId: (json['account_id'] as num?)?.toInt() ?? 0,
      currency: json['account_currency'] as String? ?? "GHS",
      balanceAfter: json['balance_after'] as String? ?? "0.0",
      balanceBefore: json['balance_before'] as String? ?? "0.0",
      transactionDate: json['created_at'] as String? ?? "",
      status: json['status'] as String? ?? "",
      paymentRef: json['payment_reference'] as String? ?? "",
      amount: json['amount'] as String? ?? "0.0",
      branch: json['branch'] as String? ?? "",
      merchant: json['merchant'] as String? ?? "",
      transactionType: json['transaction_type'] as String? ?? "",
    );

Map<String, dynamic> _$$RedemptionLogsImplToJson(
  _$RedemptionLogsImpl instance,
) => <String, dynamic>{
  'account_log_id': instance.logId,
  'account_id': instance.accountId,
  'account_currency': instance.currency,
  'balance_after': instance.balanceAfter,
  'balance_before': instance.balanceBefore,
  'created_at': instance.transactionDate,
  'status': instance.status,
  'payment_reference': instance.paymentRef,
  'amount': instance.amount,
  'branch': instance.branch,
  'merchant': instance.merchant,
  'transaction_type': instance.transactionType,
};
