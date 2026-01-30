// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchantDetailsImpl _$$MerchantDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$MerchantDetailsImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  code: json['code'] as String? ?? '',
  telephone: json['telephone'] as String? ?? '',
  description: json['description'] as String? ?? '',
  verified: json['verified'] as bool? ?? false,
  logoUrl: json['logo_url'] as String? ?? '',
  webSiteUrl: json['website_url'] as String? ?? '',
  registrationNum: json['registration_number'] as String? ?? '',
  minPrice: (json['min_card_price'] as num?)?.toDouble() ?? 0,
  maxPrice: (json['max_card_price'] as num?)?.toDouble() ?? 0,
  coordinates: json['cordinates'] == null
      ? null
      : Coordinates.fromJson(json['cordinates'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$MerchantDetailsImplToJson(
  _$MerchantDetailsImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'telephone': instance.telephone,
  'description': instance.description,
  'verified': instance.verified,
  'logo_url': instance.logoUrl,
  'website_url': instance.webSiteUrl,
  'registration_number': instance.registrationNum,
  'min_card_price': instance.minPrice,
  'max_card_price': instance.maxPrice,
  'cordinates': instance.coordinates,
};
