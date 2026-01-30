// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletTypeImpl _$$WalletTypeImplFromJson(Map<String, dynamic> json) =>
    _$WalletTypeImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      providers:
          (json['providers'] as List<dynamic>?)
              ?.map((e) => WalletProvider.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WalletTypeImplToJson(_$WalletTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt,
      'providers': instance.providers,
    };
