import 'package:primecustomer/controller/market/CartCheckOutController.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/ui_helpers/product_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/app/app_colors.dart';
import '../../../../res/app/app_dimens.dart';
import '../../../../res/ui_helpers/ui_api.dart';

class CartBasketScreen extends BaseScreenStandard {
  final controller = Get.put(CartCheckOutController());

  CartBasketScreen() {
    controller.fetchOtherProductsFromSameShop();
  }

  @override
  String appBarTitle() {
    return "My Basket";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Color backgroundColor() {
    return AppColors.background;
  }

  @override
  List<Widget> actions() {
    return [
      UiApi.circleEmpty(
        onTap: controller.onGoToCartSummary,
        borderWidth: 1.0,
        padding: EdgeInsets.all(AppDimens.dimen8),
        margin: EdgeInsets.only(
            right: AppDimens.dimen5,
            top: AppDimens.dimen3,
            bottom: AppDimens.dimen3),
        borderColor: Colors.transparent,
        child: UiApi.appBarNotification(
          controller.serviceInjectors.cartService.totalQuantity,
          iconSize: AppDimens.dimen25,
          asset: AssetsConfig.shoppingCart,
          iconColor: AppColors.black,
        ),
      ),
    ];
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      padding: EdgeInsets.zero,
    );
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Obx(
      () => controller.serviceInjectors.cartService.productsInBasket.isNotEmpty
          ? Container(
              decoration: UiApi.deco(borderRadius: 0),
              padding: EdgeInsets.only(
                bottom: AppDimens.dimen16,
                top: AppDimens.dimen8,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: AppDimens.dimen14,
                  left: AppDimens.dimen14,
                ),
                child: UiApi.buttonFilled(
                  fillPercent: 0.56,
                  onTap: controller.onCheckOutOnClick,
                  buttonText: 'Proceed To Payment',
                  rightColor: AppColors.market3,
                  valueText:
                      'GHS ${controller.serviceInjectors.cartService.totalOrderAmount.value}',
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(
      Obx(
        () => controller.serviceInjectors.cartService.productsInBasket.isEmpty
            ? Column(
                children: [
                  SizedBox(height: AppDimens.dimen100),
                  UiApi.noDataWidget(
                    title: "Your basket is Empty",
                    asset: AssetsConfig.basketWithProducts,
                    assetSize: AppDimens.dimen250,
                    message:
                        "Kindly use the button below to add products to your basket before checking out.",
                  ),
                  SizedBox(height: AppDimens.dimen60),
                  UiApi.button(
                    text: "Shop Now",
                    backgroundColor: AppColors.market3,
                    onPressed: () {
                      controller.onGoToMoreProducts();
                    },
                  ),
                ],
              )
            : Column(
                children: [
                  ...controller.serviceInjectors.cartService.productsInBasket
                      .map((prod) => ProductApi.productBasketItemWidget(
                            prod,
                            onProdUpdate: controller.onAddRemoveCart,
                          ))
                ],
              ),
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen40));

    ///Products from the same shop
    if (controller.serviceInjectors.cartService.productsInBasket.isNotEmpty) {
      list.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductApi.gridHorizontal(
              list: controller.products,
              title: 'You may also like',
              isDone: controller.isDoneLoadingProducts,
              subTitleWidget: Icon(
                Icons.arrow_forward,
                size: AppDimens.dimen20,
                color: AppColors.market3,
              ),
              onAddToBasketOnTap: controller.onAddProductToBasket,
            ),
          ],
        ),
      ));
    }

    return list;
  }
}
