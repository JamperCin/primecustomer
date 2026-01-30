// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingModelImpl _$$RatingModelImplFromJson(Map<String, dynamic> json) =>
    _$RatingModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      rating: (json['value'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['created_at'] as String? ?? "",
      reviewMessage: json['review_message'] as String? ?? "",
      rater: json['rater'] == null
          ? const Person()
          : Person.fromJson(json['rater'] as Map<String, dynamic>),
      anonymous: json['anonymous'] as bool? ?? false,
    );

Map<String, dynamic> _$$RatingModelImplToJson(_$RatingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.rating,
      'created_at': instance.createdAt,
      'review_message': instance.reviewMessage,
      'rater': instance.rater,
      'anonymous': instance.anonymous,
    };
