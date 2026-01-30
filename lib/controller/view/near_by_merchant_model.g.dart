// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_by_merchant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearByMerchantModelImpl _$$NearByMerchantModelImplFromJson(
  Map<String, dynamic> json,
) => _$NearByMerchantModelImpl(
  address: json['address'] as String? ?? "",
  latitude: json['latitude'] as String? ?? "",
  longitude: json['longitude'] as String? ?? "",
  client: json['client'] == null
      ? const MerchantDetails()
      : MerchantDetails.fromJson(json['client'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$NearByMerchantModelImplToJson(
  _$NearByMerchantModelImpl instance,
) => <String, dynamic>{
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'client': instance.client,
};
