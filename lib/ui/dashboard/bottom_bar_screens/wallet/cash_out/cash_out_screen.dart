import 'package:primecustomer/controller/view/cash_out_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashOutScreen extends BaseScreenStandard {
  final CashOutController controller = Get.put(CashOutController());

  CashOutScreen() {
    controller.initAllRequest();
  }

  @override
  String appBarTitle() {
    return "Push To Prime Wallet";
  }

  @override
  BaseObject getModel() {
    if (baseObject is CardAccount) {
      CardAccount account = baseObject as CardAccount;
      controller.cardUtils = CardUtils(account.card).setObject(baseObject);
      controller.accountId = account.accountId;
      return account;
    }

    if (baseObject is GiftedCard) {
      GiftedCard gift = baseObject as GiftedCard;
      controller.cardUtils = CardUtils(gift.account.card).setObject(baseObject);
      controller.accountId = gift.account.accountId;
      return gift;
    }

    return baseObject;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
    getModel();
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      padding: EdgeInsets.only(
        top: AppDimens.dimen5,
        left: AppDimens.dimen24,
        right: AppDimens.dimen24,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.noDataWidget(
      asset: "assets/images/ic_success_redeem.png",
      assetSize: AppDimens.dimen150,
      title: "Push To Your Prime Wallet",
      message:
          "Pushing to prime wallet converts your gift card to e-money which allows you to buy from any merchant on the platform.",
    ));
    list.add(SizedBox(height: AppDimens.dimen10));

    list.add(UiApi.infoText(
      "This action attracts a fee of 4% from your gift card.",
      style:
          AppTextStyles.subDescStyleMedium.copyWith(color: AppColors.redLight),
    ));

    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(Text(
      controller.cardUtils?.getFormattedCardAccountBalance(dec: 2) ?? "",
      textAlign: TextAlign.center,
      style: AppTextStyles.h3StyleBold,
    ));
    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(Text(
      "Card Balance",
      textAlign: TextAlign.center,
      style: AppTextStyles.subDescStyleLight,
    ));

    list.add(SizedBox(height: AppDimens.dimen50));
    list.add(Obx(
      () => controller.isDoneLoadingBalance.value
          ? UiApi.primeWallet()
          : UiApi.primeWallet(),
    ));
    list.add(SizedBox(height: AppDimens.dimen100));
    list.add(UiApi.button(
      child: UiApi.buttonChild(
        asset: "assets/icons/mycard_green.png",
        text: "Proceed",
        assetColor: AppColors.white,
      ),
      backgroundColor: AppColors.introColor2,
      onPressed: () {
        controller.confirmCashOut();
      },
    ));

    return list;
  }
}
