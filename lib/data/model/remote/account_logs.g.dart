// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountLogsImpl _$$AccountLogsImplFromJson(Map<String, dynamic> json) =>
    _$AccountLogsImpl(
      purchasedDate: json['purchased_at'] as String? ?? "",
      accountId: (json['account_id'] as num?)?.toInt() ?? 0,
      currency: json['account_currency'] as String? ?? "GHS",
      balance: json['current_balance'] as String? ?? "0.0",
      discount: json['account_discount'] as String? ?? "0.0",
      status: json['account_status'] as String? ?? "",
      purchasedTo: json['purchase_to'] as String? ?? "",
      gifted: json['gifted'] as bool? ?? false,
      redemptionLogs:
          (json['logs'] as List<dynamic>?)
              ?.map((e) => RedemptionLogs.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AccountLogsImplToJson(_$AccountLogsImpl instance) =>
    <String, dynamic>{
      'purchased_at': instance.purchasedDate,
      'account_id': instance.accountId,
      'account_currency': instance.currency,
      'current_balance': instance.balance,
      'account_discount': instance.discount,
      'account_status': instance.status,
      'purchase_to': instance.purchasedTo,
      'gifted': instance.gifted,
      'logs': instance.redemptionLogs,
    };
