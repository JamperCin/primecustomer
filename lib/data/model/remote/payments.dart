import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/person.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'prime_cart_model.dart';

part 'payments.freezed.dart';
part 'payments.g.dart';

@freezed
class Payments extends BaseObject with _$Payments {
  const factory Payments({
    @Default(0) int id,
    @Default('') String ref,
    @JsonKey(name: 'transaction_type') @Default('') String transactionType,
    @Default('') String merchant,
    @Default('') String amount,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @Default(PrimeCartModel()) PrimeCartModel cart,
    @Default(PrimeCardModel()) PrimeCardModel card,
    @Default(Person()) Person person,
    @Default('') String status,
    @JsonKey(name: 'payment_to') @Default('') String paymentTo,
    @JsonKey(name: 'payment_url') @Default('') String paymentUrl,
    @JsonKey(name: 'card_account')
    @Default(CardAccount())
        CardAccount cardAccount,
    @JsonKey(name: 'merchant_meta')
    @Default(MerchantDetails())
        MerchantDetails redeemedMerchant,
  }) = _Payments;

  factory Payments.fromJson(Map<String, dynamic> json) =>
      _$PaymentsFromJson(json);
}
