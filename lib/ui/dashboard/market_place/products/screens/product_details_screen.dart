import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/extensions/string_extension.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../../../controller/market/product_details_controller.dart';
import '../../../../../res/ui_helpers/product_api.dart';
import '../../../../../res/ui_helpers/ui_api.dart';
import '../../../../base/base_sliver_basic.dart';

class ProductDetailsScreen extends BaseSliverBasic {
  final controller = Get.put(ProductDetailsController());

  ProductDetailsScreen() {
    Utils.delayTimer(() => controller.initData(getModel()));
  }

  @override
  BaseObject getModel() {
    return baseObject;
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget titleWidget(BuildContext context) {
    return Obx(
      () => Text(
        controller.selectedProduct.value.shop.name.capitalizeFirstLetters(),
        style: AppTextStyles.titleStyleRegular.copyWith(color: AppColors.white),
      ),
    );
  }

  @override
  List<Widget> actions() {
    return [
      UiApi.circleEmpty(
        onTap: controller.onViewBasket,
        padding: EdgeInsets.all(AppDimens.dimen8),
        margin: EdgeInsets.only(
            right: AppDimens.dimen14,
            top: AppDimens.dimen3,
            bottom: AppDimens.dimen3),
        borderColor: AppColors.white,
        backGroundColor: Colors.transparent.withOpacity(0.4),
        child: UiApi.appBarNotification(
          ServiceInjectors().cartService.totalQuantity,
          asset: AssetsConfig.shoppingCart,
          iconColor: AppColors.white,
        ),
      ),
    ];
  }

  @override
  Widget page(BuildContext context) {
    return UiApi.listView(list: listView(), padding: EdgeInsets.zero);
  }

  @override
  Widget flexBackGroundWidget() {
    return Obx(
      () => controller.selectedProduct.value.images.isNotEmpty
          ? UiApi.carouselSlider(
              list: controller.selectedProduct.value.images.map(
                (e) {
                  // print("URL : $e == ${controller.selectedProduct.value.displayedImage} => ${e == controller.selectedProduct.value.displayedImage}");
                  return UiApi.imageLoader(
                    url: e,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenWidth,
                    heroTag:
                        e == controller.selectedProduct.value.displayedImage
                            ? controller.selectedProduct.value.heroTag
                            : const Uuid().v4(),
                    border: 0,
                    fit: BoxFit.cover,
                  );
                },
              ).toList(),
              currentPod: controller.currentPodIndex,
            )
          : const SizedBox(),
    );
  }

  @override
  Widget flexBackGroundSubWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.dimen16,
          right: AppDimens.dimen16,
          bottom: AppDimens.dimen16,
        ),
        child: Obx(
          () => UiApi.pod(controller.selectedProduct.value.images.length,
              controller.currentPodIndex,
              activeColor: AppColors.market3),
        ),
      ),
    );
  }

  @override
  Color appBarBackgroundColor() {
    return AppColors.primaryGreenColor;
  }

  @override
  Color backgroundColor() {
    return AppColors.white;
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Obx(
      () => Padding(
        padding: EdgeInsets.only(
          left: AppDimens.dimen16,
          right: AppDimens.dimen16,
          top: AppDimens.dimen20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Product Name ------------
            UiApi.titleWidget(
              text: controller.selectedProduct.value.name,
              fontSize: AppDimens.dimen18,
            ),
            SizedBox(height: AppDimens.dimen20),

            ///Amount of Product --------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ProductApi.amountModuleWidget(
                  controller.selectedProduct.value,
                  textColor: AppColors.market3,
                  textSize: AppDimens.h4,
                  discountTextSize: AppDimens.desc,
                )),
                SizedBox(width: AppDimens.dimen10),
                ProductApi.quantityUpdateWidget(
                  controller.selectedProduct.value,
                  circularButton: true,
                  zeroQuantity: true,
                  textBorderColor: Colors.transparent,
                  textStyle: AppTextStyles.descStyleBold,
                  plusButtonBorderColor: AppColors.market3,
                  plusButtonIconColor: AppColors.white,
                  plusButtonColor: AppColors.market3,
                  onQuantityUpdate: controller.onAddRemoveCart,
                ),
              ],
            ),

            ///Description of Product ------------------
            if (controller.selectedProduct.value.description.isNotEmpty)
              SizedBox(height: AppDimens.dimen20),
            if (controller.selectedProduct.value.description.isNotEmpty)
              UiApi.titleWidget(
                text: "Description",
                fontSize: AppDimens.desc,
              ),
            if (controller.selectedProduct.value.description.isNotEmpty)
              SizedBox(height: AppDimens.dimen3),
            if (controller.selectedProduct.value.description.isNotEmpty)
              UiApi.richText(
                maxLines: 5,
                mod: [
                  RichTextModel(
                    text: controller.selectedProduct.value.description,
                    style: AppTextStyles.subDescRegular,
                  )
                ],
              ),

            ///Color of Product -----------
            if (controller.selectedProduct.value.colors.isNotEmpty)
              SizedBox(height: AppDimens.dimen20),
            if (controller.selectedProduct.value.colors.isNotEmpty)
              Text(
                "Select your preferred Color",
                style: AppTextStyles.descStyleBold,
              ),
            if (controller.selectedProduct.value.colors.isNotEmpty)
              UiApi.horizontalListView(
                aspectRatio: 5.5,
                list: [
                  ...controller.colorsOfProduct.map((e) {
                    return ProductApi.colorOfProductWidget(
                      color: e,
                      selectedColor: controller.selectedColorOfProduct,
                      onTap: controller.onColorSelected,
                    );
                  })
                ],
              ),

            ///Size of Product
            if (controller.selectedProduct.value.size.isNotEmpty)
              SizedBox(height: AppDimens.dimen20),
            if (controller.selectedProduct.value.size.isNotEmpty)
              Text(
                "Select your preferred Size",
                style: AppTextStyles.descStyleBold,
              ),
            if (controller.selectedProduct.value.size.isNotEmpty)
              Obx(
                () => UiApi.horizontalListView(
                  aspectRatio: 5.3,
                  list: [
                    ...controller.sizesOfProduct.map((e) {
                      return ProductApi.sizeOfProductWidget(
                        size: e,
                        selectedSize: controller.selectedSizeOfProduct,
                        onTap: controller.onSizeSelected,
                      );
                    })
                  ],
                ),
              ),
            SizedBox(height: AppDimens.dimen16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product ratings",
                      style: AppTextStyles.descStyleBold,
                    ),
                    SizedBox(height: AppDimens.dimen5),
                    UiApi.ratingBar(
                      rating: controller.selectedProduct.value.rating,
                      rateSize: AppDimens.dimen20,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Rate Product",
                      style: AppTextStyles.descStyleBold,
                    ),
                    RotateIn(
                      key: controller.rateProductKey,
                      child: IconButton(
                        icon: Obx(
                          () => Icon(
                            controller.isRated.value
                                ? Icons.thumb_up_off_alt_sharp
                                : Icons.thumb_up_alt_outlined,
                            color: AppColors.primaryGreenColor,
                            size: AppDimens.dimen25,
                          ),
                        ),
                        onPressed: controller.onRateProductOnClick,
                      ),
                    )
                  ],
                ),
              ],
            ),

            SizedBox(height: AppDimens.dimen10),
            UiApi.iconText(
              iconData: Icons.person,
              iconSize: AppDimens.dimen20,
              text:
                  '${controller.selectedProduct.value.totalCustomerView} ${controller.selectedProduct.value.totalCustomerView > 1 ? 'people' : 'person'} watching this product',
            ),
          ],
        ),
      ),
    ));

    ///Benefits of Product
    list.add(Obx(
      () => controller.selectedProduct.value.benefits.isNotEmpty
          ? Padding(
              padding: EdgeInsets.only(
                left: AppDimens.dimen16,
                right: AppDimens.dimen16,
                top: AppDimens.dimen16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiApi.titleWidget(text: "Benefits Of Product"),
                  SizedBox(height: AppDimens.dimen5),
                  Text(
                    controller.selectedProduct.value.benefits,
                    style: AppTextStyles.subDescRegular,
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    ));

    ///Other related Products
    list.add(Padding(
      padding: EdgeInsets.only(
        left: AppDimens.dimen16,
        right: AppDimens.dimen16,
        top: AppDimens.dimen16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimens.dimen10),
          UiApi.divider(
              width: SizeConfig.screenWidth, color: AppColors.backgroundExt),
          SizedBox(height: AppDimens.dimen10),
          UiApi.titleWidget(
            text: "Related Products",
          ),
        ],
      ),
    ));

    list.add(
      ProductApi.gridVertical(
        //crossAxisCount: 4,
        list: controller.otherProducts,
        isDone: controller.isDoneLoadingProducts,
        titleWidget: const SizedBox.shrink(),
        subTitleWidget: const SizedBox.shrink(),
        onProductOnTap: controller.onProductTapped,
        onAddToBasketOnTap: controller.onAddToBasket,
      ),
    );

    return list;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Container(
      decoration: UiApi.deco(),
      padding: EdgeInsets.only(
        left: AppDimens.dimen10,
        top: AppDimens.dimen5,
        right: AppDimens.dimen10,
        bottom: AppDimens.dimen30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    UiApi.bottomItemWidget(
                      child: HeartBeat(
                        key: controller.wishListKey,
                        child: Obx(
                          () => UiApi.circleEmpty(
                            padding: EdgeInsets.all(AppDimens.dimen5),
                            margin: EdgeInsets.only(left: AppDimens.dimen3),
                            borderColor: AppColors.market3,
                            borderWidth: 1,
                            child: Icon(
                              !controller.isWishListed.value
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: AppColors.market3,
                              size: AppDimens.dimen18,
                            ),
                          ),
                        ),
                      ),
                      text: "Wishlist",
                      onTap: () {
                        controller.onAddToWishlist();
                      },
                    ),
                    SizedBox(width: AppDimens.dimen30),
                    UiApi.bottomItemWidget(
                      asset: AssetsConfig.shopIcon,
                      iconColor: AppColors.black,
                      text: "Visit Shop",
                      iconSize: AppDimens.dimen30,
                      onTap: () {
                        controller.goToMerchantShop();
                      },
                    ),
                  ],
                ),
              ),
              UiApi.button(
                onPressed: () {
                  controller.onViewBasket();
                },
                child: UiApi.buttonChild(
                  assetSize: AppDimens.dimen20,
                  asset: AssetsConfig.shoppingCart,
                  assetColor: AppColors.white,
                  text: 'View Basket',
                  style: AppTextStyles.descStyleMedium
                      .copyWith(color: AppColors.white),
                ),
                backgroundColor: AppColors.primaryGreenColor,
                width: SizeConfig.screenWidth * 0.52,
              ),
            ],
          )
        ],
      ),
    );
  }
}
