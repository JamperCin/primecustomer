// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verified_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifiedTokenImpl _$$VerifiedTokenImplFromJson(Map<String, dynamic> json) =>
    _$VerifiedTokenImpl(
      verifiedAt: json['verified_at'] as String? ?? '',
      signed: json['signed'] as String? ?? '',
    );

Map<String, dynamic> _$$VerifiedTokenImplToJson(_$VerifiedTokenImpl instance) =>
    <String, dynamic>{
      'verified_at': instance.verifiedAt,
      'signed': instance.signed,
    };
