import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/model/remote/country_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_routes.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/settings/change_number/change_number_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/settings/delete_account/verify_user_otp.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeleteAccountController extends BaseController {
  RxString countryName = "Ghana".obs;
  RxString countryCode = "+233".obs;
  RxString verificationCode = "".obs;

  ///Old phone
  RxString oldCountryName = "Ghana".obs;
  RxString oldCountryCode = "+233".obs;

  TextEditingController phoneTxt = TextEditingController();
  TextEditingController oldPhoneTxt = TextEditingController();
  TextEditingController countryCodeTxt = TextEditingController();

  ///Listener to check timer for 1 min before allowing user to issue another command
  RxString timer = "".obs;
  bool shouldDeleteAccount = true;
  Function(String)? handleAfterOtp;

  ///Default country of user should be Ghana
  ///name: "Ghana", code_name: "GH", code_number: "233", currency: "¢"
  CountryModel countryModel = const CountryModel(
    name: "Ghana",
    codeName: "GH",
    codeNumber: "233",
    currency: "GHS",
  );

  CountryModel oldCountryModel = const CountryModel(
    name: "Ghana",
    codeName: "GH",
    codeNumber: "233",
    currency: "GHS",
  );

  ///Complete phone number to sign up
  String formattedPhoneNumber = "";
  String formattedOldPhoneNumber = "";

  ///Listener to check if phone number is correct
  RxBool isPhoneNumberValid = false.obs;
  RxString validPhoneString = "".obs;

  ///Listener to check if old phone number is correct
  RxBool isOldPhoneNumberValid = false.obs;
  RxString validOldPhoneString = "".obs;

  void clear() {
    phoneTxt.clear();
    countryCode.value = "+" + countryModel.codeNumber;
    isPhoneNumberValid.value = false;
    validPhoneString.value = "";

    oldPhoneTxt.clear();
    oldCountryCode.value = "+" + oldCountryModel.codeNumber;
    isOldPhoneNumberValid.value = false;
    validOldPhoneString.value = "";
  }

  void initTimerCheck() {
    Utils.tickTimer(Constants.SMS_CODE_TIMER, (time) {
      timer.value = time;
    });
  }

  ///Validate phone number whiles user is typing
  void liveValidateOldPhoneNum() {
    if (oldPhoneTxt.text.isEmpty) {
      validOldPhoneString.value = "";
      isOldPhoneNumberValid.value = false;
      return;
    }

    NumberUtils.validatePhone(oldPhoneTxt.text, oldCountryModel.codeName,
        (valid) {
      isOldPhoneNumberValid.value = valid;
      validOldPhoneString.value =
          valid ? "Valid Phone Number" : "Invalid Phone Number";

      if (valid) {
        dismissKeyboard();
      }
    });
  }

  ///Validate phone number whiles user is typing
  void liveValidatePhoneNum() {
    if (phoneTxt.text.isEmpty) {
      validPhoneString.value = "";
      isPhoneNumberValid.value = false;
      return;
    }

    NumberUtils.validatePhone(phoneTxt.text, countryModel.codeName, (valid) {
      isPhoneNumberValid.value = valid;
      validPhoneString.value =
          valid ? "Valid Phone Number" : "Invalid Phone Number";

      if (valid) {
        dismissKeyboard();
      }
    });
  }

  ///Select country to change country
  void onSelectCountryOnClick({bool old = false}) {
    NumberUtils.pickCountryCode(mContext!, (c) {
      if (old) {
        oldCountryModel = c;
        oldCountryCode.value = "+" + c.codeNumber;
        oldCountryName.value = c.name;

        ///Validate the country code picked against the phone number entered
        liveValidateOldPhoneNum();
        return;
      }

      countryModel = c;
      countryCode.value = "+" + c.codeNumber;
      countryName.value = c.name;

      ///Validate the country code picked against the phone number entered
      liveValidatePhoneNum();
    });
  }

  ///Change Number instead
  void onChangeNumberOnClick() {
    NavApi.fireTarget(ChangeNumberScreen());
  }

  void onDeleteOnAccountOnClick() {
    if (!isPhoneNumberValid.value) {
      return;
    }
    NumberUtils.formatPhone(phoneTxt.text, countryModel.codeName, (phone) {
      formattedPhoneNumber = phone;
      if (formattedPhoneNumber != prefUtils.getPhoneNumber()) {
        SnackBarApi.snackBarInfo(
            "Phone number does not match user's phone number.");
        return;
      }
      confirmRequest();
    });
  }

  void confirmRequest() {
    UiApi.showConfirmDialog(
        color: AppColors.white,
        imageAsset: "assets/images/ic_danger.png",
        title:
            "Confirm ${shouldDeleteAccount ? "Account Deletion" : "Changing Phone Number"}",
        message:
            "Are you sure you want to proceed to ${shouldDeleteAccount ? "delete your account" : "change your phone number"} on prime?",
        buttonTitle: "Proceed",
        buttonColor: AppColors.redLight,
        callBack: () {
          initSendOtp();
        });
  }

  void initSendOtp({bool resendCode = false}) {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent(
        "telephone",
        () => shouldDeleteAccount
            ? formattedPhoneNumber
            : formattedOldPhoneNumber);

    webService?.sendUerOtp(param, (resp) {
      handleAfterOtpSent(resendCode: resendCode);
    });
  }

  void handleAfterOtpSent({bool resendCode = false}) {
    if (!resendCode) {
      NavApi.fireTarget(VerifyUserOtp());
    }
    initTimerCheck();
    verificationCode.value = "";
    SnackBarApi.snackBarSuccess(
        "A new verification code has been sent to ${shouldDeleteAccount ? formattedPhoneNumber : formattedOldPhoneNumber}");
  }

  HashMap<String, String> getParams() {
    HashMap<String, String> params = HashMap();

    params.putIfAbsent(
        "telephone",
        () => shouldDeleteAccount
            ? formattedPhoneNumber
            : formattedOldPhoneNumber);
    return params;
  }

  void onLastPinEntered(String code) {
    HashMap<String, String> params = getParams();
    params.putIfAbsent("otp", () => code);

    webService?.verifyUserOtp(params, (response) {
      handleAfterOtpVerification(response.data?.certCode ?? "");
    });
  }

  void handleAfterOtpVerification(String code) {
    if (handleAfterOtp != null) {
      handleAfterOtp!(code);
      return;
    }
    if (shouldDeleteAccount) {
      initDeleteAccount(code);
    } else {
      initChangePhone(code);
    }
  }

  void initDeleteAccount(String code) {
    HashMap<String, String> params = HashMap();
    params.putIfAbsent("telephone", () => formattedPhoneNumber);
    params.putIfAbsent("otp", () => code);

    webService?.deleteAccount(params, (response) {
      prefUtils.deleteAccount();
      DialogsApi.popUpSuccessDialog(
        Get.context!,
        time: 8,
        mess:
            "Your account and other information has been deleted successfully. You will be automatically redirected.",
        call: () {
          navUtils.fireTarget(AppRoutes.getPage());
        },
      );
    });
  }

  void initChangePhone(String code) {
    HashMap<String, String> params = HashMap();
    params.putIfAbsent("code", () => code);
    params.putIfAbsent("telephone", () => formattedOldPhoneNumber);
    params.putIfAbsent("new_telephone", () => formattedPhoneNumber);

    webService?.changePhoneNumber(params, (response) {
      prefUtils.changePhone();
      DialogsApi.popUpSuccessDialog(
        Get.context!,
        time: 8,
        mess:
            "Your phone number has been changed successfully. You will be automatically redirected to login with your new phone number.",
        call: () {
          navUtils.fireTarget(AppRoutes.getPage());
        },
      );
    });
  }

  void onValidateOldNumber() {
    if (!isOldPhoneNumberValid.value || !isPhoneNumberValid.value) {
      return;
    }
    NumberUtils.formatPhone(oldPhoneTxt.text, oldCountryModel.codeName,
        (phone) {
      formattedOldPhoneNumber = phone;
      if (phone != prefUtils.getPhoneNumber()) {
        SnackBarApi.snackBarInfo(
            "Phone number does not match user's current phone number.");
        return;
      }

      onValidateNewNumber();
    });
  }

  void onValidateNewNumber() {
    NumberUtils.formatPhone(phoneTxt.text, countryModel.codeName, (phone) {
      formattedPhoneNumber = phone;
      confirmRequest();
    });
  }
}
