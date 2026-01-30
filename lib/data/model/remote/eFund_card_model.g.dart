// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eFund_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EfundCardModelImpl _$$EfundCardModelImplFromJson(Map<String, dynamic> json) =>
    _$EfundCardModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      eFundId: (json['efund_id'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      fees: (json['fees'] as num?)?.toDouble() ?? 0.0,
      paid: json['paid'] as bool? ?? false,
      cancelled: json['cancelled'] as bool? ?? false,
      currency: json['currency'] as String? ?? "GHS",
      unitAmount: (json['unit_amount'] as num?)?.toDouble() ?? 0.0,
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discount_amount'] as num?)?.toDouble() ?? 0.0,
      card: json['card'] == null
          ? const PrimeCardModel()
          : PrimeCardModel.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EfundCardModelImplToJson(
  _$EfundCardModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'efund_id': instance.eFundId,
  'quantity': instance.quantity,
  'amount': instance.amount,
  'fees': instance.fees,
  'paid': instance.paid,
  'cancelled': instance.cancelled,
  'currency': instance.currency,
  'unit_amount': instance.unitAmount,
  'total_amount': instance.totalAmount,
  'discount_amount': instance.discountAmount,
  'card': instance.card,
};
