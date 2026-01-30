import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/view/bio_pin_controller.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/enum/guest_staging.dart';
import 'package:primecustomer/data/model/remote/country_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestController extends BioPinController {
  TextEditingController guestUserPhoneTxt = TextEditingController();
  TextEditingController guestCountryCodeTxt = TextEditingController();
  RxString guestHeader =
      "Prime would like to know more about you before payment.".obs;
  RxBool isGuestPhoneNumberValid = false.obs;
  RxString validGuestPhoneString = "".obs;
  RxString guestUserOtpCode = "".obs;
  String formattedGuestPhoneNumber = "";

  ///Listener to check timer for 1 min before allowing user to issue another command
  RxString timer = "".obs;
  CountryModel guestCountryModel = const CountryModel(
      name: "Ghana", codeName: "GH", codeNumber: "233", currency: "GHS");

  ///Init the controller here
  @override
  void onInit() {
    guestCountryCodeTxt.text = "+233";
    super.onInit();
  }

  void clear() {
    guestUserPhoneTxt.clear();
    guestCountryCodeTxt.text = "+233";
    validGuestPhoneString.value = "";
    guestUserOtpCode.value = "";
    guestStage.value = GuestStage.init;
    guestCountryModel = const CountryModel(
        name: "Ghana", codeName: "GH", codeNumber: "233", currency: "GHS");
  }

  void initTimerCheck() {
    Utils.tickTimer(Constants.SMS_CODE_TIMER, (time) {
      timer.value = time;
    });
  }

  ///============= HANDLE GUEST USER HERE =======================
  void liveValidateGuestPhoneNum() {
    if (guestUserPhoneTxt.text.isEmpty) {
      validGuestPhoneString.value = "";
      isGuestPhoneNumberValid.value = false;
      return;
    }

    NumberUtils.validatePhone(
        guestUserPhoneTxt.text, guestCountryModel.codeName, (valid) {
      isGuestPhoneNumberValid.value = valid;
      validGuestPhoneString.value =
          valid ? "Valid Phone Number" : "Invalid Phone Number";
      if (valid) {
        dismissKeyboard();
      }
    });
  }

  ///Guest user picks country to attach to his phone
  void onGuestPickCountryCode() {
    NumberUtils.pickCountryCode(mContext!, (c) {
      guestCountryModel = c;
      guestCountryCodeTxt.text = "+" + c.codeNumber;

      ///Validate the country code picked against the phone number entered
      liveValidateGuestPhoneNum();
    });
  }

  void handleGuestUser() {
    switch (guestStage.value) {
      case GuestStage.init:
        guestStage.value = GuestStage.success;
        break;
      case GuestStage.verifyPhone:
        initVerifyPhoneGenerateOtp();
        break;
      case GuestStage.verifyOtp:
        initGuestUserSignUp();
        break;
      case GuestStage.payment:
        break;
      case GuestStage.success:
        break;
      case GuestStage.loading:
        break;
      case GuestStage.hasAccountAlready:
        break;
    }
  }

  void submitGuestPhoneForVerification() {
    if (!isGuestPhoneNumberValid.value) {
      return;
    }

    NumberUtils.formatPhone(guestUserPhoneTxt.text, guestCountryModel.codeName,
        (phone) {
      formattedGuestPhoneNumber = phone;
      initVerifyPhoneGenerateOtp();
    });
  }

  void submitOtpForVerification() {
    if (guestUserOtpCode.value.length == 4) {
      initGuestUserSignUp();
    }
  }

  ///Verify IF this phone number does not exist on Prime
  ///Platform and send an OTP to the Phone for verification even
  /// before we signup this Phone unto Prime.
  void initVerifyPhoneGenerateOtp() {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("telephone", () => formattedGuestPhoneNumber);

    guestStage.value = GuestStage.loading;

    webService?.generateGuestOtp(param, (resp) {
      if (resp.success) {
        guestStage.value = GuestStage.verifyOtp;
        SnackBarApi.snackBarSuccess(resp.data?.message ??
            "Otp has been sent to $formattedGuestPhoneNumber");
        guestUserOtpCode.value = "";
        initTimerCheck();
      } else {
        guestStage.value = GuestStage.verifyPhone;
        SnackBarApi.snackBarInfo(resp.error ?? "");
      }
    });
  }

  void initGuestUserSignUp() {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("telephone", () => formattedGuestPhoneNumber);
    param.putIfAbsent("otp", () => guestUserOtpCode.value);
    param.putIfAbsent("user_type", () => Constants.USER_TYPE);

    guestStage.value = GuestStage.loading;

    webService?.signUpGuestUser(param, (resp) {
      if (resp.success) {
        guestStage.value = GuestStage.success;
        isGuestUser.value = false;
        prefUtils.saveGuestLoginDetails(resp, param);
        triggerHome();
      } else {
        SnackBarApi.snackBarInfo(resp.error ?? "");
        //If user has an account on Prime already
        if (resp.status == 201) {
          guestStage.value = GuestStage.hasAccountAlready;
          guestUserOtpCode.value = "";
        } else {
          guestStage.value = GuestStage.verifyOtp;
          guestUserOtpCode.value = "";
        }
      }
    });
  }

  void triggerHome() {
    Utils.startTimer(7, () {
      NavApi.fireTargetHome();
    });
  }

  @override
  void initLoginRequest(
      {bool pinLogin = false,
      Function? call,
      bool back = true,
      String? telephone}) {
    super.initLoginRequest(
        pinLogin: true,
        back: false,
        telephone: formattedGuestPhoneNumber,
        call: () {
          NavApi.fireTargetHome();
        });
  }
}
