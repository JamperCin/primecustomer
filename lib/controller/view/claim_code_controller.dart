import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/claimCode/verify_claim_code.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClaimCodeController extends BaseController {
  TextEditingController codeTxt = TextEditingController();
  RxString pinCode = "".obs;
  RxBool isPromoCode = false.obs;
  RxBool isValidEntry = false.obs;

  ///Listener to check timer for 1 min before allowing user to issue another command
  RxString timer = "".obs;

  RxList<DictionaryModel> codeTypeList = [
    DictionaryModel(key: "16-Digit Code", value: "Gift Card"),
    DictionaryModel(key: "Promo Code", value: "Promo Code"),
  ].obs;

  Rx<DictionaryModel> selectedCodeType =
      DictionaryModel(key: "16-Digit Code", value: "Gift Card").obs;

  @override
  void onInit() {
    super.onInit();
    selectedCodeType.value = codeTypeList[0];
    initSmsPlugin();
  }

  void initTimerCheck() {
    Utils.tickTimer(Constants.SMS_CODE_TIMER, (time) {
      timer.value = time;
    });
  }

  onChangeCodeType(DictionaryModel dic) {
    selectedCodeType.value = dic;
    isPromoCode.value = dic.key == "Promo Code";
  }

  void onConfirmSubmission() {
    if (!isValidEntry.value) {
      return;
    }

    UiApi.showConfirmDialog(
        title: "Confirm Request",
        titleStyle: AppTextStyles.titleStyleBold,
        messageStyle: AppTextStyles.descStyleLight,
        message: "Are you sure you want to proceed with this?",
        callBack: () {
          initCodeClaim();
        });
  }

  void initCodeClaim({bool resendCode = false}) {
    HashMap<String, Object> param = HashMap();
    if (isPromoCode.value) {
      param.putIfAbsent("promo_code", () => getStringData(codeTxt));
    } else {
      param.putIfAbsent("account_code", () => getStringData(codeTxt));
    }

    webService?.claimCoupon(param, isPromoCode.value, (response) {
      if (!resendCode) {
        NavApi.fireTarget(VerifyClaimCode());
      }

      SnackBarApi.snackBarSuccess(response.data?.message ?? "");
      initTimerCheck();
    });
  }

  void verifyCode() {
    HashMap<String, Object> param = HashMap();
    if (isPromoCode.value) {
      param.putIfAbsent("promo_code", () => getStringData(codeTxt));
      param.putIfAbsent("otp", () => pinCode.value);
    } else {
      param.putIfAbsent("account_code", () => getStringData(codeTxt));
      param.putIfAbsent("otp_code", () => pinCode.value);
    }

    webService?.verifyCouponClaimCode(param, isPromoCode.value, (response) {
      DialogsApi.popUpSuccessDialog(mContext!,
          mess: "You have successfully claimed your code.",
          asset: "assets/images/ic_tick.png", call: () {
        NavApi.fireTargetHome();
      });
    });
  }

  void onTextChanged(String value) {
    isValidEntry.value = value.isNotEmpty &&
        ((value.length == 10 && isPromoCode.value) ||
            (value.length == 16 && !isPromoCode.value));
  }
}
