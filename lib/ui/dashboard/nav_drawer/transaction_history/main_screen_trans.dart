import 'package:primecustomer/controller/view/transaction_controller.dart';
import 'package:primecustomer/data/enum/filter_type.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/ui/base/base_screen_stateful_standard.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/transaction_history/purchase_tab.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenTransaction extends BaseScreenStatefulStandard {
  final TransactionController controller = Get.put(TransactionController());
  TabController? _tabController;

  MainScreenTransaction() {
    controller.clearData();
    controller.tabIndex.value = 0;
    controller.page = 1;
    controller.isLoadingMore.value = false;
    controller.transactionType = TransactionType.PURCHASE;
    controller.screenView.add(const SizedBox());

    Utils.startTimer(1, () {
      controller.selectedCartId.value = getModel().cartId;
      controller.shouldPopBack.value = getModel().shouldPopBack;
      controller.addScreen(PurchaseTab());
      controller.initRequestForHistory();
    }, duration: const Duration(milliseconds: 360));
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) {
      return baseObject as CardModel;
    }

    return CardModel();
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
    _tabController = TabController(vsync: vsync, length: 2);
  }

  @override
  void dispose(SingleTickerProviderStateMixin<StatefulWidget> vsync) {
    super.dispose(vsync);
    _tabController?.dispose();
  }

  @override
  Widget body(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 2,
          leading: Obx(
            () => controller.shouldPopBack.value
                ? InkWell(
                    onTap: () {
                      NavApi.fireBack();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                      size: AppDimens.dimen25,
                    ),
                  )
                : const SizedBox(),
          ),
          bottom: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            onTap: (index) {
              controller.onTabOnClick(index);
            },
            tabs: [
              tabItem("Purchase History"),
              tabItem("Redemption History"),
            ],
          ),
          title:
              Text('Transaction History', style: AppTextStyles.titleStyleBold),
        ),
        body: Obx(() => controller.screenView[0]),
        /*body: TabBarView(
          children: [
            PurchaseTransactionHistory(),
            RedemptionTransactionHistory(),
          ],
        ),*/
      ),
    );
  }

  Widget tabItem(String text) {
    return Padding(
        padding: EdgeInsets.only(bottom: AppDimens.dimen8),
        child: Text(text, style: AppTextStyles.descStyleRegular));
  }
}
