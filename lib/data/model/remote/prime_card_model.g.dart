// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prime_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrimeCardModelImpl _$$PrimeCardModelImplFromJson(Map<String, dynamic> json) =>
    _$PrimeCardModelImpl(
      description: json['description'] as String? ?? '',
      amountList:
          (json['amountList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      amount: json['amount'] as String? ?? '',
      currency: json['currency'] as String?,
      isCheckedOut: json['isCheckedOut'] as bool? ?? false,
      client: json['client'] == null
          ? const MerchantDetails()
          : MerchantDetails.fromJson(json['client'] as Map<String, dynamic>),
      heroTag: json['heroTag'] as String? ?? '',
      defaultColor: json['default_color'] as String? ?? '',
      isPromotion: json['is_promotion'] as bool? ?? false,
      promoState: json['promo_state'] as String? ?? '',
      promoValue: json['promo_value'] as String? ?? '',
      promoType: json['promo_type'] as String? ?? '',
      promotionTitle: json['promotion_title'] as String? ?? '',
      promotionStart: json['promotion_start'] as String? ?? '',
      promoDescription: json['promo_description'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      itemId: (json['item_id'] as num?)?.toInt() ?? 0,
      accountId: (json['account_id'] as num?)?.toInt() ?? 0,
      cardCategory: json['card_category'] as String? ?? '',
      clientName: json['client_name'] as String? ?? '',
      client_id: (json['client_id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      clientLocation: json['client_location'] as String? ?? '',
      clientTelephone: json['client_telephone'] as String? ?? '',
      expiryDate: json['expiry_date'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      cardBackground: json['card_background'] as String? ?? '',
      cardStyle: json['card_style'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      promotionTerms: json['promotion_terms'] as String? ?? '',
      whoCreatedId: (json['who_created_id'] as num?)?.toInt() ?? 0,
      isFeature: json['is_feature'] as bool? ?? false,
      isAlreadySelected: json['isAlreadySelected'] as bool? ?? false,
      percentageOff: (json['percentage_off'] as num?)?.toDouble() ?? 0.00,
      discountedAmount: (json['discounted_amount'] as num?)?.toDouble() ?? 0.00,
      purchaseCode: json['purchase_code'] as String? ?? '',
      mobileCardDesignProp: json['web_design_props'] == null
          ? const MobileCardDesignProp()
          : MobileCardDesignProp.fromJson(
              json['web_design_props'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$PrimeCardModelImplToJson(
  _$PrimeCardModelImpl instance,
) => <String, dynamic>{
  'description': instance.description,
  'amountList': instance.amountList,
  'amount': instance.amount,
  'currency': instance.currency,
  'isCheckedOut': instance.isCheckedOut,
  'client': instance.client,
  'heroTag': instance.heroTag,
  'default_color': instance.defaultColor,
  'is_promotion': instance.isPromotion,
  'promo_state': instance.promoState,
  'promo_value': instance.promoValue,
  'promo_type': instance.promoType,
  'promotion_title': instance.promotionTitle,
  'promotion_start': instance.promotionStart,
  'promo_description': instance.promoDescription,
  'id': instance.id,
  'created_at': instance.createdAt,
  'item_id': instance.itemId,
  'account_id': instance.accountId,
  'card_category': instance.cardCategory,
  'client_name': instance.clientName,
  'client_id': instance.client_id,
  'code': instance.code,
  'client_location': instance.clientLocation,
  'client_telephone': instance.clientTelephone,
  'expiry_date': instance.expiryDate,
  'title': instance.title,
  'image': instance.image,
  'card_background': instance.cardBackground,
  'card_style': instance.cardStyle,
  'logo': instance.logo,
  'promotion_terms': instance.promotionTerms,
  'who_created_id': instance.whoCreatedId,
  'is_feature': instance.isFeature,
  'isAlreadySelected': instance.isAlreadySelected,
  'percentage_off': instance.percentageOff,
  'discounted_amount': instance.discountedAmount,
  'purchase_code': instance.purchaseCode,
  'web_design_props': instance.mobileCardDesignProp,
};
