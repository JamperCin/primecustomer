import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/market/market_place_dashboard_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

import '../../../data/enum/market_bottom_bar.dart';

class MarketPlaceDashboardScreen extends BaseScreenStandard {
  final controller = Get.put(MarketPlaceDashboardController());

  MarketPlaceDashboardScreen() {
    controller.initData();
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.nearlyWhite,
        body: Obx(
          () => controller.screenView.isNotEmpty
              ? controller.screenView[0]
              : const SizedBox(),
        ),
      ),
    );
  }

  @override
  FloatingActionButtonLocation actionButtonLocation() {
    return FloatingActionButtonLocation.centerDocked;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Obx(
      () => BottomAppBar(
        color: AppColors.white,
        notchMargin: 5,
        elevation: 20,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.only(
              left: AppDimens.dimen8,
              right: AppDimens.dimen8,
              top: AppDimens.dimen3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UiApi.bottomNavItem(
                iconAsset: "assets/images/ic_home.svg",
                text: "Stores",
                iconSize: AppDimens.dimen25,
                iconColor: controller.bottomItemColors[0],
                animKey: GlobalKey<AnimatorWidgetState>(),
                onTap: () {
                  controller.onBottomBarItemSelected(MarketBottomBarIndex.HOME);
                },
              ),
              UiApi.bottomNavItem(
                iconAsset: "assets/images/ic_promo.svg",
                text: "Deals",
                iconSize: AppDimens.dimen18,
                iconColor: controller.bottomItemColors[1],
                animKey: GlobalKey<AnimatorWidgetState>(),
                onTap: () {
                  controller
                      .onBottomBarItemSelected(MarketBottomBarIndex.DEALS);
                },
              ),
              UiApi.bottomNavItem(
                iconAsset: "assets/images/ic_cart.svg",
                text: "Cart",
                isBadge: true,
                count: CardController.cartTotalItems,
                iconSize: AppDimens.dimen28,
                iconColor: controller.bottomItemColors[2],
                animKey: GlobalKey<AnimatorWidgetState>(),
                onTap: () {
                  controller.onBottomBarItemSelected(MarketBottomBarIndex.CART);
                },
              ),
              UiApi.bottomNavItem(
                iconAsset: "assets/images/ic_wallet.svg",
                text: "Orders",
                isBadge: true,
                iconColor: controller.bottomItemColors[3],
                iconSize: AppDimens.dimen25,
                animKey: GlobalKey<AnimatorWidgetState>(),
                onTap: () {
                  controller
                      .onBottomBarItemSelected(MarketBottomBarIndex.ORDERS);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
