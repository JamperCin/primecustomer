// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      reference: json['reference'] as String? ?? '',
      netAmount: (json['net_amount'] as num?)?.toDouble() ?? 0,
      grossAmount: (json['gross_amount'] as num?)?.toDouble() ?? 0,
      unitAmount: (json['unit_amount'] as num?)?.toDouble() ?? 0,
      totalDiscount: (json['total_discount'] as num?)?.toDouble() ?? 0,
      selected: json['selected'] as bool? ?? false,
      deliveryStatus: json['delivery_status'] as String? ?? '',
      paymentStatus: json['payment_status'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      deliveryOption: json['delivery_option'] as String? ?? '',
      customer: json['customer'] == null
          ? const Customer()
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      client: json['store_information'] == null
          ? const MerchantDetails()
          : MerchantDetails.fromJson(
              json['store_information'] as Map<String, dynamic>,
            ),
      deliveryAddress: json['delivery_address'] == null
          ? const AddressModel()
          : AddressModel.fromJson(
              json['delivery_address'] as Map<String, dynamic>,
            ),
      product: json['product'] == null
          ? const ProductModel()
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'reference': instance.reference,
      'net_amount': instance.netAmount,
      'gross_amount': instance.grossAmount,
      'unit_amount': instance.unitAmount,
      'total_discount': instance.totalDiscount,
      'selected': instance.selected,
      'delivery_status': instance.deliveryStatus,
      'payment_status': instance.paymentStatus,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'delivery_option': instance.deliveryOption,
      'customer': instance.customer,
      'store_information': instance.client,
      'delivery_address': instance.deliveryAddress,
      'product': instance.product,
    };
