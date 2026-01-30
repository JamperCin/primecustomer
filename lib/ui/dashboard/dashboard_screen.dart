import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/contacts_api.dart';
import 'package:primecustomer/res/api/prominent_disclosure.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

import '../../controller/view/dashboard_controller.dart';
import '../../data/enum/BottomBarIndex.dart';
import 'nav_drawer/DrawerScaffold.dart';

class MainDashboardScreen extends BaseScreenStandard {
  final DashBoardController controller = Get.put(DashBoardController());

  MainDashboardScreen() {
    Utils.startTimer(3, () {
      controller.checkForAppUpdate();
      ProminentDisclosureApi().showLocationDisclosure(
        onAccept: (accepted) {
          if (accepted) {
            ServiceInjectors().geolocationApi.init();
          }
        },
      );

      ProminentDisclosureApi().showContactsDisclosure(
        onAccept: (accepted) {
          if (accepted) {
            ContactsApi().requestForPermission();
          }
        },
      );
    });
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
          () => isGuestUser.value
              ? controller.homeScreen
              : DrawerScaffold(
                  screenIndex: controller.drawerIndex[0],
                  onDrawerCall: controller.onChangeDrawer,
                  screenView: controller.screenView[0],
                ),
        ),
      ),
    );
  }

  @override
  FloatingActionButtonLocation actionButtonLocation() {
    return FloatingActionButtonLocation.centerDocked;
  }

  Widget floatingButton() {
    return UiApi.circleEmpty(
      backGroundColor: AppColors.primaryGreenColor,
      borderColor: AppColors.primaryGreenColor,
      opacity: 1,
      size: AppDimens.dimen50,
      padding: EdgeInsets.all(AppDimens.dimen10),
      child: UiApi.assetImage("assets/images/ic_market.svg"),
      onTap: () {
        controller.onBottomItemOnClick(BottomBarIndex.MARKET_PLACE);
      },
    );
  }

  ///OnClick Listener to the middle floating action button
  @override
  Widget floatingActionButton(BuildContext context) {
    return Obx(
      () => isGuestUser.value
          ? const SizedBox()
          : Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: ZoomIn(child: floatingButton()),
            ),
    );
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Obx(
      () => isGuestUser.value
          ? const SizedBox()
          : BottomAppBar(
              color: AppColors.white,
              surfaceTintColor: AppColors.white,
              notchMargin: 5,
              elevation: 20,
              shape: const CircularNotchedRectangle(),
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.dimen8,
                  right: AppDimens.dimen8,
                  top: AppDimens.dimen3,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        UiApi.bottomNavItem(
                          iconAsset: "assets/images/ic_home.svg",
                          text: "Home",
                          iconSize: AppDimens.dimen25,
                          iconColor: controller.bottomItemColors[0],
                          animKey: GlobalKey<AnimatorWidgetState>(),
                          onTap: () {
                            controller.onBottomItemOnClick(BottomBarIndex.HOME);
                          },
                        ),
                        // SizedBox(width: AppDimens.dimen35),
                        // UiApi.bottomNavItem(
                        //   iconAsset: "assets/images/scan.png",
                        //   text: "Add Funds",
                        //   iconSize: AppDimens.dimen20,
                        //   iconColor: controller.bottomItemColors[1],
                        //   animKey: GlobalKey<AnimatorWidgetState>(),
                        //   onTap: () {
                        //     controller
                        //         .onBottomItemOnClick(BottomBarIndex.PROMO);
                        //   },
                        // ),
                        UiApi.bottomNavItem(
                          iconAsset: "assets/images/ic_promo.svg",
                          text: "Promo",
                          iconSize: AppDimens.dimen20,
                          iconColor: controller.bottomItemColors[1],
                          animKey: GlobalKey<AnimatorWidgetState>(),
                          onTap: () {
                            controller.onBottomItemOnClick(
                              BottomBarIndex.PROMO,
                            );
                          },
                        ),
                        // Spacer(),
                        SizedBox(width: AppDimens.dimen35),
                        UiApi.bottomNavItem(
                          iconAsset: "assets/images/ic_cart.svg",
                          text: "Cart",
                          isBadge: true,
                          count: CardController.cartTotalItems,
                          iconSize: AppDimens.dimen28,
                          iconColor: controller.bottomItemColors[2],
                          animKey: GlobalKey<AnimatorWidgetState>(),
                          onTap: () {
                            controller.onBottomItemOnClick(BottomBarIndex.CART);
                          },
                        ),
                        // SizedBox(width: AppDimens.dimen35),
                        UiApi.bottomNavItem(
                          iconAsset: "assets/images/ic_wallet.svg",
                          text: "Wallet",
                          //isBadge: false,
                          iconColor: controller.bottomItemColors[3],
                          iconSize: AppDimens.dimen25,
                          animKey: GlobalKey<AnimatorWidgetState>(),
                          onTap: () {
                            controller.onBottomItemOnClick(
                              BottomBarIndex.WALLET,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
