import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/enum/menu_index.dart';
import 'package:primecustomer/data/model/display/drawer_model.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/web_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/config/app_config.dart';
import 'package:primecustomer/ui/base/base_screen_impl.dart';
import 'package:primecustomer/ui/base/base_web.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/about_prime/about_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/faq/faq_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/invite/invite_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/rate_prime/rate_us_screen.dart';
import 'package:flutter/material.dart';

class MoreController extends BaseController {
  List<DrawerModel> drawerList = [];
  MenuIndex selectedIndex = MenuIndex.REFERRALS;

  @override
  void onInit() {
    setMenuList();
    super.onInit();
  }

  void setMenuList() {
    drawerList = <DrawerModel>[
      DrawerModel(
        menuIndex: MenuIndex.INVITE_FRIENDS,
        label: 'Invite Friends',
        asset: "assets/images/ic_listings.png",
        color: AppColors.primaryGreenColor,
      ),
      /*DrawerModel(
        menuIndex: MenuIndex.REFERRALS,
        label: 'Referral Program',
        asset: "assets/images/ic_listings.png",
        color: AppColors.primaryGreenColor,
      ),*/
      DrawerModel(
        menuIndex: MenuIndex.RATING,
        label: 'Rate Us',
        asset: "assets/images/ic_rate.png",
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(
        menuIndex: MenuIndex.TERMS_AND_CONDITIONS,
        label: 'Terms And Conditions',
        asset: "assets/images/ic_listings.png",
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(
        menuIndex: MenuIndex.PRIVACY_POLICY,
        label: 'Privacy Policy',
        icon: Icons.security,
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(
        menuIndex: MenuIndex.FAQs,
        label: 'FAQs',
        asset: "assets/images/ic_faq.png",
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(
        menuIndex: MenuIndex.ABOUT,
        label: 'About Prime',
        asset: "assets/images/ic_listings.png",
        color: AppColors.primaryGreenColor,
      ),
    ];
  }

  ///OnClick listener to the Drawer Items
  void onChangeDrawer(MenuIndex index) {
    BaseScreenImpl? screenView;
    BaseObject? baseObject;
    switch (index) {
      case MenuIndex.RATING:
        screenView = RateUsScreen();
        break;
      case MenuIndex.ABOUT:
        screenView = AboutScreen();
        break;
      case MenuIndex.FAQs:
        screenView = FaqScreen();
        break;
      case MenuIndex.INVITE_FRIENDS:
        screenView = InviteFriendsScreen();
        break;
      case MenuIndex.TERMS_AND_CONDITIONS:
        screenView = BaseWebView();
        baseObject =
            WebModel(url: AppConfig.PRIME_TERMS, title: "Terms And Conditions");
        break;
      case MenuIndex.REFERRALS:
        // TODO: Handle this case.
        break;
      case MenuIndex.PRIVACY_POLICY:
        screenView = BaseWebView();
        baseObject =
            WebModel(url: AppConfig.PRIVACY_POLICY, title: "Privacy Policy");
        break;
    }

    NavApi.fireTarget(screenView, model: baseObject);
  }
}
