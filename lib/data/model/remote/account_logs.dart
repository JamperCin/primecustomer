import 'package:primecustomer/data/model/remote/redemption_logs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_logs.freezed.dart';
part 'account_logs.g.dart';

@freezed
class AccountLogs with _$AccountLogs {
  const factory AccountLogs({
    @JsonKey(name: 'purchased_at') @Default("") String purchasedDate,
    @JsonKey(name: 'account_id') @Default(0) int accountId,
    @JsonKey(name: 'account_currency') @Default("GHS") String currency,
    @JsonKey(name: 'current_balance') @Default("0.0") String balance,
    @JsonKey(name: 'account_discount') @Default("0.0") String discount,
    @JsonKey(name: 'account_status') @Default("") String status,
    @JsonKey(name: 'purchase_to') @Default("") String purchasedTo,
    @Default(false) bool gifted,
    @JsonKey(name: "logs") @Default([]) List<RedemptionLogs> redemptionLogs,
  }) = _AccountLogs;

  factory AccountLogs.fromJson(Map<String, dynamic> json) =>
      _$AccountLogsFromJson(json);
}
