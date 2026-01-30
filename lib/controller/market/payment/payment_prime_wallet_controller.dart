import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/prime_wallet_controller.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/payment_options.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/dashboard/market_place/orders/screens/orders_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PaymentWithPrimeWalletController extends BaseController {
  PanelController primePayController = PanelController();
  PaymentOptions? paymentOptions;

  ///Display a slider to show list of all purchased ans gifted cards
  Future<void> onPaymentModeSelected(PaymentOptions mode) async {
    paymentOptions = mode;
    primePayController.animatePanelToPosition(0.5);
    PrimeWalletController(webService).getWalletDetails();
  }

  ///Initiate Payment With Prime Wallet
  Future<void> onPayWithPrimeWallet(int cartId,
      {int? deliveryAddressId}) async {
    primePayController.animatePanelToPosition(0.0);
    await initPaymentWithWallet(
        cartId: cartId, deliveryAddressId: deliveryAddressId);
  }

  Future<void> initPaymentWithWallet({
    required int cartId,
    String paymentOption = 'prime_wallet_card_payment',
    String? confirmationCode,
    int? deliveryAddressId,
  }) async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent('product_cart_id', () => cartId);
    if (deliveryAddressId != null) {
      param.putIfAbsent('delivery_address_id', () => deliveryAddressId);
    }
    param.putIfAbsent('prime_wallet_id', () => prefUtils.getWalletId());
    param.putIfAbsent(
        'payment_option_code', () => paymentOptions?.code ?? paymentOption);
    if (confirmationCode != null) {
      param.putIfAbsent('confirmation_code', () => confirmationCode);
    }

    webService?.makePaymentOfProduct(param, (resp) async {
      await handlePaymentResponse(resp);
    });
  }

  Future<void> handlePaymentResponse(BaseResponseModel response) async {
    SnackBarApi.snackBarSuccess("Product(s) purchase successfully done.");
    NavApi.fireTarget(OrdersScreen());
  }
}
