import 'package:freezed_annotation/freezed_annotation.dart';

part 'redemption_logs.freezed.dart';
part 'redemption_logs.g.dart';

@freezed
class RedemptionLogs with _$RedemptionLogs {
  const factory RedemptionLogs({
    @JsonKey(name: 'account_log_id') @Default(0) int logId,
    @JsonKey(name: 'account_id') @Default(0) int accountId,
    @JsonKey(name: 'account_currency') @Default("GHS") String currency,
    @JsonKey(name: 'balance_after') @Default("0.0") String balanceAfter,
    @JsonKey(name: 'balance_before') @Default("0.0") String balanceBefore,
    @JsonKey(name: 'created_at') @Default("") String transactionDate,
    @Default("") String status,
    @JsonKey(name: 'payment_reference') @Default("") String paymentRef,
    @Default("0.0") String amount,
    @Default("") String branch,
    @Default("") String merchant,
    @JsonKey(name: 'transaction_type') @Default("") String transactionType,
  }) = _RedemptionLogs;

  factory RedemptionLogs.fromJson(Map<String, dynamic> json) =>
      _$RedemptionLogsFromJson(json);
}
