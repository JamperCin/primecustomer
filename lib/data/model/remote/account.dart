import 'package:primecustomer/data/model/remote/redemption_logs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @Default(0) int id,
    @Default('') String currency,
    @JsonKey(name: 'available_balance') @Default(0.0) double availableBalance,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
