// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      email: json['email'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      eFundPhone: json['phone'] as String? ?? '',
      username: json['username'] as String? ?? '',
      blocked: json['blocked'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
      company: json['company'] as String? ?? '',
      person: json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      verificationToken: json['verification_token'] as String? ?? '',
      joinedSince: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'phone': instance.eFundPhone,
      'username': instance.username,
      'blocked': instance.blocked,
      'active': instance.active,
      'company': instance.company,
      'person': instance.person,
      'verification_token': instance.verificationToken,
      'created_at': instance.joinedSince,
    };
