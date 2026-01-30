// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentOptionsImpl _$$PaymentOptionsImplFromJson(Map<String, dynamic> json) =>
    _$PaymentOptionsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      blocked: json['blocked'] as bool? ?? false,
      archived: json['archived'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentOptionsImplToJson(
  _$PaymentOptionsImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'blocked': instance.blocked,
  'archived': instance.archived,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
