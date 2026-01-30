// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prime_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrimeCartModelImpl _$$PrimeCartModelImplFromJson(Map<String, dynamic> json) =>
    _$PrimeCartModelImpl(
      status: json['status'] as String? ?? '',
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.00,
      cartId: (json['cart_id'] as num?)?.toInt() ?? 0,
      cards:
          (json['cards'] as List<dynamic>?)
              ?.map((e) => PrimeCardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cartStatus: json['cart_status'] as String? ?? '',
      netAmount: (json['net_amount'] as num?)?.toDouble() ?? 0.00,
      fees: (json['fees'] as num?)?.toDouble() ?? 0.00,
    );

Map<String, dynamic> _$$PrimeCartModelImplToJson(
  _$PrimeCartModelImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'total_amount': instance.totalAmount,
  'cart_id': instance.cartId,
  'cards': instance.cards,
  'cart_status': instance.cartStatus,
  'net_amount': instance.netAmount,
  'fees': instance.fees,
};
