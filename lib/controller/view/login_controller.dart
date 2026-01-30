import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/auth/completeSignUp/verify_phone_screen.dart';
import 'package:primecustomer/ui/auth/forgotPswd/verify_phone_to_reset_credential.dart';
import 'package:primecustomer/ui/auth/login/bio_pin_auth_screen.dart';
import 'package:primecustomer/ui/auth/signup/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../res/api/navigation_api.dart';
import '../../utils/Utils.dart';
import '../../utils/validation_utils.dart';
import '../base/base_controller.dart';

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
    NavApi.fireTargetHome();
  }

  void onSignUpClicked() {
    NavApi.fireTarget(SignUpScreen());
  }

  void onForgotPasswordClicked() {
    NavApi.fireTarget(VerifyPhoneToResetCred(), model: CardModel());
  }

  ///OnClick listener to the LogIn Button
  void onLoginOnClick() {
    if (ValidationUtils.validateEntryPhone(phoneTxtCtrl) &&
        ValidationUtils.validateDataEntry(passwordTxtCtrl)) {
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
    params.putIfAbsent("user_type", () => Constants.USER_TYPE);
    webService?.login(params, (response) {
      onSuccessLogin(response, params, error: "Wrong credentials entered.");
    });
  }

  void onPinBioLogInOnClick() {
    navUtils.fireTargetOff(BioPinLoginScreen());
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
