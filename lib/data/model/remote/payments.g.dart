// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentsImpl _$$PaymentsImplFromJson(Map<String, dynamic> json) =>
    _$PaymentsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      ref: json['ref'] as String? ?? '',
      transactionType: json['transaction_type'] as String? ?? '',
      merchant: json['merchant'] as String? ?? '',
      amount: json['amount'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      cart: json['cart'] == null
          ? const PrimeCartModel()
          : PrimeCartModel.fromJson(json['cart'] as Map<String, dynamic>),
      card: json['card'] == null
          ? const PrimeCardModel()
          : PrimeCardModel.fromJson(json['card'] as Map<String, dynamic>),
      person: json['person'] == null
          ? const Person()
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      status: json['status'] as String? ?? '',
      paymentTo: json['payment_to'] as String? ?? '',
      paymentUrl: json['payment_url'] as String? ?? '',
      cardAccount: json['card_account'] == null
          ? const CardAccount()
          : CardAccount.fromJson(json['card_account'] as Map<String, dynamic>),
      redeemedMerchant: json['merchant_meta'] == null
          ? const MerchantDetails()
          : MerchantDetails.fromJson(
              json['merchant_meta'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$PaymentsImplToJson(_$PaymentsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ref': instance.ref,
      'transaction_type': instance.transactionType,
      'merchant': instance.merchant,
      'amount': instance.amount,
      'created_at': instance.createdAt,
      'cart': instance.cart,
      'card': instance.card,
      'person': instance.person,
      'status': instance.status,
      'payment_to': instance.paymentTo,
      'payment_url': instance.paymentUrl,
      'card_account': instance.cardAccount,
      'merchant_meta': instance.redeemedMerchant,
    };
