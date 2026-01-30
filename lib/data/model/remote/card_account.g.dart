// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardAccountImpl _$$CardAccountImplFromJson(Map<String, dynamic> json) =>
    _$CardAccountImpl(
      accountId: (json['account_id'] as num?)?.toInt() ?? 0,
      accountCurrency: json['account_currency'] as String? ?? '',
      currentBalance: json['current_balance'] as String? ?? '',
      purchasedAt: json['purchased_at'] as String? ?? '',
      purchaseCode: json['puchase_code'] as String? ?? '',
      accountDiscount: json['account_discount'] as String? ?? '',
      cardId: (json['card_id'] as num?)?.toInt() ?? 0,
      blocked: json['blocked'] as bool? ?? false,
      accountStatus: json['account_status'] as String? ?? '',
      purchaseTo: json['purchase_to'] as String? ?? '',
      card: json['card'] == null
          ? const PrimeCardModel()
          : PrimeCardModel.fromJson(json['card'] as Map<String, dynamic>),
      gifted: json['gifted'] as bool? ?? false,
    );

Map<String, dynamic> _$$CardAccountImplToJson(_$CardAccountImpl instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'account_currency': instance.accountCurrency,
      'current_balance': instance.currentBalance,
      'purchased_at': instance.purchasedAt,
      'puchase_code': instance.purchaseCode,
      'account_discount': instance.accountDiscount,
      'card_id': instance.cardId,
      'blocked': instance.blocked,
      'account_status': instance.accountStatus,
      'purchase_to': instance.purchaseTo,
      'card': instance.card,
      'gifted': instance.gifted,
    };
