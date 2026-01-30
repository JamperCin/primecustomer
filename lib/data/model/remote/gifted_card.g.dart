// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gifted_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiftedCardImpl _$$GiftedCardImplFromJson(Map<String, dynamic> json) =>
    _$GiftedCardImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      scheduledDate: json['scheduled_date'] as String? ?? '',
      message: json['message'] as String? ?? '',
      giver: json['giver'] == null
          ? const Giver()
          : Giver.fromJson(json['giver'] as Map<String, dynamic>),
      recipient: json['recipient'] == null
          ? const Giver()
          : Giver.fromJson(json['recipient'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? '',
      account: json['account'] == null
          ? const CardAccount()
          : CardAccount.fromJson(json['account'] as Map<String, dynamic>),
      feedback: json['feedback'] == null
          ? null
          : FeedbackModel.fromJson(json['feedback'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GiftedCardImplToJson(_$GiftedCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduled_date': instance.scheduledDate,
      'message': instance.message,
      'giver': instance.giver,
      'recipient': instance.recipient,
      'created_at': instance.createdAt,
      'account': instance.account,
      'feedback': instance.feedback,
    };
