// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      walletTypeId: (json['wallet_type_id'] as num?)?.toInt() ?? 0,
      accNumber: json['acc_number'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      blocked: json['blocked'] as bool? ?? false,
      verified: json['verified'] as bool? ?? false,
      archived: json['archived'] as bool?,
      walletType: json['wallet_type'] == null
          ? const WalletType()
          : WalletType.fromJson(json['wallet_type'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      provider: json['provider'] as String? ?? '',
      customerId: json['customer_id'] as String? ?? '',
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wallet_type_id': instance.walletTypeId,
      'acc_number': instance.accNumber,
      'created_at': instance.createdAt,
      'blocked': instance.blocked,
      'verified': instance.verified,
      'archived': instance.archived,
      'wallet_type': instance.walletType,
      'description': instance.description,
      'provider': instance.provider,
      'customer_id': instance.customerId,
    };
