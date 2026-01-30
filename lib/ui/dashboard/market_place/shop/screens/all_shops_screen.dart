import 'package:primecustomer/data/enum/shop_type.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/ui_helpers/product_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_shops_controller.dart';

class AllShopsScreen extends BaseScreenStandard {
  final controller = Get.put(AllShopsController());

  AllShopsScreen() {
    controller.initData();
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  double appBarElevation() {
    return 1;
  }

  @override
  Widget? appBarLeadingIcon() {
    return const SizedBox();
  }

  @override
  Color backgroundColor() {
    return AppColors.background;
  }

  @override
  Widget? appBarTitleWidget() {
    return Obx(
      () => UiApi.locationPickerWidget(
        onTap: controller.onPickAddress,
        address: controller.selectedAddress.value.address,
        isLoadingAddress: controller.isLoadingCurrentAddress.value,
      ),
    );
  }

  @override
  List<Widget> actions() {
    return [
      //todo Enable filter of shops
      // UiApi.circleEmpty(
      //   onTap: controller.onFilterOnClick,
      //   borderWidth: 1.0,
      //   padding: EdgeInsets.all(AppDimens.dimen8),
      //   margin: EdgeInsets.only(
      //       //right: AppDimens.dimen4,
      //       top: AppDimens.dimen6,
      //       bottom: AppDimens.dimen6),
      //   borderColor: Colors.transparent,
      //   child: UiApi.assetImage(
      //     AssetsConfig.filter2,
      //     height: AppDimens.dimen16,
      //     width: AppDimens.dimen16,
      //   ),
      // ),
      UiApi.circleEmpty(
        onTap: controller.onGoToCart,
        borderWidth: 1.0,
        padding: EdgeInsets.all(AppDimens.dimen8),
        margin: EdgeInsets.only(
            right: AppDimens.dimen5,
            top: AppDimens.dimen3,
            bottom: AppDimens.dimen3),
        borderColor: Colors.transparent,
        child: UiApi.appBarNotification(
          controller.serviceInjectors.cartService.totalQuantity,
          // icon: Icons.shopping_cart,
          iconSize: AppDimens.dimen25,
          asset: AssetsConfig.shoppingCart,
          iconColor: AppColors.black,
        ),
      ),
    ];
  }

  @override
  Widget body(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.initData(refresh: true);
      },
      backgroundColor: AppColors.primaryGreenColor,
      color: AppColors.white,
      child: Column(
        children: [
          UiApi.searchBarWidget(
            borderRadius: 40,
            margin: EdgeInsets.all(AppDimens.dimen20),
            hintText: 'Search for shop or product...',
            enabled: false,
            onTap: controller.onSearchProduct,
            backgroundColor: AppColors.background,
            borderColor: AppColors.background,
          ),
          Expanded(
            child: UiApi.listView(
              list: listView(),
              isLoadingMore: controller.isLoadingMore,
              scrollController: controller.scrollController,
              padding: EdgeInsets.only(
                top: AppDimens.dimen10,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    /// Add Menu categories like Wedding, Christmas etc
    list.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen16),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: AppDimens.dimen28, maxHeight: AppDimens.dimen30),
        child: Obx(
          () => ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...controller.menuCatList.map(
                (element) => UiApi.menuStrippedItem(
                  element,
                  onTap: controller.onMenuSelected,
                ),
              )
            ],
          ),
        ),
      ),
    ));

    // list.add(UiApi.menuListWidget(
    //     menuList: controller.menuCatList,
    //     rectangularShape: true,
    //     onMenuOnClick: (menu) {
    //       // controller.viewAllTypesOfCardOnClick(menu: menu);
    //     }));

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(Obx(
      () => controller.discountedProducts.isNotEmpty
          ? Padding(
              padding: EdgeInsets.only(
                left: AppDimens.dimen16,
                right: AppDimens.dimen16,
                top: AppDimens.dimen14,
              ),
              child: UiApi.titleIconWidget(
                title: "Products with discount",
                asset: AssetsConfig.discount,
              ),
            )
          : const SizedBox.shrink(),
    ));

    ///List of Discounted Products
    list.add(ProductApi.discountedProductWidget(
      onTap: controller.onProductOnTap,
      products: controller.discountedProducts,
      isDoneLoading: controller.isDoneLoadingDiscountedProducts,
    ));

    list.add(SizedBox(height: AppDimens.dimen20));

    ///List of Shops or Stores Near You
    list.add(controller.shopsApi.shopListWidget(
      title: "Merchants Near You",
      shopList: controller.listOfShops,
      isDoneLoading: controller.isDoneLoading,
      shopType: ShopType.nearYou,
      onTap: controller.onShopClicked,
      onSubTitleTap: () {},
    ));

    ///Recommended Products on the platform
    list.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimens.dimen5),
          ProductApi.recommended(
            list: controller.products,
            titleWidget: Padding(
              padding: EdgeInsets.only(
                left: AppDimens.dimen14,
                right: AppDimens.dimen14,
                top: AppDimens.dimen14,
              ),
              child: UiApi.titleIconWidget(
                title: "Recommended Products for you",
                subTitle: 'View All',
                asset: AssetsConfig.recommendedProducts,
              ),
            ),
            // padding: EdgeInsets.only(right: AppDimens.dimen16),
            isDone: controller.isDoneLoadingProducts,
            subTitleWidget: const SizedBox(),
            onProductOnTap: controller.onProductOnTap,
          ),
        ],
      ),
    ));

    ///Best Selling Products on the platform
    list.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimens.dimen5),
          ProductApi.linearHorizontal(
            list: controller.products,
            titleWidget: Padding(
              padding: EdgeInsets.only(
                left: AppDimens.dimen14,
                right: AppDimens.dimen14,
                top: AppDimens.dimen14,
              ),
              child: UiApi.titleIconWidget(
                title: "Best Selling Products",
                subTitle: 'View All',
                asset: AssetsConfig.bestProducts,
              ),
            ),
            isDone: controller.isDoneLoadingProducts,
            subTitleWidget: const SizedBox(),
            onProductOnTap: controller.onProductOnTap,
            onFavoriteOnTap: controller.onFavoriteOnTap,
            //onBasketOnTap: controller.onAddToBasket,
          ),
        ],
      ),
    ));

    ///List of Shops with their sample products
    list.add(controller.shopsApi.shopListWidget(
      title: "Recommended Shops",
      subTitle: 'View All',
      asset: AssetsConfig.crown,
      shopList: controller.shopsWithProducts,
      shopType: ShopType.recommended,
      isDoneLoading: controller.isDoneLoadingShopsWithProducts,
      onProductTap: controller.onAddToBasket,
    ));

    ///List of Shops or Stores With Discounts
    list.add(controller.shopsApi.shopListWidget(
      title: "Shops with discounts",
      subTitle: 'View All',
      shopType: ShopType.discounted,
      asset: AssetsConfig.discount,
      shopList: controller.discountShops,
      isDoneLoading: controller.isDoneLoading,
      onTap: controller.onShopClicked,
    ));

    return list;
  }
}
