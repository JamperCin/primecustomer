import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/advert_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/basic/advert_controller.dart';
import '../../../../controller/market/market_place_home_controller.dart';
import '../../../../controller/market/products_controller.dart';
import '../../../../res/app/app_colors.dart';
import '../../../../res/app/app_dimens.dart';
import '../../../../res/ui_helpers/product_api.dart';
import '../../../../res/ui_helpers/ui_api.dart';

class MarketHomeScreen extends BaseScreenStandard {
  final controller = Get.put(MarketPlaceHomeController());

  MarketHomeScreen() {
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
  String appBarTitle() {
    return "MarketPlace";
  }

  @override
  double appBarHeight() {
    return AppDimens.dimen60;
  }

  /* @override
  Widget? appBarTitleWidget() {
    return Obx(
      () => UiApi.searchBarWidget(
        backgroundColor: AppColors.white,
        hintTextStyle: isExpanded.value
            ? AppTextStyles.smallerSubDescStyleLight
                .copyWith(color: AppColors.iconColor)
            : AppTextStyles.subDescStyleLight
                .copyWith(color: AppColors.iconColor),
        textStyle: isExpanded.value
            ? AppTextStyles.smallerSubDescStyleLight
            : AppTextStyles.subDescStyleLight,
        margin: EdgeInsets.only(
          left: isExpanded.value ? AppDimens.dimen10 : AppDimens.dimen60,
          right: AppDimens.dimen10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen5,
          vertical: isExpanded.value ? AppDimens.dimen3 : AppDimens.dimen4,
        ),
        borderRadius: 30,
        hintText: 'Search products and brands',
        trailWidget: !isExpanded.value
            ? InkWell(
                onTap: controller.onFilterOnClick,
                child: Container(
                  decoration: UiApi.deco(
                    color: AppColors.black,
                    borderRadius: 20,
                  ),
                  height: AppDimens.dimen30,
                  width: AppDimens.dimen30,
                  padding: EdgeInsets.all(AppDimens.dimen5),
                  child: UiApi.assetImage(
                    "assets/images/ic_filter.svg",
                    height: AppDimens.dimen10,
                    width: AppDimens.dimen10,
                    assetColor: AppColors.white,
                  ),
                ),
              )
            : SizedBox(height: AppDimens.dimen10),
      ),
    );
  }*/

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
        borderColor: AppColors.iconColor,
        child: UiApi.appBarNotification(
          ProductsController.totalQuantity,
          asset: 'assets/images/ic_basket_cart.svg',
          iconColor: AppColors.iconColor,
        ),
      )
    ];
  }

  @override
  Widget body(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.fetchProducts(refresh: true);
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

    // listViews.add(UiApi.securityQuestionsWarning());

    // listViews.add(SizedBox(height: AppDimens.dimen5));

    // listViews.add(UiApi.horizontalListView(
    //   aspectRatio: 5.4,
    //   list: [
    //     ...controller.menuList.map((e) => UiApi.scrollingMenuItem(e, onTap: () {
    //           controller.onMenuTapped(e);
    //         }))
    //   ],
    // ));

    listViews.add(SizedBox(height: AppDimens.dimen10));

    ///Menu Categories TitleView
    listViews.add(UiApi.titleView(
      title: "Categories",
      backgroundColor: AppColors.background,
      subTitle: UiApi.subTitleView(
        text: "View All",
        style: AppTextStyles.subDescStyleMedium
            .copyWith(color: AppColors.dimWhiteExt),
        onSubTextOnClick: () {
          // controller.viewAllMenuCategories();
        },
      ),
    ));

    /// Add Menu categories like Wedding, Christmas etc
    listViews.add(UiApi.menuListWidget(
        menuList: controller.menuCatList,
        rectangularShape: true,
        onMenuOnClick: (menu) {
          // controller.viewAllTypesOfCardOnClick(menu: menu);
        }));

    listViews.add(SizedBox(height: AppDimens.dimen20));

    /// SearchBar and filter for the category
    listViews.add(UiApi.searchBarWidget(
      borderRadius: 10,
      backgroundColor: AppColors.white,
      borderColor: AppColors.white,
      margin: EdgeInsets.symmetric(horizontal: AppDimens.dimen12),
      hintText: "Search for merchant or product...",
      enabled: false,
      onTap: () {
        // controller.cardController?.searchCard(mContext!);
      },
      onSearchChanged: (val) {
        //controller.onSearchOnline(val);
      },
    ));

    listViews.add(SizedBox(height: AppDimens.dimen20));

    ///Explore Merchants TitleView
    listViews.add(UiApi.titleView(
      title: "Explore Merchants",
      backgroundColor: AppColors.background,
      subTitle: UiApi.subTitleView(
        text: "View All",
        style: AppTextStyles.subDescStyleMedium
            .copyWith(color: AppColors.dimWhiteExt),
        onSubTextOnClick: () {
          // controller.viewAllMenuCategories();
        },
      ),
    ));

    listViews.add(
      UiApi.shopLogoListWidget(
          storeList: controller.stores,
          onStoreOnClick: (store) {
            controller.onGoToStore(store);
          }),
    );

    listViews.add(SizedBox(height: AppDimens.dimen20));

    ///Best Selling items displayed here
    listViews.add(
      ProductApi.linearHorizontal(
        list: controller.products,
        isDone: controller.isDoneLoadingShops,
        title: "Best Selling Products",
        subTitleWidget: const SizedBox(),
        onProductOnTap: controller.onProductOnTap,
        onBasketOnTap: controller.onAddToBasket,
      ),
    );

    listViews.add(AdvertApi.renderAdvert(list: AdvertController.advertList));
    listViews.add(SizedBox(height: AppDimens.dimen20));

    ///Newly Arrived items displayed here
    listViews.add(
      ProductApi.linearHorizontal(
        list: controller.products,
        isDone: controller.isDoneLoadingShops,
        title: "Newly Arrived Products",
        subTitleWidget: const SizedBox(),
        onProductOnTap: controller.onProductOnTap,
        onBasketOnTap: controller.onAddToBasket,
      ),
    );

    listViews.add(SizedBox(height: AppDimens.dimen20));

    ///More Products items displayed here
    listViews.add(
      ProductApi.gridVertical(
        list: controller.products,
        isDone: controller.isDoneLoadingShops,
        title: "More Products",
        onSubTextOnClick: controller.onGoToMoreProducts,
        onProductOnTap: controller.onProductOnTap,
        onBasketOnTap: controller.onAddToBasket,
      ),
    );

    return listViews;
  }
}
