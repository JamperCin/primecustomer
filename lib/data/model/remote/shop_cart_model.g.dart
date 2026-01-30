// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopCartModelImpl _$$ShopCartModelImplFromJson(Map<String, dynamic> json) =>
    _$ShopCartModelImpl(
      cartId: (json['shop_cart_id'] as num?)?.toInt() ?? 0,
      totalItems: (json['total_items'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? "",
      description: json['description'] as String? ?? "",
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['net_amount'] as num?)?.toDouble() ?? 0.0,
      fees: (json['fees'] as num?)?.toDouble() ?? 0.0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProductSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductSummary>[],
    );

Map<String, dynamic> _$$ShopCartModelImplToJson(_$ShopCartModelImpl instance) =>
    <String, dynamic>{
      'shop_cart_id': instance.cartId,
      'total_items': instance.totalItems,
      'created_at': instance.createdAt,
      'description': instance.description,
      'total_amount': instance.totalAmount,
      'net_amount': instance.netAmount,
      'fees': instance.fees,
      'items': instance.items,
    };
