import 'package:primecustomer/controller/view/transaction_controller.dart';
import 'package:primecustomer/data/model/remote/payments.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RedemptionTab extends BaseScreenStandard {
  final TransactionController controller = Get.put(TransactionController());

  RedemptionTab() {
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
        ));
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Obx(
      () => controller.isDoneLoadingRedemption.value &&
              controller.redemptionHistory.isNotEmpty
          ? historyWidget()
          : UiApi.loader(),
    ));

    return list;
  }

  Widget historyWidget() {
    List<Widget> list = [];
    for (Payments pay in controller.redemptionHistory) {
      list.add(UiApi.redeemItemWidget(pay, onTap: (pay) {
        controller.onRedemptionItemOnClick(pay);
      }));
    }
    return Column(children: list);
  }
}
