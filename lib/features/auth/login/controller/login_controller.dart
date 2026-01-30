import 'dart:collection';

import 'package:core_module/core/def/global_def.dart'
    hide validationUtils, navUtils;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:primecustomer/common/controller/base_controller.dart';
import 'package:primecustomer/core/constants/app_constants.dart';
import 'package:primecustomer/core/constants/preference_constants.dart';
import 'package:primecustomer/core/def/global_access.dart';
import 'package:primecustomer/core/utils/Utils.dart';
import 'package:primecustomer/main_app.dart';
import 'package:uuid/uuid.dart';

class LoginController extends BaseController {
  var phoneTxtCtrl = TextEditingController();
  var passwordTxtCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    //todo remove from code: This is test account
    // phoneTxtCtrl.text = "0207223021";
    // passwordTxtCtrl.text = "_pa55w0rD";

    // phoneTxtCtrl.text = "0550772058";
    // passwordTxtCtrl.text = "ahmed12345";

    //phoneTxtCtrl.text = "0245007680";
    //passwordTxtCtrl.text = "Password123";
    //
    // phoneTxtCtrl.text = "0245007680";
    //passwordTxtCtrl.text = "asdfghjkl";
  }

  void onGuestLoginOnClicked() {
    var uuid = const Uuid();
    isGuestUser.value = true;
    guestUserToken = uuid.v1();
    navUtils.fireTargetHome();
  }

  void onSignUpClicked() {
    // NavApi.fireTarget(SignUpScreen());
  }

  void onForgotPasswordClicked() {
    // NavApi.fireTarget(VerifyPhoneToResetCred(), model: CardModel());
  }

  ///OnClick listener to the LogIn Button
  void onLoginOnClick() {
    if (validationUtils.validateEntryPhone(phoneTxtCtrl) &&
        validationUtils.validateDataEntry(passwordTxtCtrl)) {
      _initLoginRequest();
    }
  }

  ///Initialise the login request to the Api
  ///SAmple Login Credentials to the Demo platform
  /// [ForeName == 0245007680]
  /// [Password == asdfghjkl]
  void _initLoginRequest() {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("forname", () => Utils.getStringData(phoneTxtCtrl));
    params.putIfAbsent("password", () => Utils.getStringData(passwordTxtCtrl));
    params.putIfAbsent("user_type", () => AppConstants.USER_TYPE);
    // webService?.login(params, (response) {
    //   onSuccessLogin(response, params, error: "Wrong credentials entered.");
    // });
  }

  void onPinBioLogInOnClick() {
    // navUtils.fireTargetOff(BioPinLoginScreen());
  }

  void checkForUnverifiedAccount() {
    // if (prefUtils.getBool(PreferenceConstants.NEED_VERIFICATION) &&
    //     prefUtils.getPhoneNumber().isNotEmpty) {
      // DialogsApi.popUpNormalDialog(
      //   Get.context!,
      //   title: "Attention!!!",
      //   asset: "assets/images/ic_warn.png",
      //   child: UiApi.richText(
      //     maxLines: 4,
      //     textAlign: TextAlign.center,
      //     mod: [
      //       RichTextModel(
      //         text:
      //             "It seems you have an unverified account with phone number ",
      //       ),
      //       RichTextModel(
      //         text: prefUtils.getPhoneNumber(),
      //         style: AppTextStyles.descStyleBold,
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     UiApi.textButton(
      //       trailingText: "Cancel",
      //       onTap: () {
      //         navUtils.fireBack();
      //         // prefUtils.setBool(PrefConstants.NEED_VERIFICATION, false);
      //       },
      //     ),
      //     UiApi.textButton(
      //       trailingText: "Verify Account",
      //       onTap: () {
      //         navUtils.fireBack();
      //         navUtils.fireTarget(
      //           VerifyPhoneScreen(),
      //           model: CardModel(phoneNumber: prefUtils.getPhoneNumber()),
      //         );
      //       },
      //     ),
      //   ],
      // );
   // }
  }
}
