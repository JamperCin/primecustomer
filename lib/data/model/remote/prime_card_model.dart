import 'package:primecustomer/utils/number_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'merchant_details.dart';
import 'mobile_card_design_prop.dart';

part 'prime_card_model.freezed.dart';
part 'prime_card_model.g.dart';

@freezed
class PrimeCardModel with _$PrimeCardModel implements Comparable {
  const PrimeCardModel._();
  const factory PrimeCardModel({
    @Default('') String description,
    @Default([]) List<String> amountList,
    @Default('') String amount,
    String? currency,
    @Default(false) bool isCheckedOut,
    @Default(MerchantDetails()) MerchantDetails client,
    @Default('') String heroTag,
    @JsonKey(name: 'default_color') @Default('') String defaultColor,
    @JsonKey(name: 'is_promotion') @Default(false) bool isPromotion,
    @JsonKey(name: 'promo_state') @Default('') String promoState,
    @JsonKey(name: 'promo_value') @Default('') String promoValue,
    @JsonKey(name: 'promo_type') @Default('') String promoType,
    @JsonKey(name: 'promotion_title') @Default('') String promotionTitle,
    @JsonKey(name: 'promotion_start') @Default('') String promotionStart,
    @JsonKey(name: 'promo_description') @Default('') String promoDescription,
    @Default(0) int id,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'item_id') @Default(0) int itemId,
    @JsonKey(name: 'account_id') @Default(0) int accountId,
    @JsonKey(name: 'card_category') @Default('') String cardCategory,
    @JsonKey(name: 'client_name') @Default('') String clientName,
    @JsonKey(name: 'client_id') @Default(0) int client_id,
    @Default('') String code,
    @JsonKey(name: 'client_location') @Default('') String clientLocation,
    @JsonKey(name: 'client_telephone') @Default('') String clientTelephone,
    @JsonKey(name: 'expiry_date') @Default('') String expiryDate,
    @Default('') String title,
    @Default('') String image,
    @JsonKey(name: 'card_background') @Default('') String cardBackground,
    @JsonKey(name: 'card_style') @Default('') String cardStyle,
    @Default('') String logo,
    @JsonKey(name: 'promotion_terms') @Default('') String promotionTerms,
    @JsonKey(name: 'who_created_id') @Default(0) int whoCreatedId,
    @JsonKey(name: 'is_feature') @Default(false) bool isFeature,
    @Default(false) bool isAlreadySelected,
    @JsonKey(name: 'percentage_off') @Default(0.00) double percentageOff,
    @JsonKey(name: 'discounted_amount') @Default(0.00) double discountedAmount,
    @JsonKey(name: 'purchase_code') @Default('') String purchaseCode,
    @JsonKey(name: 'web_design_props')
    @Default(MobileCardDesignProp())
        MobileCardDesignProp mobileCardDesignProp,
  }) = _PrimeCardModel;

  factory PrimeCardModel.fromJson(Map<String, dynamic> json) =>
      _$PrimeCardModelFromJson(json);

  @override
  int compareTo(other) {
    if (amount.isEmpty || other == null) {
      return -2;
    }

    if (NumberUtils.parseDouble(amount) <
        NumberUtils.parseDouble(other.amount)) {
      return 1;
    }

    if (NumberUtils.parseDouble(amount) >
        NumberUtils.parseDouble(other.amount)) {
      return -1;
    }

    if (NumberUtils.parseDouble(amount) ==
        NumberUtils.parseDouble(other.amount)) {
      return 0;
    }

    return -2;
  }
}
