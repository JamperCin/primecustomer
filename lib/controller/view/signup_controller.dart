import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/data/model/local/web_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_strings.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/app_config.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/auth/completeSignUp/verify_phone_screen.dart';
import 'package:primecustomer/ui/auth/login/login_screen.dart';
import 'package:primecustomer/ui/auth/signup/security_pin_screen.dart';
import 'package:primecustomer/ui/auth/signup/verification_screen.dart';
import 'package:primecustomer/ui/base/base_web.dart';
import 'package:primecustomer/utils/image_picker_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/remote/base/base_response_model.dart';
import '../../data/model/remote/country_model.dart';
import '../../res/app/app_colors.dart';
import '../../res/ui_helpers/ui_api.dart';
import '../../utils/Utils.dart';
import '../../utils/validation_utils.dart';
import '../base/base_controller.dart';

class SignUpController extends BaseController {
  ///Define all variables here
  RxString profilePicURl = "".obs;
  RxBool isImageUploading = false.obs;
  RxString verificationCode = "".obs;
  RxString securityPin = "".obs;

  ///Listener to check if phone number is correct
  RxBool isPhoneNumberValid = false.obs;
  RxString validPhoneString = "".obs;

  ///Listener to check timer for 1 min before allowing user to issue another command
  RxString timer = "".obs;

  ///Define the TextEditingControllers here
  TextEditingController firstNameTxt = TextEditingController();
  TextEditingController lastNameTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();
  TextEditingController countryCodeTxt = TextEditingController();
  TextEditingController passwordTxt = TextEditingController();
  TextEditingController confPasswordTxt = TextEditingController();

  ///Default country of user should be Ghana
  ///name: "Ghana", code_name: "GH", code_number: "233", currency: "¢"
  CountryModel countryModel = const CountryModel(
      name: "Ghana", codeName: "GH", codeNumber: "233", currency: "GHS");

  ///Complete phone number to sign up
  String formattedPhoneNumber = "";

  ///
  bool isTermsAndConditionsChecked = false;

  ImagePickerUtils? imagePickerUtils;

  ///Init the controller here
  @override
  void onInit() {
    countryCodeTxt.text = "+233";
    super.onInit();
    initSmsPlugin();
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    imagePickerUtils = ImagePickerUtils(webService: webService!);
  }

  ///-----------------------------SIGN UP SCREEN------------------------------------

  void onProfileImageOnClick() {
    imagePickerUtils?.pickImage(isImageUploading, (url) {
      profilePicURl.value = url;
      printLog("Data here == $url");
    });
  }

  ///Validate the Signup entries before moving to next screen
  bool isSignUpValid() {
    bool valid = ValidationUtils.validateDataEntry(firstNameTxt,
            err: "First name Required") &&
        ValidationUtils.validateDataEntry(firstNameTxt,
            err: "Last name Required") &&
        ValidationUtils.validateEntryPhone(phoneTxt,
            isValid: isPhoneNumberValid.value) &&
        ValidationUtils.validatePasswords(passwordTxt, confPasswordTxt);

    if (valid && !isTermsAndConditionsChecked) {
      SnackBarApi.snackBarInfo(
          "Please accept the terms and conditions before signing up.");
      valid = false;
    }

    return valid;
  }

  bool checkForUnverifiedAccount() {
    bool needsVerification =
        prefUtils.getBool(PrefConstants.NEED_VERIFICATION) &&
            prefUtils.getPhoneNumber().isNotEmpty &&
            formattedPhoneNumber == prefUtils.getPhoneNumber();

    debugPrint("AC : $formattedPhoneNumber  == ${prefUtils.getPhoneNumber()}");

    if (needsVerification) {
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
    return needsVerification;
  }

  ///OnClick listener to the NEXT button to sign up user
  ///First of - validate the fields
  ///         - Validate the phone number
  ///         - Confirm the phone number before proceeding to signup
  ///         - Verification of a 6-digit code follows
  void onNextOnClick() {
    if (isSignUpValid()) {
      NumberUtils.formatPhone(phoneTxt.text, countryModel.codeName, (phone) {
        formattedPhoneNumber = phone;

        if (!checkForUnverifiedAccount()) {
          confirmRequest();
        }
      });
    }
  }

  void confirmRequest({bool resendCode = false, bool moveNext = false}) {
    UiApi.showConfirmDialog(
        color: AppColors.white,
        imageAsset: "assets/images/ic_phone_verify.svg",
        title: "Confirm $formattedPhoneNumber",
        message: AppString.SIGN_UP_VERIFY_TEXT,
        callBack: () {
          resendCode
              ? initResendCodeRequest(moveNext: moveNext)
              : initSignUpRequest();
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

  ///Make an api call to the backend to signUp User
  void initSignUpRequest() {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("first_name", () => getStringData(firstNameTxt));
    params.putIfAbsent("surname", () => getStringData(lastNameTxt));
    params.putIfAbsent("telephone", () => formattedPhoneNumber);
    params.putIfAbsent("password", () => getStringData(passwordTxt));
    params.putIfAbsent("country", () => countryModel);
    params.putIfAbsent("person_type", () => Constants.USER_TYPE);
    params.putIfAbsent("platform", () => platformAccess);

    if (profilePicURl.value.isNotEmpty) {
      params.putIfAbsent("profile_pic_url", () => profilePicURl.value);
    }

    webService?.signUpCustomer(params, (response) {
      prefUtils.saveSignUpDetails(params, response);
      NavApi.fireTarget(VerificationScreen());
    });
  }

  ///==========================================================================================END

  ///----------------------- VERIFICATION SCREEN - BELOW --------------------------------------
  ///

  void onVerifyPhoneOnClick() {
    NumberUtils.formatPhone(phoneTxt.text, countryModel.codeName, (phone) {
      formattedPhoneNumber = phone;
      confirmRequest(resendCode: true, moveNext: true);
    });
  }

  void initTimerCheck() {
    Utils.tickTimer(Constants.SMS_CODE_TIMER, (time) {
      timer.value = time;
    });
  }

  void initResendCodeRequest({bool moveNext = false}) {
    HashMap<String, String> params = HashMap();
    params.putIfAbsent("telephone", () => formattedPhoneNumber);

    webService?.resendVerificationsCode(params, (response) {
      verificationCode.value = "";
      if (moveNext) {
        NavApi.fireTarget(VerificationScreen());
      } else {
        SnackBarApi.snackBarSuccess(
            "A new verification code has been sent to $formattedPhoneNumber");

        initTimerCheck();
      }
    });
  }

  void onLastPinEntered(String code) {
    HashMap<String, String> params = HashMap();
    params.putIfAbsent("code", () => code);
    params.putIfAbsent("country_code", () => countryModel.codeName);
    params.putIfAbsent("telephone", () => formattedPhoneNumber);

    webService?.verifyCode(params, (response) {
      prefUtils.saveTokenForPin(response.data?.verifiedToken.signed ?? "");
      prefUtils.setString(PrefConstants.PHONE_NUMBER, formattedPhoneNumber);

      NavApi.fireEvent(Event(
        action: EventAction.SUCCESS,
        model: SuccessModel.signUp(),
      ));
    });
  }

  void onPickCountryCode() {
    NumberUtils.pickCountryCode(mContext!, (c) {
      countryModel = c;
      countryCodeTxt.text = "+" + c.codeNumber;

      ///Validate the country code picked against the phone number entered
      liveValidatePhoneNum();
    });
  }

  void onAgreeCheck(bool isChecked) {
    isTermsAndConditionsChecked = isChecked;
  }

  void onTermsOnClick(String url) {
    WebModel model = WebModel(
        url: url,
        title: url == AppConfig.PRIME_TERMS
            ? "Terms And Conditions"
            : "Privacy Policy");

    NavApi.fireEvent(Event(target: BaseWebView(), model: model));
  }

  void onContinueOnClick() {
    NavApi.fireEvent(Event(target: SecurityPinScreen()));
  }

  ///============================= SECURITY PIN =============================
  bool isPinValid() {
    if (securityPin.value.length != 4) {
      SnackBarApi.snackBarError("Please input a valid Pin");
      return false;
    }

    return true;
  }

  void onConfirmSecurityPin() {
    if (isPinValid()) {
      UiApi.showConfirmDialog(
          color: AppColors.white,
          imageAsset: "assets/images/ic_phone_verify.svg",
          title: "Confirm PIN $securityPin",
          message: AppString.PIN_VERIFY_TEXT,
          callBack: () {
            initPinSetRequest();
          });
    }
  }

  void initPinSetRequest() {
    HashMap<String, String> params = HashMap();
    params.putIfAbsent("pin", () => securityPin.value);
    params.putIfAbsent(
        "telephone", () => prefUtils.getString(PrefConstants.PHONE_NUMBER));
    params.putIfAbsent("verified_token",
        () => prefUtils.getString(PrefConstants.VERIFIED_TOKEN));

    params.putIfAbsent("person_type", () => Constants.USER_TYPE);

    webService?.setSecurityPin(params, (res) {
      prefUtils.setString(PrefConstants.SECURITY_PIN, securityPin.value);
      NavApi.fireEvent(Event(
        action: EventAction.SUCCESS,
        model: SuccessModel.pin((context) {
          setContext(context);
          initLoginRequest();
        }),
      ));
    });
  }

  void initLoginRequest() {
    if (!prefUtils.canLogin()) {
      navUtils.fireTarget(LoginScreen());
      return;
    }

    HashMap<String, Object> params = HashMap();
    params.putIfAbsent(
        "forname", () => prefUtils.getString(PrefConstants.PHONE_NUMBER));
    params.putIfAbsent(
        "password", () => prefUtils.getString(PrefConstants.PASSWORD));
    params.putIfAbsent("user_type", () => Constants.USER_TYPE);
    webService?.login(params, (response) {
      onSuccessLogin(response, params);
    });
  }

  @override
  void onSuccessLogin(BaseResponseModel response, HashMap map,
      {String? error}) {
    if (response.error == 'Unauthorized') {
      navUtils.fireTarget(LoginScreen());
      return;
    }

    super.onSuccessLogin(response, map);
  }

  void prepopulatePhone(String phone) {
    if (phone.length > 4) {
      phoneTxt.text = phone.substring(4);
    }
  }
}
