// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_cards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosterCardsModelImpl _$$PosterCardsModelImplFromJson(
  Map<String, dynamic> json,
) => _$PosterCardsModelImpl(
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  asset: json['asset'] as String? ?? '',
);

Map<String, dynamic> _$$PosterCardsModelImplToJson(
  _$PosterCardsModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'asset': instance.asset,
};
