// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      currency: json['currency'] as String? ?? '',
      availableBalance: (json['available_balance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'available_balance': instance.availableBalance,
    };
