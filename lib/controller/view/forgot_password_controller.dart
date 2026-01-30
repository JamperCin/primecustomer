import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/view/delete_account_controller.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/country_model.dart';
import 'package:primecustomer/data/model/remote/question.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/auth/forgotPswd/answer_security_questions.dart';
import 'package:primecustomer/ui/auth/forgotPswd/reset_password_screen.dart';
import 'package:primecustomer/ui/auth/forgotPswd/reset_pin_screen.dart';
import 'package:primecustomer/ui/auth/login/login_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/settings/delete_account/verify_user_otp.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:primecustomer/utils/validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends DeleteAccountController {
  ///Set this boolean when beginning the flow to reset Password or Reset Pin
  RxBool shouldResetPin = false.obs;

  ///Define TextEditControllers here
  //@override
  TextEditingController phoneTxt = TextEditingController();
  //@override
  TextEditingController countryCodeTxt = TextEditingController();

  //Password Rest
  TextEditingController passwordTxt = TextEditingController();
  TextEditingController confPasswordTxt = TextEditingController();

  ///Answer text
  TextEditingController answerTxt = TextEditingController();

  ///Security Questions List
  RxList<Question> questionList = RxList<Question>();

  RxList<DictionaryModel> authTypeList = [
    DictionaryModel(
        key: "Receive sms on your phone number to verify account",
        value: "Sms"),
    DictionaryModel(
        key: "Answer your security questions to verify account",
        value: "Security"),
  ].obs;

  Rx<DictionaryModel> selectedAuthType = DictionaryModel(
          key: "Receive sms on your phone number to verify account",
          value: "Sms")
      .obs;

  //Current userId
  int userId = 0;
  //For password reset or Pin Reset
  String userToken = "";
  RxInt questionPosition = 0.obs;

  ///Default country of user should be Ghana
  ///name: "Ghana", code_name: "GH", code_number: "233", currency: "¢"
  //@override
  CountryModel countryModel = const CountryModel(
      name: "Ghana", codeName: "GH", codeNumber: "233", currency: "GHS");

  RxBool isVerifyingPhone = false.obs;

  RxString securityPin = "".obs;

  @override
  void clear() {
    super.clear();
    isVerifyingPhone.value = false;
    questionPosition.value = 0;
    isVerifyingPhone.value = false;
    shouldResetPin.value = false;
    phoneTxt.clear();
    passwordTxt.clear();
    confPasswordTxt.clear();
    answerTxt.clear();
    securityPin.value = "";
    countryCodeTxt.text = "+" + countryModel.codeNumber;
  }

  @override
  void onInit() {
    super.onInit();
    initSmsPlugin();
  }

  void onPickCountryCode() {
    NumberUtils.pickCountryCode(mContext!, (c) {
      countryModel = c;
      countryCodeTxt.text = "+" + c.codeNumber;

      ///Validate the country code picked against the phone number entered
      liveValidatePhoneNum();
    });
  }

  void onVerifyPhone() {
    if (!isPhoneNumberValid.value || phoneTxt.text.isEmpty) {
      return;
    }
    NumberUtils.formatPhone(phoneTxt.text, countryModel.codeName, (phone) {
      formattedPhoneNumber = phone;
      formattedOldPhoneNumber = phone; //just a backup

      ///if user wants to verify using security questions then move ahead
      /// - to get user ID using the phone number
      /// - Use user ID to retrieve his/her security questions
      if (selectedAuthType.value.value == "Security") {
        initPhoneVerification();
      } else {
        confirmPhoneToReceiveSms();
      }
    });
  }

  void confirmPhoneToReceiveSms() {
    UiApi.showConfirmDialog(
        color: AppColors.white,
        imageAsset: "assets/images/ic_phone_verify.svg",
        title: "Confirm Phone Number $formattedPhoneNumber",
        message:
            "You will receive a 6-digit verification on the provided phone number",
        callBack: () {
          initSendOtp();
        });
  }

  @override
  HashMap<String, String> getParams() {
    HashMap<String, String> params = HashMap();
    params.putIfAbsent("telephone", () => formattedPhoneNumber);
    return params;
  }

  @override
  void handleAfterOtpSent({bool resendCode = false}) {
    if (!resendCode) {
      NavApi.fireTarget(VerifyUserOtp(call: (code) {
        handleAfterOtpVerification(code);
      }), model: CardModel(phoneNumber: formattedPhoneNumber));
    }
    initTimerCheck();
    verificationCode.value = "";
    SnackBarApi.snackBarSuccess(
        "A new verification code has been sent to $formattedPhoneNumber");
  }

  @override
  void handleAfterOtpVerification(String code) {
    //handle the next action after SMS verification
    userToken = code;
    NavApi.fireTarget(
        shouldResetPin.value ? ResetPinScreen() : ResetPasswordScreen());
  }

  void initPhoneVerification() {
    isVerifyingPhone.value = true;
    webService?.verifyUserPhone(formattedPhoneNumber, (response) {
      if (response.success) {
        userId = response.data?.signupUser.id ?? 0;

        initGetUsersSavedQuestions(userId);
      } else {
        isVerifyingPhone.value = false;
        SnackBarApi.snackBarInfo(response.error ??
            "We cannot verify your phone number at the moment. Kindly try again later.");
      }
    });
  }

  void initGetUsersSavedQuestions(int userid) {
    webService?.getUsersSavedQuestions(userId, (response) {
      isVerifyingPhone.value = false;
      questionList.clear();
      questionList.addAll(response.data?.questions ?? []);
      phoneTxt.clear();
      if (questionList.isNotEmpty) {
        NavApi.fireTarget(AnswerSeurityQuestions());
      } else {
        String error = response.error ?? "";
        SnackBarApi.snackBarInfo(error.isEmpty
            ? "You have no security questions set on your account. Kindly contact prime support team for help. (+233 2471 174 48)"
            : error);
      }
    });
  }

  Question getQuestion() {
    return questionList[questionPosition.value];
  }

  void onSubmitAnswerOnClick() {
    if (ValidationUtils.validateDataEntry(answerTxt,
        err: "Please enter valid input")) {
      //submit answer and question
      initAnswerQuestionRequest();
    }
  }

  void initAnswerQuestionRequest() {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("user_id", () => userId);
    param.putIfAbsent("question_id", () => getQuestion().id);
    param.putIfAbsent("answer", () => getStringData(answerTxt));

    webService?.verifyAnswerToQuestion(param, (response) {
      if (response.success) {
        userToken = response.data?.token ?? "";
        NavApi.fireTarget(
            shouldResetPin.value ? ResetPinScreen() : ResetPasswordScreen());
      } else {
        popDialogToCheckValidityOfAnswer();
      }
    });
  }

  void popDialogToCheckValidityOfAnswer() {
    bool isWrongAnswer = questionPosition.value != (questionList.length - 1);
    debugPrint("QUEST ${questionPosition.value} == $isWrongAnswer");
    String title =
        isWrongAnswer ? "Wrong Answer Provided" : "Too Many Attempts";
    String mess = isWrongAnswer
        ? "You provided a wrong answer to the above question. Do you want to answer new question?"
        : "You have made too many attempts to answer these security questions. Kindly contact support team for help";

    UiApi.showConfirmDialog(
        imageAsset: "assets/images/ic_phone_verify.svg",
        assetIcon: Icon(
          Icons.do_not_disturb_alt,
          color: AppColors.redLight,
          size: AppDimens.dimen120,
        ),
        title: title,
        titleStyle: AppTextStyles.titleStyleBold,
        message: mess,
        buttonTitle: isWrongAnswer ? "Next Question" : "Close",
        callBack: () {
          answerTxt.clear();
          if (isWrongAnswer) {
            questionPosition.value++;
          } else {
            NavApi.fireAction(EventAction.LOG_OUT);
          }
        });
  }

  void onConfirmPinReset() {
    if (securityPin.value.length != 4) {
      SnackBarApi.snackBarError("Please enter a valid  Pin.");
      return;
    }

    UiApi.showConfirmDialog(
        imageAsset: "assets/images/ic_phone_verify.svg",
        title: "Confirm Pin Reset.",
        titleStyle: AppTextStyles.titleStyleBold,
        message: "Are you sure you want to proceed with Pin Reset?",
        callBack: () {
          initPinResetRequest();
        });
  }

  void onConfirmPasswordReset() {
    if (ValidationUtils.validatePasswords(passwordTxt, confPasswordTxt)) {
      UiApi.showConfirmDialog(
          imageAsset: "assets/images/ic_phone_verify.svg",
          title: "Confirm Password Reset.",
          titleStyle: AppTextStyles.titleStyleBold,
          message: "Are you sure you want to proceed with Password Reset?",
          callBack: () {
            initPasswordResetRequest();
          });
    }
  }

  void initPasswordResetRequest() {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("password", () => getStringData(passwordTxt));
    param.putIfAbsent("token", () => userToken);

    webService?.resetPassword(param, (response) {
      DialogsApi.popUpSuccessDialog(mContext!,
          time: 6,
          asset: "assets/images/ic_phone_verify.svg",
          mess:
              "Password successfully changed. You can now logIn with your new password",
          call: () {
            navUtils.fireTargetOff(LoginScreen());
      });
    });
  }

  ///At the moment, you can only reset your PIN when you have logged In, since
  ///you will need your verification Token to reset PIN
  ///We need to change this to use the one time Token generated during answering of security questions
  void initPinResetRequest() {
    HashMap<String, String> params = HashMap();
    params.putIfAbsent("verified_token", () => userToken);

    params.putIfAbsent("pin", () => securityPin.value);
    params.putIfAbsent("telephone", () => formattedPhoneNumber);

    webService?.setSecurityPin(params, (response) {
      prefUtils.setString(PrefConstants.SECURITY_PIN, securityPin.value);
      DialogsApi.popUpSuccessDialog(mContext!,
          time: 6,
          asset: "assets/images/ic_phone_verify.svg",
          mess: "Pin successfully changed. You can now logIn with your new Pin",
          call: () {
        NavApi.fireAction(EventAction.LOG_OUT);
      });
    });
  }

  void populatePhone() {
    if (prefUtils.isLogin &&
        shouldResetPin.value &&
        prefUtils.getPhoneNumber().length > 4) {
      phoneTxt.text = prefUtils.getPhoneNumber().substring(4);
      liveValidatePhoneNum();
    }
  }

  void onChangeAuthType(DictionaryModel dic) {
    selectedAuthType.value = dic;
  }
}
