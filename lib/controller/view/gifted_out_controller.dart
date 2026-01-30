import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/basic/emoji_feedback_controller.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/data/model/remote/redemption_logs.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftedOutController extends BaseController {
  CardUtils? cardUtils;
  PrimeCardModel? card;
  GiftedCard? giftedCard;
  WalletType type = WalletType.GIFTED_OUT;
  RxInt notificationCounter = 0.obs;
  EmojiFeedbackController? emojiFeedbackController;
  CardController? cardController;
  RxList<RedemptionLogs> redemptionLogs = RxList<RedemptionLogs>();
  RxBool isDoneLoading = false.obs;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    emojiFeedbackController = EmojiFeedbackController(webService, context);
    cardController = CardController(webService!);
  }

  // @override
  // void callContact(String? tel) {
  //   super.callContact(tel);
  // }

  void onCommentClicked() {
    emojiFeedbackController?.handleEmojis(giftedCard!);
  }

  void getRedemptionLogs() {
    cardController?.getDetailsOfPurchasedCard(
      logs: redemptionLogs,
      isDone: isDoneLoading,
      purchasedCode: cardUtils?.getPurchasedCode(),
    );
  }
}
