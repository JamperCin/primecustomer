import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_account.freezed.dart';
part 'card_account.g.dart';

@freezed
class CardAccount extends BaseObject with _$CardAccount {
  const factory CardAccount({
    @JsonKey(name: 'account_id') @Default(0) int accountId,
    @JsonKey(name: 'account_currency') @Default('') String accountCurrency,
    @JsonKey(name: 'current_balance') @Default('') String currentBalance,
    @JsonKey(name: 'purchased_at') @Default('') String purchasedAt,
    @JsonKey(name: 'puchase_code') @Default('') String purchaseCode,
    @JsonKey(name: 'account_discount') @Default('') String accountDiscount,
    @JsonKey(name: 'card_id') @Default(0) int cardId,
    @Default(false) bool blocked,
    @JsonKey(name: 'account_status') @Default('') String accountStatus,
    @JsonKey(name: 'purchase_to') @Default('') String purchaseTo,
    @Default(PrimeCardModel()) PrimeCardModel card,
    @Default(false) bool gifted,
  }) = _CardAccount;

  factory CardAccount.fromJson(Map<String, dynamic> json) =>
      _$CardAccountFromJson(json);
}
