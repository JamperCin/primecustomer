// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      address: json['address'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
