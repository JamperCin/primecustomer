import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/payment_options.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/dashboard/market_place/orders/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PaymentWithGiftCardController extends BaseController {
  RxBool isGiftCardSelected = false.obs;
  PanelController giftCardController = PanelController();
  Rx<BaseObject> selectedCard = BaseObject().obs;
  CardController? cardController;
  RxList<BaseObject> cardAccountList = RxList<BaseObject>();
  bool hasStartedApiCall = false;
  RxBool isLoadingMore = false.obs;
  RxBool isDoneLoadingCards = false.obs;
  WalletType purchasedCardType = WalletType.PURCHASED;
  PaymentOptions? paymentOptions;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  ///Listener to When a Gift card is selected to make payment
  void onGiftCardSelected(BaseObject obj) {
    selectedCard.value = obj;
    isGiftCardSelected.value = true;
  }

  ///Display a slider to show list of all purchased ans gifted cards
  Future<void> onPaymentModeSelected(PaymentOptions mode) async {
    paymentOptions = mode;
    giftCardController.animatePanelToPosition(0.9);
    selectedCard.value = BaseObject();
    isGiftCardSelected.value = false;
    await fetchWallet();
  }

  ///Initiate to make payment with a Single Gift Card
  Future<void> onMakePaymentOnClick(int cartId,
      {int? deliveryAddressId}) async {
    if (!isGiftCardSelected.value) {
      return;
    }

    giftCardController.animatePanelToPosition(0.0);
    await makePaymentRequest(
      cartId: cartId,
      deliveryAddressId: deliveryAddressId,
      purchaseCode:
          CardApi.checkTypeOfObject(selectedCard.value).getPurchasedCode(),
    );
  }

  ///Make Payment with A Single Selected Gift Card
  Future<void> makePaymentRequest({
    required int cartId,
    String paymentOption = 'prime_merchant_card_payment',
    required String purchaseCode,
    String? confirmationCode,
    int? deliveryAddressId,
  }) async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent('product_cart_id', () => cartId);
    if (deliveryAddressId != null) {
      param.putIfAbsent('delivery_address_id', () => deliveryAddressId);
    }
    param.putIfAbsent(
        'payment_option_code', () => paymentOptions?.code ?? paymentOption);
    param.putIfAbsent('card_payment_code', () => purchaseCode);
    if (confirmationCode != null) {
      param.putIfAbsent('confirmation_code', () => confirmationCode);
    }

    await webService?.makePaymentOfProduct(param, (resp) async {
      await handlePaymentResponse(resp);
    });
  }

  ///Handle the response after making a successful payment
  Future<void> handlePaymentResponse(BaseResponseModel resp) async {
    // NotificationApi.showNotification(
    //   title: "Product Purchase Completed",
    //   body: 'Your product(s) purchase has successfully been completed.',
    // );

    SnackBarApi.snackBarSuccess("Product(s) purchase successfully done.");
    NavApi.fireTarget(OrdersScreen());
  }

  ///Fetch all Gifted cards that belongs to this current user
  Future<void> fetchWallet({WalletType type = WalletType.PURCHASED}) async {
    await cardController?.fetchPurchasedAndGiftedCards(
      cardAccountList,
      isDoneLoadingCards,
      //type: type,
      page: 1,
      refresh: false,
      isLoadingMore: isLoadingMore,
    );
  }
}
