// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionImpl _$$SuggestionImplFromJson(Map<String, dynamic> json) =>
    _$SuggestionImpl(
      placeId: json['placeId'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$SuggestionImplToJson(_$SuggestionImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'description': instance.description,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
