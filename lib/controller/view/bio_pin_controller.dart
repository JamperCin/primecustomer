import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_routes.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/bio_api.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/auth/completeSignUp/verify_phone_screen.dart';
import 'package:primecustomer/ui/auth/forgotPswd/verify_phone_to_reset_credential.dart';
import 'package:primecustomer/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constants/constants.dart';

class BioPinController extends BaseController {
  BioApi bioApi = BioApi();
  RxInt pos = 0.obs;
  String pinCode = '';
  RxBool isStartedBioLogIn = false.obs;
  int failureAttempts = 3;

  onPinClicked(String val, {Function? call}) {
    if (pos.value < 4) {
      pos.value++;
      pinCode = "$pinCode$val";
      if (pinCode.length == 4) {
        initLoginRequest(pinLogin: true, call: call);
      }
    }
  }

  void onDeleteOnClick() {
    if (pos.value > 0) {
      pos.value--;
      pinCode = pinCode.substring(0, pinCode.length - 1);
    }
  }

  void inputUserPhone({required Function(String) call}) {
    TextEditingController phoneTxt = TextEditingController();
    DialogsApi.popUpNormalDialog(
      Get.context!,
      title: "Oops...!!!",
      asset: "assets/images/ic_request_success.png",
      child: UiApi.phoneInputWidget(phoneTxt),
      actions: [
        UiApi.textButton(
          trailingText: "Cancel",
          onTap: () {
            NavApi.fireBack();
          },
        ),
        UiApi.textButton(
          trailingText: "Submit",
          onTap: () {
            NavApi.fireBack();
            call(getStringData(phoneTxt));
          },
        ),
      ],
    );
  }

  void initLoginRequest({
    bool pinLogin = false,
    Function? call,
    bool back = true,
    String? telephone,
  }) {
    String tel = telephone ?? prefUtils.getString(PrefConstants.PHONE_NUMBER);

    ///Check if No phone is already saved, ask for phone numbers
    if (tel.isEmpty) {
      inputUserPhone(call: (phone) {
        initLoginRequest(
          pinLogin: pinLogin,
          call: call,
          back: back,
          telephone: phone,
        );
      });
      return;
    }

    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("forname", () => tel);
    if (pinLogin) {
      isStartedBioLogIn.value = false;
      params.putIfAbsent("pin", () => pinCode);
    } else {
      isStartedBioLogIn.value = true;
      params.putIfAbsent(
          "password", () => prefUtils.getString(PrefConstants.PASSWORD));
    }
    params.putIfAbsent("user_type", () => Constants.USER_TYPE);
    webService?.login(
      params,
      (response) {
        isStartedBioLogIn.value = false;
        if (response.success && call != null) {
          isGuestUser.value = false;
          prefUtils.saveLoginDetails(response, params);
          if (back) NavApi.fireBack();
          call();
          return;
        } else {
          if (pinLogin) {
            failureAttempts--;
            if (failureAttempts == 0) {
              DialogsApi.popUpSuccessDialog(Get.context!,
                  title: "Too many Attempts",
                  mess:
                      "Sorry, you have too many attempts without success. Kindly try again later.",
                  call: () {
                failureAttempts = 3;
                navUtils.fireTargetOff(AppRoutes.getPage());
              });
              return;
            }
          }
          onSuccessLogin(response, params, error: "Invalid Pin entered.");
        }
      },
      showProgressBar: pinLogin,
      errorMess: pinLogin
          ? "Invalid Pin entered."
          : "Invalid phone or password combination entered",
    );
  }

  @override
  void onSuccessLogin(BaseResponseModel response, HashMap map,
      {String? error}) {
    pinCode = "";
    pos.value = 0;
    super.onSuccessLogin(response, map, error: error);
  }

  void onForgotPinOnClick() {
    NavApi.fireTarget(VerifyPhoneToResetCred(),
        model: CardModel(shouldResetPin: true));
  }

  void onGoToLogin() {
    navUtils.fireTargetOff(LoginScreen());
  }

  void checkForUnverifiedAccount() {
    if (prefUtils.getBool(PrefConstants.NEED_VERIFICATION) &&
        prefUtils.getPhoneNumber().isNotEmpty) {
      DialogsApi.popUpNormalDialog(
        Get.context!,
        title: "Attention!!!",
        asset: "assets/images/ic_warn.png",
        child: UiApi.richText(
          maxLines: 4,
          textAlign: TextAlign.center,
          mod: [
            RichTextModel(
              text:
                  "It seems you have an unverified account with phone number ",
            ),
            RichTextModel(
              text: prefUtils.getPhoneNumber(),
              style: AppTextStyles.descStyleBold,
            ),
          ],
        ),
        actions: [
          UiApi.textButton(
            trailingText: "Cancel",
            onTap: () {
              NavApi.fireBack();
              // prefUtils.setBool(PrefConstants.NEED_VERIFICATION, false);
            },
          ),
          UiApi.textButton(
            trailingText: "Verify Account",
            onTap: () {
              NavApi.fireBack();
              NavApi.fireTarget(
                VerifyPhoneScreen(),
                model: CardModel(phoneNumber: prefUtils.getPhoneNumber()),
              );
            },
          ),
        ],
      );
    }
  }
}
