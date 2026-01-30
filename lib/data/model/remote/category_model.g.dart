// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      isMain: json['is_main'] as bool? ?? false,
      isSelected: json['isSelected'] as bool? ?? false,
      code: json['code'] as String? ?? "",
      parentCode: json['parent_code'] as String? ?? "",
      emoji: json['emoji'] as String? ?? "",
      image: json['image'] as String? ?? "",
      subCategories:
          (json['sub_categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CategoryModel>[],
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logo': instance.logo,
      'is_main': instance.isMain,
      'isSelected': instance.isSelected,
      'code': instance.code,
      'parent_code': instance.parentCode,
      'emoji': instance.emoji,
      'image': instance.image,
      'sub_categories': instance.subCategories,
    };
