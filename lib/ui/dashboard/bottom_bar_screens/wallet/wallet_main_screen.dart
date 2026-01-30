import 'package:primecustomer/controller/view/wallet_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/ui/base/base_screen_stateful_standard.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/walllet_tabs/purchased_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletMainScreen extends BaseScreenStatefulStandard {
  WalletController controller = Get.put(WalletController());
  TabController? _tabController;
  int tabsCount = 3;

  WalletMainScreen() {
    controller.addScreen(PurchasedTab());
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  void initState(SingleTickerProviderStateMixin vsync) {
    super.initState(vsync);
    controller.tabIndex.value = 0;
    _tabController = TabController(vsync: vsync, length: tabsCount);
  }

  @override
  void dispose(SingleTickerProviderStateMixin<StatefulWidget> vsync) {
    super.dispose(vsync);
    _tabController?.dispose();
  }

  @override
  Widget body(BuildContext context) {
    return DefaultTabController(
      length: tabsCount,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 2,
          bottom: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            onTap: (index) {
              controller.onTabOnClick(index);
            },
            tabs: [
              tabItem("Purchased"),
              tabItem("Gifted In"),
              tabItem("Gifted Out"),
              //todo tabItem("Efund"),
            ],
          ),
          title: Text('Wallet', style: AppTextStyles.titleStyleBold),
        ),
        body: Obx(() => controller.screenView[0]),
      ),
    );
  }

  Widget tabItem(String text) {
    return Padding(
        padding: EdgeInsets.only(bottom: AppDimens.dimen12),
        child: Text(text, style: AppTextStyles.smallSubDescStyleBold));
  }
}
