import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/enum/market_bottom_bar.dart';
import '../../res/app/app_colors.dart';
import '../../ui/dashboard/market_place/home/market_home_screen.dart';

class MarketPlaceDashboardController extends BaseController {
  RxList<Widget> screenView = RxList();

  RxList<Color> bottomItemColors = [
    AppColors.market,
    AppColors.iconColors,
    AppColors.iconColors,
    AppColors.iconColors,
  ].obs;

  Future<void> initData() async {
    await Future.delayed(const Duration(milliseconds: 180));
    screenView.clear();
    screenView.add(MarketHomeScreen());
  }

  ///Reset all bottom Colors to WHITE and after that set the indexed item's Color to YELLOW
  void setBottomItemColor(int index) {
    for (int i = 0; i < bottomItemColors.length; i++) {
      bottomItemColors[i] = AppColors.iconColors;
    }
    bottomItemColors[index] = AppColors.market;
  }

  void onBottomBarItemSelected(MarketBottomBarIndex index) {
    switch (index) {
      case MarketBottomBarIndex.HOME:
        setBottomItemColor(0);
        screenView[0] = MarketHomeScreen();
        break;
      case MarketBottomBarIndex.DEALS:
        setBottomItemColor(1);
        break;
      case MarketBottomBarIndex.CART:
        setBottomItemColor(2);
        break;
      case MarketBottomBarIndex.ORDERS:
        setBottomItemColor(3);
        break;
    }
  }
}
