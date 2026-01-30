// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopModelImpl _$$ShopModelImplFromJson(Map<String, dynamic> json) =>
    _$ShopModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      logo: json['logo_url'] as String? ?? '',
      location: json['location'] == null
          ? null
          : Coordinates.fromJson(json['location'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      website: json['website'] as String? ?? '',
      terms: json['terms'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      currency: json['currency'] as String? ?? 'GHS',
      latestProducts:
          (json['latest_products'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductModel>[],
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$ShopModelImplToJson(_$ShopModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'logo_url': instance.logo,
      'location': instance.location,
      'description': instance.description,
      'website': instance.website,
      'terms': instance.terms,
      'verified': instance.verified,
      'currency': instance.currency,
      'latest_products': instance.latestProducts,
      'created_at': instance.createdAt,
    };
