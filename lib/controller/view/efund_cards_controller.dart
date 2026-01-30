import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/basic/emoji_feedback_controller.dart';
import 'package:primecustomer/controller/basic/prime_wallet_controller.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/data/model/remote/eFund_card_model.dart';
import 'package:primecustomer/data/model/remote/e_fund_request_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class EFundCardsController extends BaseController {
  EmojiFeedbackController? emojiFeedbackController;
  CardController? cardController;

  RxList<EfundCardModel> cardsList = RxList<EfundCardModel>();
  RxList<EfundCardModel> selectedCardsList = RxList<EfundCardModel>();
  Rx<EfundRequestModel> eFund = const EfundRequestModel().obs;

  RxDouble subTotal = 0.0.obs;
  RxDouble minPanelHeight = 0.0.obs;
  PanelController panelController = PanelController();

  TextEditingController commentTxt = TextEditingController();

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
    emojiFeedbackController = EmojiFeedbackController(webService, context);
  }

  onCardSelected(bool isSelected, EfundCardModel mod) {
    if (isSelected) {
      selectedCardsList.add(mod);
    } else {
      selectedCardsList.remove(mod);
    }
    calculateAmountDue();
  }

  void calculateAmountDue() {
    subTotal.value = 0.0;
    for (EfundCardModel eFund in selectedCardsList) {
      subTotal.value = subTotal.value + eFund.amount;
    }
  }

  void confirmPayment({bool payFromWallet = false}) {
    UiApi.showConfirmDialog(
        title: "Confirm Funding",
        titleStyle: AppTextStyles.titleStyleBold,
        messageStyle: AppTextStyles.descStyleRegular,
        message:
            "Are you sure you want to fund these cards worth ${NumberUtils.moneyCurrencyFormat(subTotal.value, dec: 2)}",
        callBack: () {
          initEFundPayment(payFromWallet: payFromWallet);
        });
  }

  void initEFundPayment({bool payFromWallet = false}) {
    List<HashMap<String, Object>> items = [];
    for (EfundCardModel card in selectedCardsList) {
      HashMap<String, Object> item = HashMap();
      // item.putIfAbsent("card_id", () => card.card.id);
      item.putIfAbsent("efund_id", () => card.eFundId);

      items.add(item);
    }

    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("group_id", () => eFund.value.id);
    param.putIfAbsent("items", () => items);
    param.putIfAbsent("use_prime_wallet", () => payFromWallet);

    webService?.payForEFund(param, (response) {
      if (response.success) {
        if (payFromWallet) {
          ///Request for new balance of prime wallet
          PrimeWalletController(webService).getWalletDetails();
          NavApi.fireSuccess(SuccessModel.payment());
        } else {
          cardController?.goToWebPayment(paymentUrl: response.data?.paymentUrl);
        }
      } else {
        cardController?.handleError(
            mess: response.error, cartID: eFund.value.id);
      }
    });
  }

  void onCallOnClick() {
    if (eFund.value.requester.eFundPhone.isNotEmpty) {
      callContact(eFund.value.requester.eFundPhone);
    } else {
      SnackBarApi.snackBarInfo("Call cannot be placed at the moment");
    }
  }

  void onEmojiOnClick() {
    emojiFeedbackController?.popUpEmojis(call: (data) {
      //send emoji feedback to api
    });
  }

  void onCommentOnClick() {
    panelController.animatePanelToPosition(1.0);
  }

  void onRejectFunding() {
    UiApi.showConfirmDialog(
        title: "Reject this E-Fund?",
        titleStyle: AppTextStyles.titleStyleBold,
        messageStyle: AppTextStyles.descStyleLight,
        imageAsset: "assets/images/ic_danger.png",
        buttonColor: AppColors.redLight,
        message:
            "Are you sure you want to reject this e-Fund from ${eFund.value.requester.person?.firstName ?? "the requester?"}",
        callBack: () {
          initEFundRejectRequest();
        });
  }

  void initEFundRejectRequest() {}

  void clear() {
    selectedCardsList.clear();
    subTotal.value = 0.0;
  }

  void onEditEFund() {}

  void onCancelEFund() {
    UiApi.showConfirmDialog(
        title: "Cancel this E-Fund?",
        titleStyle: AppTextStyles.titleStyleBold,
        messageStyle: AppTextStyles.descStyleLight,
        imageAsset: "assets/images/ic_danger.png",
        buttonColor: AppColors.redLight,
        message:
            "Are you sure you want to cancel this e-Fund? \bNB: all your potential "
            "funders will be notified of this deletion. The E-Fund request will "
            "be cleared as well from their end.",
        callBack: () {
          initCancelEFund();
        });
  }

  void initCancelEFund() {}
}
