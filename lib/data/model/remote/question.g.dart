// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      ask: json['ask'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      index: (json['index'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ask': instance.ask,
      'created_at': instance.createdAt,
      'index': instance.index,
    };
