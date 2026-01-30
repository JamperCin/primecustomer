import 'package:primecustomer/controller/market/more_products_controller.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/product_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

import '../../../../../res/app/app_dimens.dart';

class MoreProductsScreen extends BaseScreenStandard {
  final controller = Get.put(MoreProductsController());

  MoreProductsScreen() {
    controller.onInitData();
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
  double appBarHeight() {
    return AppDimens.dimen60;
  }

  @override
  String appBarTitle() {
    return "More Products";
  }

  @override
  List<Widget> actions() {
    return [
      UiApi.circleEmpty(
        onTap: controller.onGoToCart,
        borderWidth: 1.0,
        padding: EdgeInsets.all(AppDimens.dimen8),
        margin: EdgeInsets.only(
            right: AppDimens.dimen20,
            top: AppDimens.dimen3,
            bottom: AppDimens.dimen3),
        borderColor: Colors.transparent,
        child: UiApi.appBarNotification(
          controller.serviceInjectors.cartService.totalQuantity,
          iconSize: AppDimens.dimen25,
          asset: AssetsConfig.shoppingCart,
          iconColor: AppColors.black,
        ),
      )
    ];
  }

  @override
  Widget body(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.fetchProductsFromAllShops(refresh: true);
      },
      backgroundColor: AppColors.primaryGreenColor,
      color: AppColors.white,
      child: UiApi.listView(
        list: listView(),
        isLoadingMore: controller.isLoadingMore,
        scrollController: controller.scrollController,
        padding: EdgeInsets.only(
            top: AppDimens.dimen10,
            bottom: MediaQuery.of(context).padding.bottom),
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> listViews = <Widget>[];

    listViews.add(SizedBox(height: AppDimens.dimen10));

    /// SearchBar and filter for the category
    listViews.add(UiApi.searchBarWidget(
      borderRadius: 10,
      backgroundColor: AppColors.white,
      borderColor: AppColors.white,
      margin: EdgeInsets.symmetric(horizontal: AppDimens.dimen12),
      hintText: "Search for merchant or product...",
      enabled: false,
      onTap: () {
        controller.onSearchProduct();
      },
    ));

    listViews.add(SizedBox(height: AppDimens.dimen10));

    ///Menu Categories TitleView
    // listViews.add(UiApi.titleView(
    //   title: "Explore Merchants",
    //   backgroundColor: AppColors.background,
    //   subTitle: UiApi.subTitleView(
    //     text: "View All",
    //     style: AppTextStyles.subDescStyleMedium
    //         .copyWith(color: AppColors.dimWhiteExt),
    //     onSubTextOnClick: () {
    //       // controller.viewAllMenuCategories();
    //     },
    //   ),
    // ));

    // listViews.add(
    //   UiApi.shopLogoListWidget(
    //       storeList: controller.stores,
    //       onStoreOnClick: (store) {
    //         controller.onGoToStore(store);
    //       }),
    // );

    // listViews.add(SizedBox(height: AppDimens.dimen20));

    ///More Products items displayed here
    listViews.add(
      ProductApi.gridVertical(
        list: controller.products,
        isDone: controller.isDoneLoadingShops,
        title: "",
        subTitleWidget: const SizedBox.shrink(),
        onProductOnTap: controller.onProductOnTap,
        //  onBasketOnTap: controller.onAddToBasket,
        onAddToBasketOnTap: controller.onAddProductToBasket,
      ),
    );

    return listViews;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Obx(
      () => controller.serviceInjectors.cartService.productsInBasket.isNotEmpty
          ? /* Padding(
        padding: EdgeInsets.only(
          right: AppDimens.dimen20,
          left: AppDimens.dimen20,
        ),
        child: UiApi.buttonFilled(
          fillPercent: 0.5,
          onTap: controller.onCheckOutOnClick,
          buttonText: 'Save To Cart',
          rightColor: AppColors.market3,
          valueText:
          'GHS ${controller.serviceInjectors.cartService.totalOrderAmount.value}',
        ),
      )*/
          Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: UiApi.deco(),
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.only(
                    left: AppDimens.dimen10,
                    top: AppDimens.dimen10,
                    right: AppDimens.dimen10,
                    bottom: AppDimens.dimen10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Bounce(
                            child: UiApi.richText(mod: [
                              RichTextModel(
                                text: "Total: ",
                                style: AppTextStyles.titleStyleBold,
                              ),
                              RichTextModel(
                                text: "¢",
                                style: AppTextStyles.descStyleRegular
                                    .copyWith(color: AppColors.redLight),
                              ),
                              RichTextModel(
                                text: controller.serviceInjectors.cartService
                                    .totalOrderAmount.value,
                                style: AppTextStyles.h4StyleBold
                                    .copyWith(color: AppColors.redLight),
                              ),
                            ]),
                          ),
                          Text(
                            "Excluding Delivery fee",
                            style: AppTextStyles.subDescStyleLight
                                .copyWith(color: AppColors.deactivatedText),
                          )
                        ],
                      ),
                      UiApi.decoratedButton(
                        width: SizeConfig.screenWidth * 0.4,
                        text: "View Basket",
                        style: AppTextStyles.subDescStyleBold
                            .copyWith(color: AppColors.white),
                        icon: const SizedBox.shrink(),
                        padding: EdgeInsets.only(right: AppDimens.dimen5),
                        backgroundColor: AppColors.market3,
                        onTap: () {
                          controller.onViewItemsInBasket();
                        },
                      )
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
