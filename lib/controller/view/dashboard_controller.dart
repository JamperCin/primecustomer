import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/enum/drawer_inder.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/api/notification_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/auth/forgotPswd/verify_phone_to_reset_credential.dart';
import 'package:primecustomer/ui/auth/login/login_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/cart/cart_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/home/home_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/promo/promo_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/wallet_main_screen.dart';
import 'package:primecustomer/ui/dashboard/market_place/orders/screens/orders_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/claimCode/claim_code_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/events/events_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/favorite_merchants/favorite_merchants_list.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/more/more_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/profile/profile_page_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/report_issues/report_issues_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/settings/settings_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/transaction_history/main_screen_trans.dart';
import 'package:primecustomer/ui/dashboard/notification/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/enum/BottomBarIndex.dart';
import '../../data/model/local/card_model.dart';
import '../../main.dart';
import '../../res/api/fire_base_api.dart';
import '../../ui/dashboard/bottom_bar_screens/add_funds/screens/add_funds_screen.dart';
import '../../ui/dashboard/bottom_bar_screens/add_funds/screens/scan_to_add_funds.dart';
import '../base/base_controller.dart';

class DashBoardController extends BaseController {
  RxList<Widget> screenView = RxList();
  List<Widget> defaultScreens = [];
  RxList<DrawerIndex> drawerIndex = RxList();
  RxList<Color> bottomItemColors = [
    AppColors.primaryGreenColor,
    AppColors.iconColors,
    AppColors.iconColors,
    AppColors.iconColors,
    AppColors.iconColors,
  ].obs;

  bool isInitialised = false;
  HomeScreen homeScreen = HomeScreen();

  @override
  void onInit() {
    super.onInit();
    initDefaultScreen();
    autoRequestReview();
    getPlatformAccess();

    ///Notify users every morning @8:00 am to check their apps for gift cards
    ///- Check for new app update
    NotificationApi.notifyUsersDailyToCheckPublishedCards();
  }

  @override
  void setContext(BuildContext context) {
    if (!isInitialised) {
      super.setContext(context);
      FireBaseApi.initFireBase(webService!);
      isInitialised = true;
    }
  }

  void initDefaultScreen() {
    screenView.clear();
    drawerIndex.clear();

    defaultScreens.clear();
    defaultScreens.add(homeScreen);
    screenView.add(defaultScreens[0]);
    drawerIndex.add(DrawerIndex.HOME);
  }

  void openScreen(Widget screen) {
    screenView.clear();
    drawerIndex.clear();

    screenView.add(screen);
    // drawerIndex.add(index);
  }

  void forceLogOut() {
    UiApi.showConfirmDialog(
      title: "Sign Out Failing?",
      titleStyle: AppTextStyles.h5StyleBold,
      messageStyle: AppTextStyles.descStyleRegular,
      message: "Are you sure you want to sign out of Prime eGift?",
      imageAsset: "assets/images/ic_exit.png",
      callBack: () {
        prefUtils.clearPreference();
        NavApi.fireAction(EventAction.LOG_OUT);
      },
    );
  }

  void confirmSignOut() {
    UiApi.showConfirmDialog(
      title: "Sign Out",
      titleStyle: AppTextStyles.h5StyleBold,
      messageStyle: AppTextStyles.descStyleRegular,
      message: "Are you sure you want to sign out of Prime eGift?",
      imageAsset: "assets/images/ic_exit.png",
      callBack: () {
        if (isGuestUser.value) {
          signOutAction();
        } else {
          initSignOutRequest();
        }
      },
    );
  }

  void signOutAction() {
    prefUtils.clearPreference();
    navUtils.fireTarget(LoginScreen());
  }

  void initSignOutRequest() {
    HashMap<String, String> param = HashMap();
    param.putIfAbsent("user_type", () => Constants.USER_TYPE);

    webService?.signOut(param, (response) {
      prefUtils.clearPreference();
      NavApi.fireAction(EventAction.LOG_OUT);
    });
  }

  ///OnClick listener to the Drawer Items
  void onChangeDrawer(DrawerIndex index) {
    if (index == DrawerIndex.SIGN_OUT) {
      confirmSignOut();
      return;
    }

    // if (index != drawerIndex[0]) {
    drawerIndex[0] = index;

    switch (index) {
      case DrawerIndex.HOME:
        screenView[0] = HomeScreen();
        //initDefaultScreen();
        setBottomItemColor(0);

        break;
      case DrawerIndex.FAVORITE_MERCHANTS:
        screenView[0] = FavoriteMerchantsListScreen();
        break;
      case DrawerIndex.PROFILE:
        screenView[0] = ProfilePageScreen();
        break;
      case DrawerIndex.ORDERS:
        screenView[0] = OrdersScreen();
        break;
      case DrawerIndex.TRANSACTION_HISTORY:
        screenView[0] = MainScreenTransaction();
        break;
      case DrawerIndex.SETTINGS:
        screenView[0] = SettingsScreen();
        break;
      case DrawerIndex.EVENTS:
        screenView[0] = CalenderEventsScreen();
        break;
      case DrawerIndex.REPORT_ISSUE:
        screenView[0] = ReportIssueScreen();
        break;
      case DrawerIndex.CLAIM_CODE:
        screenView[0] = ClaimCodeScreen();
        break;
      case DrawerIndex.SIGN_OUT:
        confirmSignOut();
        break;
      case DrawerIndex.MORE:
        screenView[0] = MoreScreen();
        break;
      case DrawerIndex.PUSH_NOTIFICATION:
        screenView[0] = NotificationScreen();
        break;
      case DrawerIndex.RESET_PIN:
        NavApi.fireTarget(
          VerifyPhoneToResetCred(),
          model: CardModel(shouldResetPin: true),
        );
        break;
      // }
      case DrawerIndex.ADD_FUNDS:
        // screenView[0] = ScanToAddFunds();
        NavApi.fireTarget(ScanToAddFunds());
        break;
      case DrawerIndex.SPACER:
        debugPrint("Spacer clicked");
        break;
    }
  }

  ///Reset all bottom Colors to WHITE and after that set the indexed item's Color to YELLOW
  void setBottomItemColor(int index) {
    for (int i = 0; i < bottomItemColors.length; i++) {
      bottomItemColors[i] = AppColors.iconColors;
    }
    bottomItemColors[index] = AppColors.primaryGreenColor;
  }

  ///OnClick Listener to the BottomAppBar Items
  void onBottomItemOnClick(BottomBarIndex index) {
    drawerIndex[0] = DrawerIndex.HOME;
    switch (index) {
      case BottomBarIndex.HOME:
        setBottomItemColor(0);
        screenView[0] = defaultScreens[0];
        break;
      case BottomBarIndex.PROMO:
        setBottomItemColor(1);
        screenView[0] = PromoScreen();
        //TODO screenView[0] = AddFundsScreen();
        break;
      case BottomBarIndex.CART:
        setBottomItemColor(2);
        screenView[0] = CartScreen();
        break;
      case BottomBarIndex.WALLET:
        setBottomItemColor(3);
        screenView[0] = WalletMainScreen();
        break;
      case BottomBarIndex.MARKET_PLACE:
        setBottomItemColor(4);
        screenView[0] = ClaimCodeScreen();
        // screenView[0] = AllShopsScreen();
        //NavApi.fireTarget(MarketPlaceDashboardScreen());
        break;
    }
  }
}
