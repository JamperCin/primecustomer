import 'package:primecustomer/data/enum/shop_type.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/extensions/string_extension.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:diagonal_decoration/diagonal_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../config/assets_config.dart';

class ShopsApi {
  static final ShopsApi _instance = ShopsApi._internal();

  ShopsApi._internal() {
    debugPrint("creating instance");
  }

  factory ShopsApi() {
    return _instance;
  }

  Widget _nearYouShopItemWidget({
    required ShopModel shop,
    Function(ShopModel)? onTap,
  }) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(shop);
        }
      },
      child: Container(
        decoration: UiApi.deco(
          gradient: const LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            stops: [0.3, 1.0],
            colors: [Colors.white, Colors.black],
          ),
          borderColor: AppColors.white,
        ),
        width: AppDimens.dimen120,
        // padding: EdgeInsets.all(AppDimens.dimen10),
        margin: EdgeInsets.only(
          right: AppDimens.dimen5,
          top: AppDimens.dimen5,
          bottom: AppDimens.dimen5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppDimens.dimen10),
            UiApi.circleImageView(
              url: shop.logo,
              radius: AppDimens.dimen35,
            ),
            SizedBox(height: AppDimens.dimen10),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: UiApi.richText(
                          maxLines: 2,
                          mod: [
                            RichTextModel(
                              text: shop.name.capitalizeFirstLetters(),
                              style:
                                  AppTextStyles.smallSubDescStyleBold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      Flexible(
                        child: Text(
                          '4 places',
                          style:
                              AppTextStyles.smallSubDescStyleRegular.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget shopItemWidget({
    required ShopModel shop,
    required ShopType shopType,
    Function(ShopModel)? onTap,
    Function(ProductModel)? onProductTap,
  }) {
    switch (shopType) {
      case ShopType.recommended:
        return _recommendedShopItemWidget(
          shop: shop,
          onTap: onTap,
          onProductOnTap: onProductTap,
        );
        break;
      case ShopType.favorite:
        return UiApi.loader(size: 1);
        break;
      case ShopType.nearYou:
        return _nearYouShopItemWidget(shop: shop, onTap: onTap);
        break;
      case ShopType.discounted:
        return _discountShopItemWidget(shop: shop);
        break;
      case ShopType.searchedShop:
        return _searchedShopItemWidget(shop: shop, onTap: onTap);
    }
  }

  double _itemHeight({required ShopType shopType}) {
    switch (shopType) {
      case ShopType.recommended:
        return AppDimens.dimen260;
        break;
      case ShopType.favorite:
        return AppDimens.dimen160;
        break;
      case ShopType.nearYou:
        return AppDimens.dimen160;
        break;
      case ShopType.discounted:
        return AppDimens.dimen160;
        break;
      case ShopType.searchedShop:
        return AppDimens.dimen150;
    }
  }

  ///Entry to create diversified shops based on the [shopType] specified
  Widget shopListWidget({
    required List<ShopModel> shopList,
    required RxBool isDoneLoading,
    ShopType shopType = ShopType.nearYou,
    String? title,
    String? asset,
    String subTitle = 'View All',
    Function(ShopModel)? onTap,
    Function(ProductModel)? onProductTap,
    GestureTapCallback? onSubTitleTap,
    EdgeInsetsGeometry? padding,
  }) {
    return Obx(
      () => shopList.isNotEmpty && isDoneLoading.value
          ? Padding(
              padding: padding ??
                  EdgeInsets.symmetric(
                    horizontal: AppDimens.dimen16,
                    vertical: AppDimens.dimen10,
                  ),
              child: Column(
                children: [
                  if (title != null)
                    UiApi.titleIconWidget(
                      title: title,
                      subTitle: subTitle,
                      asset: asset,
                      onTap: onSubTitleTap,
                    ),
                  SizedBox(height: AppDimens.dimen5),
                  SizedBox(
                    height: _itemHeight(shopType: shopType),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...shopList.map((e) => shopItemWidget(
                              shop: e,
                              shopType: shopType,
                              onTap: onTap,
                              onProductTap: onProductTap,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          : shopList.isEmpty && isDoneLoading.value
              ? const SizedBox.shrink()
              : UiApi.loader(size: 2),
    );
  }

  Widget _recommendedShopItemWidget({
    required ShopModel shop,
    Function(ShopModel)? onTap,
    Function(ProductModel)? onProductOnTap,
  }) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(shop);
        }
      },
      child: Container(
        width: SizeConfig.screenWidth * 0.85,
        decoration: const MatrixDecoration(
          lineColor: Colors.black,
          backgroundColor: AppColors.white,
          radius: Radius.circular(10),
          lineWidth: 1,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen5,
          vertical: AppDimens.dimen5,
        ),
        padding: EdgeInsets.all(AppDimens.dimen5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(AppDimens.dimen2),
                  decoration: UiApi.deco(
                    opacity: 0,
                    borderRadius: 10,
                    borderWidth: 2,
                    borderColor: AppColors.backgroundExt,
                  ),
                  child: UiApi.imageLoader(
                    url: shop.logo,
                    height: AppDimens.dimen30,
                    width: AppDimens.dimen30,
                  ),
                ),
                SizedBox(width: AppDimens.dimen5),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                              text: shop.name.capitalizeFirstLetters(),
                              style: AppTextStyles.descStyleBold)
                        ],
                        maxLines: 2,
                      ),
                      if (shop.description.isNotEmpty)
                        SizedBox(height: AppDimens.dimen3),
                      if (shop.description.isNotEmpty)
                        UiApi.richText(
                          mod: [
                            RichTextModel(
                                text: shop.description,
                                style: AppTextStyles.smallSubDescStyleLight)
                          ],
                          maxLines: 3,
                        ),
                      SizedBox(height: AppDimens.dimen5),
                      Row(
                        children: [
                          FutureBuilder<String>(
                            future: ServiceInjectors()
                                .geolocationApi
                                .getDistanceFromSelectedPosition(
                                    shop.location ?? const Coordinates()),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              return snapshot.hasData
                                  ? UiApi.textAndIcon(
                                      text: snapshot.data,
                                      icon: Icons.location_on,
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                          UiApi.textAndIcon(
                            text: 'Mon - Fri',
                            icon: Icons.date_range,
                          ),
                          UiApi.textAndIcon(
                            text: '8am - 10pm',
                            icon: Icons.access_time_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.dimen10),
            UiApi.horizontalListView(
              aspectRatio: 1.8,
              padding: EdgeInsets.zero,
              list: [
                ...shop.latestProducts.map(
                  (e) {
                    e = e.copyWith(shop: shop);
                    return Padding(
                      padding: EdgeInsets.only(right: AppDimens.dimen10),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: AppDimens.dimen120),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            UiApi.imageLoaderExt(
                              images: e.images,
                              height: AppDimens.dimen110,
                              width: AppDimens.dimen110,
                              title: e.name.capitalizeFirstLetters(),
                              heroTag: const Uuid().v4(),
                              subWidget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "GHS ",
                                        style: AppTextStyles.h4StyleSemiBold
                                            .copyWith(
                                          color: AppColors.redLight,
                                        ),
                                      ),
                                      Text(
                                        NumberUtils.moneyFormatDouble(e.price,
                                            decPlace: 2),
                                        style: AppTextStyles.h4StyleSemiBold
                                            .copyWith(
                                          color: AppColors.redLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppDimens.dimen10),
                                  Text(
                                    e.description,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyles.descStyleRegular,
                                  ),
                                  SizedBox(height: AppDimens.dimen50),
                                  UiApi.buttonFilled(
                                    valueText: NumberUtils.moneyCurrencyFormat(
                                        e.price,
                                        dec: 2),
                                    buttonText: 'Add To Basket',
                                    size: SizeConfig.screenWidth * 0.9,
                                    fillPercent: 0.5,
                                    leftColor: AppColors.dimWhiteExt,
                                    rightColor: AppColors.market3,
                                    onTap: () {
                                      if (onProductOnTap != null) {
                                        onProductOnTap(e);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: AppDimens.dimen5),
                            UiApi.richText(textAlign: TextAlign.center, mod: [
                              RichTextModel(
                                text: e.name,
                                style: AppTextStyles.smallerSubDescStyleBold
                                    .copyWith(color: AppColors.black),
                              ),
                            ]),
                            UiApi.richText(
                              textAlign: TextAlign.center,
                              mod: [
                                RichTextModel(
                                  text: e.description,
                                  style: AppTextStyles.smallerSubDescStyleLight
                                      .copyWith(color: AppColors.black),
                                ),
                              ],
                              maxLines: 2,
                            ),
                            UiApi.richText(
                              textAlign: TextAlign.center,
                              mod: [
                                if (e.discount > 0)
                                  RichTextModel(
                                    text: 'GHS ',
                                    style: AppTextStyles
                                        .smallestSubDescStyleRegular
                                        .copyWith(
                                      color: AppColors.market3,
                                      decoration: TextDecoration.lineThrough,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                if (e.discount > 0)
                                  RichTextModel(
                                    text: NumberUtils.moneyFormat(e.discount,
                                        decPlace: 2),
                                    style: AppTextStyles.smallerSubDescStyleBold
                                        .copyWith(
                                      color: AppColors.market3,
                                      decoration: TextDecoration.lineThrough,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                if (e.discount > 0)
                                  RichTextModel(
                                    text: '\n',
                                    style: AppTextStyles
                                        .smallerSubDescStyleRegular,
                                  ),
                                RichTextModel(
                                  text: 'GHS ',
                                  style: AppTextStyles
                                      .smallerSubDescStyleRegular
                                      .copyWith(color: AppColors.market3),
                                ),
                                RichTextModel(
                                  text: NumberUtils.moneyFormatDouble(e.price,
                                      decPlace: 2),
                                  style: AppTextStyles.smallSubDescStyleBold
                                      .copyWith(color: AppColors.market3),
                                ),
                              ],
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  ///DISCOUNTED Shops here
  Widget _discountShopItemWidget({required ShopModel shop}) {
    return Container(
      decoration: const MatrixDecoration(
        lineColor: Colors.black,
        backgroundColor: AppColors.white,
        // radius: Radius.circular(20),
        // lineWidth: 1,
        //distanceBetweenLines: 5,
      ),

      /*UiApi.deco(
        gradient: const LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          stops: [0.3, 1.0],
          colors: [Colors.white, Colors.grey],
        ),
        borderColor: AppColors.white,
      ),*/
      width: AppDimens.dimen160,
      // padding: EdgeInsets.all(AppDimens.dimen10),
      margin: EdgeInsets.only(
        right: AppDimens.dimen5,
        top: AppDimens.dimen5,
        bottom: AppDimens.dimen5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: AppDimens.dimen5),
          UiApi.circleImageView(
            url: shop.logo,
            radius: AppDimens.dimen35,
          ),
          SizedBox(height: AppDimens.dimen5),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: UiApi.richText(
                        maxLines: 2,
                        mod: [
                          RichTextModel(
                            text: shop.name.capitalizeFirstLetters(),
                            style: AppTextStyles.smallSubDescStyleBold.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimens.dimen5),
                    UiApi.assetImage(
                      AssetsConfig.discount,
                      height: AppDimens.dimen20,
                      width: AppDimens.dimen20,
                    ),
                    SizedBox(height: AppDimens.dimen3),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _shopWithDetailsItemWidget(
    ShopModel shop, {
    Function(ShopModel)? onTap,
  }) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(shop);
        }
      },
      child: Container(
        decoration: UiApi.deco(
          opacity: 0.3,
          color: AppColors.background,
          borderColor: AppColors.background,
        ),
        width: SizeConfig.screenWidth * .78,
        margin: EdgeInsets.only(
          right: AppDimens.dimen8,
          left: AppDimens.dimen8,
          top: AppDimens.dimen5,
          bottom: AppDimens.dimen5,
        ),
        padding: EdgeInsets.all(AppDimens.dimen10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: UiApi.richText(
                      maxLines: 2,
                      mod: [
                        RichTextModel(
                          text: shop.name.capitalizeFirstLetters(),
                          style: AppTextStyles.descStyleBold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Flexible(
                    child: Text(
                      shop.description,
                      style: AppTextStyles.subDescStyleLight.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  if ((shop.location?.address ?? '').isNotEmpty)
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: AppDimens.dimen20,
                        ),
                        Expanded(
                          child: UiApi.richText(
                            maxLines: 2,
                            mod: [
                              RichTextModel(
                                text: shop.location?.address ?? '',
                                style: AppTextStyles.smallSubDescStyleRegular
                                    .copyWith(
                                  color: AppColors.primaryGreenColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
            SizedBox(width: AppDimens.dimen10),
            UiApi.imageLoader(
              height: AppDimens.dimen100,
              width: AppDimens.dimen100,
              url: shop.logo,
            )
          ],
        ),
      ),
    );
  }

  Widget _searchedShopItemWidget(
      {required ShopModel shop, Function(ShopModel)? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(shop);
        }
      },
      child: Container(
        child: Text(shop.name),
        padding: EdgeInsets.all(AppDimens.dimen10),
      ),
    );
  }
}
