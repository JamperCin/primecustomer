// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      isDefault: json['is_default'] as bool? ?? false,
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      personId: (json['person_id'] as num?)?.toInt() ?? 0,
      isWithinRange: json['isWithinRange'] as bool? ?? false,
      isSelected: json['isSelected'] as bool? ?? false,
      archived: json['archived'] as bool? ?? false,
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
      name: json['full_name'] as String? ?? '',
      locationName: json['location_name'] as String? ?? '',
      residentialAddress: json['residential_address'] as String? ?? '',
      phone: json['phone_number'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      coordinate: json['coordinate'] == null
          ? const Coordinates()
          : Coordinates.fromJson(json['coordinate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'distance': instance.distance,
      'is_default': instance.isDefault,
      'user_id': instance.userId,
      'person_id': instance.personId,
      'isWithinRange': instance.isWithinRange,
      'isSelected': instance.isSelected,
      'archived': instance.archived,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'full_name': instance.name,
      'location_name': instance.locationName,
      'residential_address': instance.residentialAddress,
      'phone_number': instance.phone,
      'created_at': instance.createdAt,
      'coordinate': instance.coordinate,
    };
