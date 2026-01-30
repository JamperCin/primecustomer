// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiverImpl _$$GiverImplFromJson(Map<String, dynamic> json) => _$GiverImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  email: json['email'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  username: json['username'] as String? ?? '',
  person: json['person'] == null
      ? null
      : Person.fromJson(json['person'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$GiverImplToJson(_$GiverImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'person': instance.person,
    };
