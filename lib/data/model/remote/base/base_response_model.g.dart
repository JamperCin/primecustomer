// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseResponseModelImpl _$$BaseResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$BaseResponseModelImpl(
  success: json['success'] as bool? ?? false,
  status: (json['status'] as num?)?.toInt() ?? 0,
  error: json['error_msg'] as String? ?? '',
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$BaseResponseModelImplToJson(
  _$BaseResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'status': instance.status,
  'error_msg': instance.error,
  'data': instance.data,
};
