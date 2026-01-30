// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopDetailModelImpl _$$ShopDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$ShopDetailModelImpl(
  shopProducts:
      (json['shop_products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductModel>[],
  shopDetails: json['shop_details'] == null
      ? const ShopModel()
      : ShopModel.fromJson(json['shop_details'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ShopDetailModelImplToJson(
  _$ShopDetailModelImpl instance,
) => <String, dynamic>{
  'shop_products': instance.shopProducts,
  'shop_details': instance.shopDetails,
};
