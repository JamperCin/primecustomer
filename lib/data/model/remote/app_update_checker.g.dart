// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_checker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUpdateCheckerImpl _$$AppUpdateCheckerImplFromJson(
  Map<String, dynamic> json,
) => _$AppUpdateCheckerImpl(
  versionCode: (json['versionCode'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? "",
  buttonTitle: json['buttonTitle'] as String? ?? "",
  feature: json['feature'] as String? ?? "",
  forceUpdate: json['forceUpdate'] as bool? ?? false,
);

Map<String, dynamic> _$$AppUpdateCheckerImplToJson(
  _$AppUpdateCheckerImpl instance,
) => <String, dynamic>{
  'versionCode': instance.versionCode,
  'title': instance.title,
  'buttonTitle': instance.buttonTitle,
  'feature': instance.feature,
  'forceUpdate': instance.forceUpdate,
};
