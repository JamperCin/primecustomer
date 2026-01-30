import 'package:primecustomer/controller/view/transaction_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseTab extends BaseScreenStandard {
  final TransactionController controller = Get.put(TransactionController());

  PurchaseTab() {
    controller.clearData();
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Color backgroundColor() {
    return AppColors.background;
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      scrollController: controller.scrollController,
      isLoadingMore: controller.isLoadingMore,
      padding: EdgeInsets.only(
        left: AppDimens.dimen10,
        right: AppDimens.dimen10,
        top: AppDimens.dimen20,
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(
      Obx(() => controller.isDoneLoadingPurchase.value &&
              controller.purchaseHistory.isNotEmpty
          ? historyWidget()
          : UiApi.loader()),
    );

    return list;
  }

  Widget historyWidget() {
    return Column(children: [
      ...controller.purchaseHistory.map((pay) => UiApi.payItemWidget(
            pay,
            wiggle: pay.cart.cartId == controller.selectedCartId.value,
            onTap: controller.onPurchaseItemOnClick,
          ))
    ]);
  }
}
