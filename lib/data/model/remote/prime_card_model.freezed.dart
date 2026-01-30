// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prime_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PrimeCardModel _$PrimeCardModelFromJson(Map<String, dynamic> json) {
  return _PrimeCardModel.fromJson(json);
}

/// @nodoc
mixin _$PrimeCardModel {
  String get description => throw _privateConstructorUsedError;
  List<String> get amountList => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  bool get isCheckedOut => throw _privateConstructorUsedError;
  MerchantDetails get client => throw _privateConstructorUsedError;
  String get heroTag => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_color')
  String get defaultColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_promotion')
  bool get isPromotion => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_state')
  String get promoState => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_value')
  String get promoValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_type')
  String get promoType => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotion_title')
  String get promotionTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotion_start')
  String get promotionStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_description')
  String get promoDescription => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_id')
  int get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_category')
  String get cardCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_name')
  String get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  int get client_id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_location')
  String get clientLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_telephone')
  String get clientTelephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_date')
  String get expiryDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_background')
  String get cardBackground => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_style')
  String get cardStyle => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotion_terms')
  String get promotionTerms => throw _privateConstructorUsedError;
  @JsonKey(name: 'who_created_id')
  int get whoCreatedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_feature')
  bool get isFeature => throw _privateConstructorUsedError;
  bool get isAlreadySelected => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_off')
  double get percentageOff => throw _privateConstructorUsedError;
  @JsonKey(name: 'discounted_amount')
  double get discountedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_code')
  String get purchaseCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'web_design_props')
  MobileCardDesignProp get mobileCardDesignProp =>
      throw _privateConstructorUsedError;

  /// Serializes this PrimeCardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrimeCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrimeCardModelCopyWith<PrimeCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimeCardModelCopyWith<$Res> {
  factory $PrimeCardModelCopyWith(
    PrimeCardModel value,
    $Res Function(PrimeCardModel) then,
  ) = _$PrimeCardModelCopyWithImpl<$Res, PrimeCardModel>;
  @useResult
  $Res call({
    String description,
    List<String> amountList,
    String amount,
    String? currency,
    bool isCheckedOut,
    MerchantDetails client,
    String heroTag,
    @JsonKey(name: 'default_color') String defaultColor,
    @JsonKey(name: 'is_promotion') bool isPromotion,
    @JsonKey(name: 'promo_state') String promoState,
    @JsonKey(name: 'promo_value') String promoValue,
    @JsonKey(name: 'promo_type') String promoType,
    @JsonKey(name: 'promotion_title') String promotionTitle,
    @JsonKey(name: 'promotion_start') String promotionStart,
    @JsonKey(name: 'promo_description') String promoDescription,
    int id,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'item_id') int itemId,
    @JsonKey(name: 'account_id') int accountId,
    @JsonKey(name: 'card_category') String cardCategory,
    @JsonKey(name: 'client_name') String clientName,
    @JsonKey(name: 'client_id') int client_id,
    String code,
    @JsonKey(name: 'client_location') String clientLocation,
    @JsonKey(name: 'client_telephone') String clientTelephone,
    @JsonKey(name: 'expiry_date') String expiryDate,
    String title,
    String image,
    @JsonKey(name: 'card_background') String cardBackground,
    @JsonKey(name: 'card_style') String cardStyle,
    String logo,
    @JsonKey(name: 'promotion_terms') String promotionTerms,
    @JsonKey(name: 'who_created_id') int whoCreatedId,
    @JsonKey(name: 'is_feature') bool isFeature,
    bool isAlreadySelected,
    @JsonKey(name: 'percentage_off') double percentageOff,
    @JsonKey(name: 'discounted_amount') double discountedAmount,
    @JsonKey(name: 'purchase_code') String purchaseCode,
    @JsonKey(name: 'web_design_props')
    MobileCardDesignProp mobileCardDesignProp,
  });

  $MerchantDetailsCopyWith<$Res> get client;
  $MobileCardDesignPropCopyWith<$Res> get mobileCardDesignProp;
}

/// @nodoc
class _$PrimeCardModelCopyWithImpl<$Res, $Val extends PrimeCardModel>
    implements $PrimeCardModelCopyWith<$Res> {
  _$PrimeCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrimeCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? amountList = null,
    Object? amount = null,
    Object? currency = freezed,
    Object? isCheckedOut = null,
    Object? client = null,
    Object? heroTag = null,
    Object? defaultColor = null,
    Object? isPromotion = null,
    Object? promoState = null,
    Object? promoValue = null,
    Object? promoType = null,
    Object? promotionTitle = null,
    Object? promotionStart = null,
    Object? promoDescription = null,
    Object? id = null,
    Object? createdAt = null,
    Object? itemId = null,
    Object? accountId = null,
    Object? cardCategory = null,
    Object? clientName = null,
    Object? client_id = null,
    Object? code = null,
    Object? clientLocation = null,
    Object? clientTelephone = null,
    Object? expiryDate = null,
    Object? title = null,
    Object? image = null,
    Object? cardBackground = null,
    Object? cardStyle = null,
    Object? logo = null,
    Object? promotionTerms = null,
    Object? whoCreatedId = null,
    Object? isFeature = null,
    Object? isAlreadySelected = null,
    Object? percentageOff = null,
    Object? discountedAmount = null,
    Object? purchaseCode = null,
    Object? mobileCardDesignProp = null,
  }) {
    return _then(
      _value.copyWith(
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            amountList: null == amountList
                ? _value.amountList
                : amountList // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as String,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            isCheckedOut: null == isCheckedOut
                ? _value.isCheckedOut
                : isCheckedOut // ignore: cast_nullable_to_non_nullable
                      as bool,
            client: null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                      as MerchantDetails,
            heroTag: null == heroTag
                ? _value.heroTag
                : heroTag // ignore: cast_nullable_to_non_nullable
                      as String,
            defaultColor: null == defaultColor
                ? _value.defaultColor
                : defaultColor // ignore: cast_nullable_to_non_nullable
                      as String,
            isPromotion: null == isPromotion
                ? _value.isPromotion
                : isPromotion // ignore: cast_nullable_to_non_nullable
                      as bool,
            promoState: null == promoState
                ? _value.promoState
                : promoState // ignore: cast_nullable_to_non_nullable
                      as String,
            promoValue: null == promoValue
                ? _value.promoValue
                : promoValue // ignore: cast_nullable_to_non_nullable
                      as String,
            promoType: null == promoType
                ? _value.promoType
                : promoType // ignore: cast_nullable_to_non_nullable
                      as String,
            promotionTitle: null == promotionTitle
                ? _value.promotionTitle
                : promotionTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            promotionStart: null == promotionStart
                ? _value.promotionStart
                : promotionStart // ignore: cast_nullable_to_non_nullable
                      as String,
            promoDescription: null == promoDescription
                ? _value.promoDescription
                : promoDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            itemId: null == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                      as int,
            accountId: null == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as int,
            cardCategory: null == cardCategory
                ? _value.cardCategory
                : cardCategory // ignore: cast_nullable_to_non_nullable
                      as String,
            clientName: null == clientName
                ? _value.clientName
                : clientName // ignore: cast_nullable_to_non_nullable
                      as String,
            client_id: null == client_id
                ? _value.client_id
                : client_id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            clientLocation: null == clientLocation
                ? _value.clientLocation
                : clientLocation // ignore: cast_nullable_to_non_nullable
                      as String,
            clientTelephone: null == clientTelephone
                ? _value.clientTelephone
                : clientTelephone // ignore: cast_nullable_to_non_nullable
                      as String,
            expiryDate: null == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            cardBackground: null == cardBackground
                ? _value.cardBackground
                : cardBackground // ignore: cast_nullable_to_non_nullable
                      as String,
            cardStyle: null == cardStyle
                ? _value.cardStyle
                : cardStyle // ignore: cast_nullable_to_non_nullable
                      as String,
            logo: null == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                      as String,
            promotionTerms: null == promotionTerms
                ? _value.promotionTerms
                : promotionTerms // ignore: cast_nullable_to_non_nullable
                      as String,
            whoCreatedId: null == whoCreatedId
                ? _value.whoCreatedId
                : whoCreatedId // ignore: cast_nullable_to_non_nullable
                      as int,
            isFeature: null == isFeature
                ? _value.isFeature
                : isFeature // ignore: cast_nullable_to_non_nullable
                      as bool,
            isAlreadySelected: null == isAlreadySelected
                ? _value.isAlreadySelected
                : isAlreadySelected // ignore: cast_nullable_to_non_nullable
                      as bool,
            percentageOff: null == percentageOff
                ? _value.percentageOff
                : percentageOff // ignore: cast_nullable_to_non_nullable
                      as double,
            discountedAmount: null == discountedAmount
                ? _value.discountedAmount
                : discountedAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            purchaseCode: null == purchaseCode
                ? _value.purchaseCode
                : purchaseCode // ignore: cast_nullable_to_non_nullable
                      as String,
            mobileCardDesignProp: null == mobileCardDesignProp
                ? _value.mobileCardDesignProp
                : mobileCardDesignProp // ignore: cast_nullable_to_non_nullable
                      as MobileCardDesignProp,
          )
          as $Val,
    );
  }

  /// Create a copy of PrimeCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MerchantDetailsCopyWith<$Res> get client {
    return $MerchantDetailsCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  /// Create a copy of PrimeCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MobileCardDesignPropCopyWith<$Res> get mobileCardDesignProp {
    return $MobileCardDesignPropCopyWith<$Res>(_value.mobileCardDesignProp, (
      value,
    ) {
      return _then(_value.copyWith(mobileCardDesignProp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrimeCardModelImplCopyWith<$Res>
    implements $PrimeCardModelCopyWith<$Res> {
  factory _$$PrimeCardModelImplCopyWith(
    _$PrimeCardModelImpl value,
    $Res Function(_$PrimeCardModelImpl) then,
  ) = __$$PrimeCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String description,
    List<String> amountList,
    String amount,
    String? currency,
    bool isCheckedOut,
    MerchantDetails client,
    String heroTag,
    @JsonKey(name: 'default_color') String defaultColor,
    @JsonKey(name: 'is_promotion') bool isPromotion,
    @JsonKey(name: 'promo_state') String promoState,
    @JsonKey(name: 'promo_value') String promoValue,
    @JsonKey(name: 'promo_type') String promoType,
    @JsonKey(name: 'promotion_title') String promotionTitle,
    @JsonKey(name: 'promotion_start') String promotionStart,
    @JsonKey(name: 'promo_description') String promoDescription,
    int id,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'item_id') int itemId,
    @JsonKey(name: 'account_id') int accountId,
    @JsonKey(name: 'card_category') String cardCategory,
    @JsonKey(name: 'client_name') String clientName,
    @JsonKey(name: 'client_id') int client_id,
    String code,
    @JsonKey(name: 'client_location') String clientLocation,
    @JsonKey(name: 'client_telephone') String clientTelephone,
    @JsonKey(name: 'expiry_date') String expiryDate,
    String title,
    String image,
    @JsonKey(name: 'card_background') String cardBackground,
    @JsonKey(name: 'card_style') String cardStyle,
    String logo,
    @JsonKey(name: 'promotion_terms') String promotionTerms,
    @JsonKey(name: 'who_created_id') int whoCreatedId,
    @JsonKey(name: 'is_feature') bool isFeature,
    bool isAlreadySelected,
    @JsonKey(name: 'percentage_off') double percentageOff,
    @JsonKey(name: 'discounted_amount') double discountedAmount,
    @JsonKey(name: 'purchase_code') String purchaseCode,
    @JsonKey(name: 'web_design_props')
    MobileCardDesignProp mobileCardDesignProp,
  });

  @override
  $MerchantDetailsCopyWith<$Res> get client;
  @override
  $MobileCardDesignPropCopyWith<$Res> get mobileCardDesignProp;
}

/// @nodoc
class __$$PrimeCardModelImplCopyWithImpl<$Res>
    extends _$PrimeCardModelCopyWithImpl<$Res, _$PrimeCardModelImpl>
    implements _$$PrimeCardModelImplCopyWith<$Res> {
  __$$PrimeCardModelImplCopyWithImpl(
    _$PrimeCardModelImpl _value,
    $Res Function(_$PrimeCardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrimeCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? amountList = null,
    Object? amount = null,
    Object? currency = freezed,
    Object? isCheckedOut = null,
    Object? client = null,
    Object? heroTag = null,
    Object? defaultColor = null,
    Object? isPromotion = null,
    Object? promoState = null,
    Object? promoValue = null,
    Object? promoType = null,
    Object? promotionTitle = null,
    Object? promotionStart = null,
    Object? promoDescription = null,
    Object? id = null,
    Object? createdAt = null,
    Object? itemId = null,
    Object? accountId = null,
    Object? cardCategory = null,
    Object? clientName = null,
    Object? client_id = null,
    Object? code = null,
    Object? clientLocation = null,
    Object? clientTelephone = null,
    Object? expiryDate = null,
    Object? title = null,
    Object? image = null,
    Object? cardBackground = null,
    Object? cardStyle = null,
    Object? logo = null,
    Object? promotionTerms = null,
    Object? whoCreatedId = null,
    Object? isFeature = null,
    Object? isAlreadySelected = null,
    Object? percentageOff = null,
    Object? discountedAmount = null,
    Object? purchaseCode = null,
    Object? mobileCardDesignProp = null,
  }) {
    return _then(
      _$PrimeCardModelImpl(
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        amountList: null == amountList
            ? _value._amountList
            : amountList // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as String,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCheckedOut: null == isCheckedOut
            ? _value.isCheckedOut
            : isCheckedOut // ignore: cast_nullable_to_non_nullable
                  as bool,
        client: null == client
            ? _value.client
            : client // ignore: cast_nullable_to_non_nullable
                  as MerchantDetails,
        heroTag: null == heroTag
            ? _value.heroTag
            : heroTag // ignore: cast_nullable_to_non_nullable
                  as String,
        defaultColor: null == defaultColor
            ? _value.defaultColor
            : defaultColor // ignore: cast_nullable_to_non_nullable
                  as String,
        isPromotion: null == isPromotion
            ? _value.isPromotion
            : isPromotion // ignore: cast_nullable_to_non_nullable
                  as bool,
        promoState: null == promoState
            ? _value.promoState
            : promoState // ignore: cast_nullable_to_non_nullable
                  as String,
        promoValue: null == promoValue
            ? _value.promoValue
            : promoValue // ignore: cast_nullable_to_non_nullable
                  as String,
        promoType: null == promoType
            ? _value.promoType
            : promoType // ignore: cast_nullable_to_non_nullable
                  as String,
        promotionTitle: null == promotionTitle
            ? _value.promotionTitle
            : promotionTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        promotionStart: null == promotionStart
            ? _value.promotionStart
            : promotionStart // ignore: cast_nullable_to_non_nullable
                  as String,
        promoDescription: null == promoDescription
            ? _value.promoDescription
            : promoDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        itemId: null == itemId
            ? _value.itemId
            : itemId // ignore: cast_nullable_to_non_nullable
                  as int,
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as int,
        cardCategory: null == cardCategory
            ? _value.cardCategory
            : cardCategory // ignore: cast_nullable_to_non_nullable
                  as String,
        clientName: null == clientName
            ? _value.clientName
            : clientName // ignore: cast_nullable_to_non_nullable
                  as String,
        client_id: null == client_id
            ? _value.client_id
            : client_id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        clientLocation: null == clientLocation
            ? _value.clientLocation
            : clientLocation // ignore: cast_nullable_to_non_nullable
                  as String,
        clientTelephone: null == clientTelephone
            ? _value.clientTelephone
            : clientTelephone // ignore: cast_nullable_to_non_nullable
                  as String,
        expiryDate: null == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        cardBackground: null == cardBackground
            ? _value.cardBackground
            : cardBackground // ignore: cast_nullable_to_non_nullable
                  as String,
        cardStyle: null == cardStyle
            ? _value.cardStyle
            : cardStyle // ignore: cast_nullable_to_non_nullable
                  as String,
        logo: null == logo
            ? _value.logo
            : logo // ignore: cast_nullable_to_non_nullable
                  as String,
        promotionTerms: null == promotionTerms
            ? _value.promotionTerms
            : promotionTerms // ignore: cast_nullable_to_non_nullable
                  as String,
        whoCreatedId: null == whoCreatedId
            ? _value.whoCreatedId
            : whoCreatedId // ignore: cast_nullable_to_non_nullable
                  as int,
        isFeature: null == isFeature
            ? _value.isFeature
            : isFeature // ignore: cast_nullable_to_non_nullable
                  as bool,
        isAlreadySelected: null == isAlreadySelected
            ? _value.isAlreadySelected
            : isAlreadySelected // ignore: cast_nullable_to_non_nullable
                  as bool,
        percentageOff: null == percentageOff
            ? _value.percentageOff
            : percentageOff // ignore: cast_nullable_to_non_nullable
                  as double,
        discountedAmount: null == discountedAmount
            ? _value.discountedAmount
            : discountedAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        purchaseCode: null == purchaseCode
            ? _value.purchaseCode
            : purchaseCode // ignore: cast_nullable_to_non_nullable
                  as String,
        mobileCardDesignProp: null == mobileCardDesignProp
            ? _value.mobileCardDesignProp
            : mobileCardDesignProp // ignore: cast_nullable_to_non_nullable
                  as MobileCardDesignProp,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrimeCardModelImpl extends _PrimeCardModel {
  const _$PrimeCardModelImpl({
    this.description = '',
    final List<String> amountList = const [],
    this.amount = '',
    this.currency,
    this.isCheckedOut = false,
    this.client = const MerchantDetails(),
    this.heroTag = '',
    @JsonKey(name: 'default_color') this.defaultColor = '',
    @JsonKey(name: 'is_promotion') this.isPromotion = false,
    @JsonKey(name: 'promo_state') this.promoState = '',
    @JsonKey(name: 'promo_value') this.promoValue = '',
    @JsonKey(name: 'promo_type') this.promoType = '',
    @JsonKey(name: 'promotion_title') this.promotionTitle = '',
    @JsonKey(name: 'promotion_start') this.promotionStart = '',
    @JsonKey(name: 'promo_description') this.promoDescription = '',
    this.id = 0,
    @JsonKey(name: 'created_at') this.createdAt = '',
    @JsonKey(name: 'item_id') this.itemId = 0,
    @JsonKey(name: 'account_id') this.accountId = 0,
    @JsonKey(name: 'card_category') this.cardCategory = '',
    @JsonKey(name: 'client_name') this.clientName = '',
    @JsonKey(name: 'client_id') this.client_id = 0,
    this.code = '',
    @JsonKey(name: 'client_location') this.clientLocation = '',
    @JsonKey(name: 'client_telephone') this.clientTelephone = '',
    @JsonKey(name: 'expiry_date') this.expiryDate = '',
    this.title = '',
    this.image = '',
    @JsonKey(name: 'card_background') this.cardBackground = '',
    @JsonKey(name: 'card_style') this.cardStyle = '',
    this.logo = '',
    @JsonKey(name: 'promotion_terms') this.promotionTerms = '',
    @JsonKey(name: 'who_created_id') this.whoCreatedId = 0,
    @JsonKey(name: 'is_feature') this.isFeature = false,
    this.isAlreadySelected = false,
    @JsonKey(name: 'percentage_off') this.percentageOff = 0.00,
    @JsonKey(name: 'discounted_amount') this.discountedAmount = 0.00,
    @JsonKey(name: 'purchase_code') this.purchaseCode = '',
    @JsonKey(name: 'web_design_props')
    this.mobileCardDesignProp = const MobileCardDesignProp(),
  }) : _amountList = amountList,
       super._();

  factory _$PrimeCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrimeCardModelImplFromJson(json);

  @override
  @JsonKey()
  final String description;
  final List<String> _amountList;
  @override
  @JsonKey()
  List<String> get amountList {
    if (_amountList is EqualUnmodifiableListView) return _amountList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amountList);
  }

  @override
  @JsonKey()
  final String amount;
  @override
  final String? currency;
  @override
  @JsonKey()
  final bool isCheckedOut;
  @override
  @JsonKey()
  final MerchantDetails client;
  @override
  @JsonKey()
  final String heroTag;
  @override
  @JsonKey(name: 'default_color')
  final String defaultColor;
  @override
  @JsonKey(name: 'is_promotion')
  final bool isPromotion;
  @override
  @JsonKey(name: 'promo_state')
  final String promoState;
  @override
  @JsonKey(name: 'promo_value')
  final String promoValue;
  @override
  @JsonKey(name: 'promo_type')
  final String promoType;
  @override
  @JsonKey(name: 'promotion_title')
  final String promotionTitle;
  @override
  @JsonKey(name: 'promotion_start')
  final String promotionStart;
  @override
  @JsonKey(name: 'promo_description')
  final String promoDescription;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'item_id')
  final int itemId;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  @JsonKey(name: 'card_category')
  final String cardCategory;
  @override
  @JsonKey(name: 'client_name')
  final String clientName;
  @override
  @JsonKey(name: 'client_id')
  final int client_id;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey(name: 'client_location')
  final String clientLocation;
  @override
  @JsonKey(name: 'client_telephone')
  final String clientTelephone;
  @override
  @JsonKey(name: 'expiry_date')
  final String expiryDate;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey(name: 'card_background')
  final String cardBackground;
  @override
  @JsonKey(name: 'card_style')
  final String cardStyle;
  @override
  @JsonKey()
  final String logo;
  @override
  @JsonKey(name: 'promotion_terms')
  final String promotionTerms;
  @override
  @JsonKey(name: 'who_created_id')
  final int whoCreatedId;
  @override
  @JsonKey(name: 'is_feature')
  final bool isFeature;
  @override
  @JsonKey()
  final bool isAlreadySelected;
  @override
  @JsonKey(name: 'percentage_off')
  final double percentageOff;
  @override
  @JsonKey(name: 'discounted_amount')
  final double discountedAmount;
  @override
  @JsonKey(name: 'purchase_code')
  final String purchaseCode;
  @override
  @JsonKey(name: 'web_design_props')
  final MobileCardDesignProp mobileCardDesignProp;

  @override
  String toString() {
    return 'PrimeCardModel(description: $description, amountList: $amountList, amount: $amount, currency: $currency, isCheckedOut: $isCheckedOut, client: $client, heroTag: $heroTag, defaultColor: $defaultColor, isPromotion: $isPromotion, promoState: $promoState, promoValue: $promoValue, promoType: $promoType, promotionTitle: $promotionTitle, promotionStart: $promotionStart, promoDescription: $promoDescription, id: $id, createdAt: $createdAt, itemId: $itemId, accountId: $accountId, cardCategory: $cardCategory, clientName: $clientName, client_id: $client_id, code: $code, clientLocation: $clientLocation, clientTelephone: $clientTelephone, expiryDate: $expiryDate, title: $title, image: $image, cardBackground: $cardBackground, cardStyle: $cardStyle, logo: $logo, promotionTerms: $promotionTerms, whoCreatedId: $whoCreatedId, isFeature: $isFeature, isAlreadySelected: $isAlreadySelected, percentageOff: $percentageOff, discountedAmount: $discountedAmount, purchaseCode: $purchaseCode, mobileCardDesignProp: $mobileCardDesignProp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrimeCardModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._amountList,
              _amountList,
            ) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isCheckedOut, isCheckedOut) ||
                other.isCheckedOut == isCheckedOut) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.heroTag, heroTag) || other.heroTag == heroTag) &&
            (identical(other.defaultColor, defaultColor) ||
                other.defaultColor == defaultColor) &&
            (identical(other.isPromotion, isPromotion) ||
                other.isPromotion == isPromotion) &&
            (identical(other.promoState, promoState) ||
                other.promoState == promoState) &&
            (identical(other.promoValue, promoValue) ||
                other.promoValue == promoValue) &&
            (identical(other.promoType, promoType) ||
                other.promoType == promoType) &&
            (identical(other.promotionTitle, promotionTitle) ||
                other.promotionTitle == promotionTitle) &&
            (identical(other.promotionStart, promotionStart) ||
                other.promotionStart == promotionStart) &&
            (identical(other.promoDescription, promoDescription) ||
                other.promoDescription == promoDescription) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.cardCategory, cardCategory) ||
                other.cardCategory == cardCategory) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.client_id, client_id) ||
                other.client_id == client_id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.clientLocation, clientLocation) ||
                other.clientLocation == clientLocation) &&
            (identical(other.clientTelephone, clientTelephone) ||
                other.clientTelephone == clientTelephone) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.cardBackground, cardBackground) ||
                other.cardBackground == cardBackground) &&
            (identical(other.cardStyle, cardStyle) ||
                other.cardStyle == cardStyle) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.promotionTerms, promotionTerms) ||
                other.promotionTerms == promotionTerms) &&
            (identical(other.whoCreatedId, whoCreatedId) ||
                other.whoCreatedId == whoCreatedId) &&
            (identical(other.isFeature, isFeature) ||
                other.isFeature == isFeature) &&
            (identical(other.isAlreadySelected, isAlreadySelected) ||
                other.isAlreadySelected == isAlreadySelected) &&
            (identical(other.percentageOff, percentageOff) ||
                other.percentageOff == percentageOff) &&
            (identical(other.discountedAmount, discountedAmount) ||
                other.discountedAmount == discountedAmount) &&
            (identical(other.purchaseCode, purchaseCode) ||
                other.purchaseCode == purchaseCode) &&
            (identical(other.mobileCardDesignProp, mobileCardDesignProp) ||
                other.mobileCardDesignProp == mobileCardDesignProp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    description,
    const DeepCollectionEquality().hash(_amountList),
    amount,
    currency,
    isCheckedOut,
    client,
    heroTag,
    defaultColor,
    isPromotion,
    promoState,
    promoValue,
    promoType,
    promotionTitle,
    promotionStart,
    promoDescription,
    id,
    createdAt,
    itemId,
    accountId,
    cardCategory,
    clientName,
    client_id,
    code,
    clientLocation,
    clientTelephone,
    expiryDate,
    title,
    image,
    cardBackground,
    cardStyle,
    logo,
    promotionTerms,
    whoCreatedId,
    isFeature,
    isAlreadySelected,
    percentageOff,
    discountedAmount,
    purchaseCode,
    mobileCardDesignProp,
  ]);

  /// Create a copy of PrimeCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrimeCardModelImplCopyWith<_$PrimeCardModelImpl> get copyWith =>
      __$$PrimeCardModelImplCopyWithImpl<_$PrimeCardModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrimeCardModelImplToJson(this);
  }
}

abstract class _PrimeCardModel extends PrimeCardModel {
  const factory _PrimeCardModel({
    final String description,
    final List<String> amountList,
    final String amount,
    final String? currency,
    final bool isCheckedOut,
    final MerchantDetails client,
    final String heroTag,
    @JsonKey(name: 'default_color') final String defaultColor,
    @JsonKey(name: 'is_promotion') final bool isPromotion,
    @JsonKey(name: 'promo_state') final String promoState,
    @JsonKey(name: 'promo_value') final String promoValue,
    @JsonKey(name: 'promo_type') final String promoType,
    @JsonKey(name: 'promotion_title') final String promotionTitle,
    @JsonKey(name: 'promotion_start') final String promotionStart,
    @JsonKey(name: 'promo_description') final String promoDescription,
    final int id,
    @JsonKey(name: 'created_at') final String createdAt,
    @JsonKey(name: 'item_id') final int itemId,
    @JsonKey(name: 'account_id') final int accountId,
    @JsonKey(name: 'card_category') final String cardCategory,
    @JsonKey(name: 'client_name') final String clientName,
    @JsonKey(name: 'client_id') final int client_id,
    final String code,
    @JsonKey(name: 'client_location') final String clientLocation,
    @JsonKey(name: 'client_telephone') final String clientTelephone,
    @JsonKey(name: 'expiry_date') final String expiryDate,
    final String title,
    final String image,
    @JsonKey(name: 'card_background') final String cardBackground,
    @JsonKey(name: 'card_style') final String cardStyle,
    final String logo,
    @JsonKey(name: 'promotion_terms') final String promotionTerms,
    @JsonKey(name: 'who_created_id') final int whoCreatedId,
    @JsonKey(name: 'is_feature') final bool isFeature,
    final bool isAlreadySelected,
    @JsonKey(name: 'percentage_off') final double percentageOff,
    @JsonKey(name: 'discounted_amount') final double discountedAmount,
    @JsonKey(name: 'purchase_code') final String purchaseCode,
    @JsonKey(name: 'web_design_props')
    final MobileCardDesignProp mobileCardDesignProp,
  }) = _$PrimeCardModelImpl;
  const _PrimeCardModel._() : super._();

  factory _PrimeCardModel.fromJson(Map<String, dynamic> json) =
      _$PrimeCardModelImpl.fromJson;

  @override
  String get description;
  @override
  List<String> get amountList;
  @override
  String get amount;
  @override
  String? get currency;
  @override
  bool get isCheckedOut;
  @override
  MerchantDetails get client;
  @override
  String get heroTag;
  @override
  @JsonKey(name: 'default_color')
  String get defaultColor;
  @override
  @JsonKey(name: 'is_promotion')
  bool get isPromotion;
  @override
  @JsonKey(name: 'promo_state')
  String get promoState;
  @override
  @JsonKey(name: 'promo_value')
  String get promoValue;
  @override
  @JsonKey(name: 'promo_type')
  String get promoType;
  @override
  @JsonKey(name: 'promotion_title')
  String get promotionTitle;
  @override
  @JsonKey(name: 'promotion_start')
  String get promotionStart;
  @override
  @JsonKey(name: 'promo_description')
  String get promoDescription;
  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'item_id')
  int get itemId;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  @JsonKey(name: 'card_category')
  String get cardCategory;
  @override
  @JsonKey(name: 'client_name')
  String get clientName;
  @override
  @JsonKey(name: 'client_id')
  int get client_id;
  @override
  String get code;
  @override
  @JsonKey(name: 'client_location')
  String get clientLocation;
  @override
  @JsonKey(name: 'client_telephone')
  String get clientTelephone;
  @override
  @JsonKey(name: 'expiry_date')
  String get expiryDate;
  @override
  String get title;
  @override
  String get image;
  @override
  @JsonKey(name: 'card_background')
  String get cardBackground;
  @override
  @JsonKey(name: 'card_style')
  String get cardStyle;
  @override
  String get logo;
  @override
  @JsonKey(name: 'promotion_terms')
  String get promotionTerms;
  @override
  @JsonKey(name: 'who_created_id')
  int get whoCreatedId;
  @override
  @JsonKey(name: 'is_feature')
  bool get isFeature;
  @override
  bool get isAlreadySelected;
  @override
  @JsonKey(name: 'percentage_off')
  double get percentageOff;
  @override
  @JsonKey(name: 'discounted_amount')
  double get discountedAmount;
  @override
  @JsonKey(name: 'purchase_code')
  String get purchaseCode;
  @override
  @JsonKey(name: 'web_design_props')
  MobileCardDesignProp get mobileCardDesignProp;

  /// Create a copy of PrimeCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrimeCardModelImplCopyWith<_$PrimeCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
