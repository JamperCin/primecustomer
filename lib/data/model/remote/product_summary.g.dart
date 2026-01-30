// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductSummaryImpl _$$ProductSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ProductSummaryImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      unitAmount: (json['unit_amount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['net_amount'] as num?)?.toDouble() ?? 0.0,
      grossAmount: (json['gross_amount'] as num?)?.toDouble() ?? 0.0,
      payableAmount: (json['payable_amount'] as num?)?.toDouble() ?? 0.0,
      unitDiscount: (json['unit_discount_amount'] as num?)?.toDouble() ?? 0.0,
      totalDiscount: (json['total_discount_amount'] as num?)?.toDouble() ?? 0.0,
      fees: (json['fees'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? "",
      discountPercent: json['discount_percentage'] as String? ?? '',
      product: json['product'] == null
          ? const ProductModel()
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductSummaryImplToJson(
  _$ProductSummaryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'quantity': instance.quantity,
  'unit_amount': instance.unitAmount,
  'net_amount': instance.netAmount,
  'gross_amount': instance.grossAmount,
  'payable_amount': instance.payableAmount,
  'unit_discount_amount': instance.unitDiscount,
  'total_discount_amount': instance.totalDiscount,
  'fees': instance.fees,
  'currency': instance.currency,
  'discount_percentage': instance.discountPercent,
  'product': instance.product,
};
