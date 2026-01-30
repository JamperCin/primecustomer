import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/enum/PaymentStatus.dart';
import 'package:primecustomer/data/enum/filter_type.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/payments.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/data/model/remote/redemption_logs.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/merchant_rating/merchant_rating_list.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransDetailsController extends BaseController {
  RxList<PrimeCardModel> cardsList = RxList<PrimeCardModel>();
  RxList<MerchantDetails> merchantsList = RxList<MerchantDetails>();
  RxList<RedemptionLogs> redemptionLogs = RxList<RedemptionLogs>();
  TransactionType transactionType = TransactionType.PURCHASE;
  Payments pay = const Payments();
  PaymentStatus paymentStatus = PaymentStatus.UNKNOWN;
  RxBool continueTransaction = false.obs;
  RxBool cancelTransaction = false.obs;
  RxBool isDoneLoading = false.obs;
  CardController? cardController;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  void setTransactionType() {
    transactionType = pay.transactionType == "card_purchase"
        ? TransactionType.PURCHASE
        : TransactionType.REDEMPTION;

    paymentStatus = CardUtils.getTransactionStatus(status: pay.status);
  }

  void addTransactionCards() {
    if (transactionType == TransactionType.PURCHASE) {
      cardsList.addAll(pay.cart.cards);
    } else {
      cardsList.add(pay.card);
    }

    addAvailableMerchants();
  }

  void addAvailableMerchants() {
    merchantsList.clear();
    for (PrimeCardModel card in cardsList) {
      if (!merchantsList.contains(card.client)) {
        merchantsList.add(card.client);
      }
    }
  }

  ///Get Redemption details on selected card of Redemption
  void getRedemptionLogs() {
    print("WE ${pay.toJson().toString()}");
    cardController?.getDetailsOfPurchasedCard(
      logs: redemptionLogs,
      isDone: isDoneLoading,
      purchasedCode: pay.cardAccount.purchaseCode,
    );
  }

  ///Check Status of if Transaction
  void checkButtonVisibility() {
    continueTransaction.value = paymentStatus == PaymentStatus.PROCESSING ||
        paymentStatus == PaymentStatus.INITIATED ||
        paymentStatus == PaymentStatus.WAITING_CALLBACK;
    cancelTransaction.value = paymentStatus == PaymentStatus.PROCESSING ||
        paymentStatus == PaymentStatus.INITIATED ||
        paymentStatus == PaymentStatus.WAITING_CALLBACK;
  }

  void resetDetails() {
    cardsList.clear();
    pay = const Payments();
    continueTransaction.value = false;
    cancelTransaction.value = false;
  }

  String getDeliveryStatus() {
    String status = "PENDING";
    if (pay.status == "PAID") {
      return "DELIVERED";
    }
    return status;
  }

  void onCallOnClick() {}

  void onCancelTransaction({Function? reload}) {
    UiApi.showConfirmDialog(
        title: "Cancel Purchase",
        message: "Are you sure you want to cancel this purchase transaction",
        callBack: () {
          initCancelTransactionRequest(reload: reload);
        });
  }

  void onViewRatings(MerchantDetails mer) {
    NavApi.fireTarget(MerchantRatingList(),
        model: CardModel(
          clientId: mer.id,
          clientName:
              Utils.capitalizeLetter(val: mer.name, capAllFirstLetters: true),
        ));
  }

  void initCancelTransactionRequest({Function? reload}) {
    cardController?.cancelTransaction("${pay.id}", call: () {
      cancelTransaction.value = false;
      continueTransaction.value = false;
      Utils.startTimer(5, () {
        NavApi.fireBack();
        if (reload != null) reload();
      });
    });
  }

  void onMapOnClick(MerchantDetails mer) {
    ServiceInjectors()
        .geolocationApi
        .goToNearByMerchants(object: CardModel(client: mer));
  }

  void onContinueTransaction() {
    cardController?.goToWebPayment(paymentUrl: pay.paymentUrl);
  }
}
