// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_card_design_prop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MobileCardDesignPropImpl _$$MobileCardDesignPropImplFromJson(
  Map<String, dynamic> json,
) => _$MobileCardDesignPropImpl(
  type: json['type'] as String? ?? '',
  showAmount: json['show_amount'] as bool? ?? false,
  defaultColor: json['default_color'] as String? ?? '',
  logoPosition:
      (json['logo_position'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  amountPosition:
      (json['amount_position'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$MobileCardDesignPropImplToJson(
  _$MobileCardDesignPropImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'show_amount': instance.showAmount,
  'default_color': instance.defaultColor,
  'logo_position': instance.logoPosition,
  'amount_position': instance.amountPosition,
};
