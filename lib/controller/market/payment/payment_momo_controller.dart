import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/model/local/web_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/base/base_web.dart';

class PaymentWithMomoController extends BaseController {
  ///Payment with Momo
  void onPayWithMomo({
    required int cartId,
    String paymentOption = 'prime_wallet_card_payment',
    String? confirmationCode,
    int? deliveryAddressId,
  }) {
    DialogsApi.alertDialogYesNo(
        title: 'Proceed to make payment with Momo/Bank',
        mess: 'Are you sure you want to make payment with your momo/bank card?',
        onYesTap: () {
          _onPayWithMomoOrBank(
            cartId: cartId,
            paymentOption: paymentOption,
            deliveryAddressId: deliveryAddressId,
            confirmationCode: confirmationCode,
          );
        });
  }

  ///Make payment with Momo or Bank Account
  void _onPayWithMomoOrBank({
    required int cartId,
    String paymentOption = 'prime_wallet_card_payment',
    String? confirmationCode,
    int? deliveryAddressId,
  }) {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent('product_cart_id', () => cartId);
    if (deliveryAddressId != null) {
      param.putIfAbsent('delivery_address_id', () => deliveryAddressId);
    }
    param.putIfAbsent('payment_option_code', () => paymentOption);
    if (confirmationCode != null) {
      param.putIfAbsent('confirmation_code', () => confirmationCode);
    }

    webService?.makePaymentOfProduct(param, (resp) {
      goToWebPayment(paymentUrl: resp.data?.paymentUrl);
    });
  }

  void goToWebPayment({String? paymentUrl, Function? call}) {
    if (paymentUrl == null || paymentUrl.isEmpty) {
      SnackBarApi.snackBarError(
          "No payment redirection url found to complete payment");
      return;
    }
    NavApi.fireTarget(BaseWebView(),
        model: WebModel(
          controlPage: true,
          url: paymentUrl,
          title: "Payment",
          onDoneOnclick: () {
            if (call != null) {
              call();
            } else {
              NavApi.fireAction(EventAction.NAV_HOME);
            }
          },
        ));
  }
}
