import 'package:primecustomer/data/enum/drawer_inder.dart';
import 'package:primecustomer/data/model/display/drawer_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:flutter/material.dart';

import '../base/base_controller.dart';

class NavDrawerController extends BaseController {
  List<DrawerModel> drawerList = [];

  @override
  void onInit() {
    setDrawerListArray();
    super.onInit();
  }

  void setDrawerListArray() {
    drawerList = <DrawerModel>[
      DrawerModel(header: "Gift Cards"),
      DrawerModel(
        index: DrawerIndex.HOME,
        asset: "assets/images/ic_home.svg",
        label: "Home",
        color: AppColors.primaryGreenColor,
      ),
      // DrawerModel(
      //   index: DrawerIndex.ADD_FUNDS,
      //   label: 'Add Funds',
      //   asset: AssetsConfig.qrCode,
      //   color: AppColors.primaryGreenColor,
      // ),
      DrawerModel(
        index: DrawerIndex.TRANSACTION_HISTORY,
        label: 'Transaction History',
        asset: "assets/images/ic_purchase_history.png",
        color: AppColors.primaryGreenColor,
      ),
      // DrawerModel(
      //   index: DrawerIndex.ORDERS,
      //   label: 'Orders',
      //   asset: "assets/images/ic_orders.png",
      //   color: AppColors.primaryGreenColor,
      // ),
      DrawerModel(
        index: DrawerIndex.FAVORITE_MERCHANTS,
        label: 'Favorite Cards',
        icon: Icons.favorite,
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(
        index: DrawerIndex.CLAIM_CODE,
        label: 'Claim PromoCode',
        icon: Icons.card_giftcard_rounded,
        color: AppColors.primaryGreenColor,
      ),
      // DrawerModel(header: "Market Place"),
      DrawerModel(
        index: DrawerIndex.RESET_PIN,
        label: 'Reset Pin',
        icon: Icons.security,
        color: AppColors.primaryGreenColor,
      ),
      // DrawerModel(
      //   index: DrawerIndex.EVENTS,
      //   label: 'Calender Events',
      //   icon: Icons.calendar_month_rounded,
      //   color: AppColors.primaryGreenColor,
      // ),
      DrawerModel(
        index: DrawerIndex.REPORT_ISSUE,
        label: 'Report Issue',
        asset: "assets/images/ic_report_issue.png",
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(
        index: DrawerIndex.PUSH_NOTIFICATION,
        label: 'Notifications',
        icon: Icons.notifications_active,
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(header: "Support"),
      DrawerModel(
        index: DrawerIndex.MORE,
        label: 'More',
        icon: Icons.more_vert_outlined,
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(
        index: DrawerIndex.SETTINGS,
        label: 'Settings',
        asset: "assets/images/ic_settings.png",
        color: AppColors.primaryGreenColor,
      ),
      DrawerModel(
        index: DrawerIndex.SIGN_OUT,
        label: 'Sign Out',
        asset: "assets/images/ic_logout.png",
        color: AppColors.redLight,
      ),
      DrawerModel(index: DrawerIndex.SPACER),
    ];
  }
}
