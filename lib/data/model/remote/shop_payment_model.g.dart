// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopPaymentModelImpl _$$ShopPaymentModelImplFromJson(
  Map<String, dynamic> json,
) => _$ShopPaymentModelImpl(
  reference: json['reference'] as String? ?? '',
  amount: json['amount'] as String? ?? '',
  status: json['status'] as String? ?? '',
  orderStats: json['orderStats'] as String? ?? '',
  createAt: json['created_at'] as String? ?? '',
  orders:
      (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ShopPaymentModelImplToJson(
  _$ShopPaymentModelImpl instance,
) => <String, dynamic>{
  'reference': instance.reference,
  'amount': instance.amount,
  'status': instance.status,
  'orderStats': instance.orderStats,
  'created_at': instance.createAt,
  'orders': instance.orders,
};
