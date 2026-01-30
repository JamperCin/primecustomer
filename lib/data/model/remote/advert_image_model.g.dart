// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdvertImageModelImpl _$$AdvertImageModelImplFromJson(
  Map<String, dynamic> json,
) => _$AdvertImageModelImpl(
  id: (json['id'] as num).toInt(),
  url: json['url'] as String? ?? '',
  adType: json['ad_type'] as String? ?? '',
);

Map<String, dynamic> _$$AdvertImageModelImplToJson(
  _$AdvertImageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'ad_type': instance.adType,
};
