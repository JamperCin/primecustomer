// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackModelImpl _$$FeedbackModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      like: json['like'] as bool? ?? false,
      emoji: json['emoji'] as String? ?? '',
    );

Map<String, dynamic> _$$FeedbackModelImplToJson(_$FeedbackModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'created_at': instance.createdAt,
      'like': instance.like,
      'emoji': instance.emoji,
    };
