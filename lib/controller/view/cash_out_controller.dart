import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/basic/prime_wallet_controller.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashOutController extends BaseController {
  int accountId = 0;
  CardUtils? cardUtils;
  RxBool isDoneLoadingBalance = false.obs;

  void confirmCashOut() {
    UiApi.showConfirmDialog(
      imageAsset: "assets/images/ic_success_redeem.png",
      title: "Confirm Cash-Out",
      messageWidget: UiApi.richText(
        maxLines: 2,
        textAlign: TextAlign.center,
        mod: [
          RichTextModel(
              text: "Do you want to proceed to cash-out an amount of "),
          RichTextModel(
              text: "${cardUtils?.getFormattedAccountBalance(dec: 2)}",
              style: AppTextStyles.descStyleBold),
        ],
      ),
      titleStyle: AppTextStyles.h5StyleSemiBold,
      messageStyle: AppTextStyles.descStyleLight,
      buttonTitle: "Proceed",
      callBack: () {
        initCashOutRequest();
      },
    );
  }

  void initCashOutRequest() {
    CardController(webService!).cashOutCardToPrimeWallet(
        accountId: accountId,
        call: () {
          NavApi.fireSuccess(SuccessModel.cashOut());
        });
  }

  ///Request for current Prime Wallet Balance
  void initAllRequest() {
    isDoneLoadingBalance.value = false;
    PrimeWalletController(webService).getWalletDetails(call: () {
      isDoneLoadingBalance.value = true;
    });
  }
}
