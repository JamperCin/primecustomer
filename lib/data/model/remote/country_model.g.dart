// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryModelImpl _$$CountryModelImplFromJson(Map<String, dynamic> json) =>
    _$CountryModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? 'Ghana',
      codeNumber: json['code_number'] as String? ?? '233',
      codeName: json['code_name'] as String? ?? 'GH',
      currency: json['currency'] as String? ?? '¢',
    );

Map<String, dynamic> _$$CountryModelImplToJson(_$CountryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code_number': instance.codeNumber,
      'code_name': instance.codeName,
      'currency': instance.currency,
    };
