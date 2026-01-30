import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_card_design_prop.freezed.dart';
part 'mobile_card_design_prop.g.dart';

@freezed
class MobileCardDesignProp with _$MobileCardDesignProp {
  const factory MobileCardDesignProp({
    @Default('') String type,
    @JsonKey(name: 'show_amount') @Default(false) bool showAmount,
    @JsonKey(name: 'default_color') @Default('') String defaultColor,
    @JsonKey(name: 'logo_position') @Default([]) List<String> logoPosition,
    @JsonKey(name: 'amount_position') @Default([]) List<String> amountPosition,
  }) = _MobileCardDesignProp;

  factory MobileCardDesignProp.fromJson(Map<String, dynamic> json) =>
      _$MobileCardDesignPropFromJson(json);
}
