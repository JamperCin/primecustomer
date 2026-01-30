import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/enum/redemption_type.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/data/model/remote/redemption_logs.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/ui/base/base_auth_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/appointment/appointment_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/cash_out/cash_out_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/merchant_rating/rate_merchant_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/re_gift/re_gift_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/redemption/generate_qr_code_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/redemption/redeem_options_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/redemption/scan_qr_code_screen.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RedeemController extends BaseController {
  CardAccount? cardAccount;
  GiftedCard? giftedCard;
  PrimeCardModel? card;
  CardUtils? cardUtils;

  RxString maskedCode = "".obs;
  RxBool startedGeneratingQrCode = false.obs;

  TextEditingController amountTxt = TextEditingController();
  RxString amountDisplayTxt = "".obs;
  RxString clickCodeText = "Click to view code".obs;

  CardController? cardController;
  RxList<RedemptionLogs> redemptionLogs = RxList<RedemptionLogs>();
  RxBool isDoneLoading = false.obs;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  void getRedemptionLogs() {
    cardController?.getDetailsOfPurchasedCard(
      logs: redemptionLogs,
      isDone: isDoneLoading,
      purchasedCode: cardUtils?.getPurchasedCode(),
    );
  }

  // void onMapOnClicks(BaseObject model) {
  //   NavApi.fireTarget(NearByMerchantsScreen(),
  //       model: CardModel(client: cardUtils?.getClient()));
  //
  // }

  void onMapOnClick(BaseObject mer) {
    ServiceInjectors().geolocationApi.goToNearByMerchants(
          object: CardModel(
            client: cardUtils?.getClient(),
          ),
        );
  }

  void onShopWithCardOnClick() {}

  void onRedeemCardOnClick() {
    if (isValidRedemption()) {
      NavApi.fireTarget(RedemptionOptionsScreen());
    }
  }

  void onBookAppointmentOnClick(BaseObject model) {
    NavApi.fireTarget(AppointmentScreen(), model: model);
  }

  void onCashOutCardOnClick(BaseObject model) {
    NavApi.fireTarget(CashOutScreen(), model: model);
  }

  void onReGiftOnClick(BaseObject model) {
    NavApi.fireTarget(ReGiftCardScreen(), model: model);
  }

  ///================= O P E R A T I O N S =====================

  ///Check if the amount entered for redemption is valid before proceeding with transaction
  bool isValidRedemption() {
    if (getStringData(amountTxt).isEmpty) {
      SnackBarApi.snackBarError("Please enter an amount to redeem");
      return false;
    }

    if (NumberUtils.parseDouble(amountTxt.text.trim()) < 1) {
      SnackBarApi.snackBarError("Please enter a valid amount to redeem");
      return false;
    }

    if (NumberUtils.parseDouble(amountTxt.text.trim()) >
        NumberUtils.parseDouble(cardUtils?.cardAccountBalance() ?? "0.0")) {
      SnackBarApi.snackBarError(
          "The amount specified is more than the available balance on this card.");
      return false;
    }

    return true;
  }

  void formatAmount() {
    amountDisplayTxt.value =
        cardUtils?.getCurrencyAmount(getStringData(amountTxt), dec: 2) ?? "";
  }

  void onAuthRedeem({RedemptionType action = RedemptionType.scanQrCode}) {
    NavApi.fireTarget(BaseAuthScreen(
      call: () {
        switch (action) {
          case RedemptionType.scanQrCode:
            NavApi.fireTarget(ScanQrCodeScreen(
              call: (merchantCode) {
                onScanQrCodeSuccessful(merchantCode);
              },
            ));
            break;
          case RedemptionType.generateQrCode:
            NavApi.fireTarget(GenerateQrCodeScreen());
            break;
          case RedemptionType.view16DigitCode:
            maskedCode.value = cardUtils?.getDisplayPurchasedCode() ?? "";
            clickCodeText.value = "Long click to copy to clipboard";
            break;
        }
      },
    ));
  }

  void displayPurchaseCode() {
    if (maskedCode.value == cardUtils?.getDisplayPurchasedCode()) {
      maskedCode.value = cardUtils?.getMaskedPurchasedCode() ?? "";
    } else {
      onAuthRedeem(action: RedemptionType.view16DigitCode);
    }
  }

  String qrCodeAmount() {
    String code =
        "${cardUtils?.getPurchasedCode()}#${getStringData(amountTxt)}";

    return code;
  }

  void onScanQrCodeSuccessful(String merchantCode) {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent(
        "account_code", () => cardUtils?.getPurchasedCode() ?? "");
    params.putIfAbsent("merchant_code", () => merchantCode);
    params.putIfAbsent("amount", () => getStringData(amountTxt));

    webService?.redeemCard(params, (response) {
      if (response.success) {
        NavApi.fireSuccess(SuccessModel.redemption((context) {
          NavApi.fireTargetOff(
            RateMerchantScreen(),
            model: CardModel(client: cardUtils?.getClient()),
          );
        }));
      } else {
        SnackBarApi.snackBarError(
            response.error ?? "Error occurred redeeming code");
        NavApi.fireSuccess(SuccessModel.redemptionError());
      }
    });
  }

  void delayButtonClick() {
    Utils.startTimer(10, () {
      startedGeneratingQrCode.value = false;
    });
  }

  void onCopyPurchaseCode() {
    if (maskedCode.value == cardUtils?.getDisplayPurchasedCode()) {
      Clipboard.setData(
              ClipboardData(text: cardUtils?.getPurchasedCode() ?? ''))
          .then((_) {
        ScaffoldMessenger.of(mContext!).showSnackBar(
            const SnackBar(content: Text('Copied to your clipboard !')));
      });
    }
  }
}
