// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUpdateMetaImpl _$$AppUpdateMetaImplFromJson(Map<String, dynamic> json) =>
    _$AppUpdateMetaImpl(
      ios: json['ios'] == null
          ? const AppUpdateChecker()
          : AppUpdateChecker.fromJson(json['ios'] as Map<String, dynamic>),
      android: json['android'] == null
          ? const AppUpdateChecker()
          : AppUpdateChecker.fromJson(json['android'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppUpdateMetaImplToJson(_$AppUpdateMetaImpl instance) =>
    <String, dynamic>{'ios': instance.ios, 'android': instance.android};
