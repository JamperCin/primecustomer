import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/view/bio_pin_controller.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/enum/guest_staging.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/data/model/remote/country_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/contacts_api.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PersonaliseController extends BioPinController {
  TextEditingController phoneTxt = TextEditingController();
  TextEditingController guestUserPhoneTxt = TextEditingController();
  TextEditingController countryCodeTxt = TextEditingController();
  TextEditingController guestCountryCodeTxt = TextEditingController();

  CardController? cardController;
  CardModel? cardModel;
  PanelController panelController = PanelController();

  RxString guestHeader =
      "Prime would like to know more about you before payment.".obs;

  ///Listener to check if phone number is correct
  RxBool isPhoneNumberValid = false.obs;
  RxBool isGuestPhoneNumberValid = false.obs;
  RxString validPhoneString = "".obs;
  RxString validGuestPhoneString = "".obs;
  RxString contact = "".obs;
  RxString scheduledDate = "".obs;
  RxString scheduledTime = "".obs;
  RxString guestUserOtpCode = "".obs;
  RxDouble minHeightGuestInfo = 0.0.obs;

  String formattedPhoneNumber = "";
  String formattedGuestPhoneNumber = "";

  ///Default country of user should be Ghana
  ///name: "Ghana", code_name: "GH", code_number: "233", currency: "¢"
  CountryModel countryModel = const CountryModel(
      name: "Ghana", codeName: "GH", codeNumber: "233", currency: "GHS");
  CountryModel guestCountryModel = const CountryModel(
      name: "Ghana", codeName: "GH", codeNumber: "233", currency: "GHS");

  TextEditingController messageTxt = TextEditingController();

  ///Init the controller here
  @override
  void onInit() {
    countryCodeTxt.text = "+233";
    guestCountryCodeTxt.text = "+233";
    super.onInit();
  }

  void clear() {
    minHeightGuestInfo.value = 0;
    phoneTxt.clear();
    guestUserPhoneTxt.clear();
    countryCodeTxt.text = "+233";
    guestCountryCodeTxt.text = "+233";
    scheduledDate.value = "";
    scheduledTime.value = "";
    validGuestPhoneString.value = "";
    validPhoneString.value = "";
    guestUserOtpCode.value = "";
    guestStage.value = GuestStage.init;

    countryModel = const CountryModel(
        name: "Ghana", codeName: "GH", codeNumber: "233", currency: "GHS");
    guestCountryModel = const CountryModel(
        name: "Ghana", codeName: "GH", codeNumber: "233", currency: "GHS");
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  ///Listener to check timer for 1 min before allowing user to issue another command
  RxString timer = "".obs;

  void initTimerCheck() {
    Utils.tickTimer(Constants.SMS_CODE_TIMER, (time) {
      timer.value = time;
    });
  }

  void pickContact() {
    ContactsApi().pickContact((phone) {
      phoneTxt.text = phone.selectedPhoneNumber ?? "";

      print("COntact here ${phone.selectedPhoneNumber} == ${phone.fullName}");

      ///Validate the country code picked against the phone number entered
      liveValidatePhoneNum();
      contact.value = phone.fullName ?? "";
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

  ///Validate phone number whiles user is typing
  void liveValidatePhoneNum() {
    if (phoneTxt.text.isEmpty) {
      validPhoneString.value = "";
      contact.value = "";
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
    contact.value = phoneTxt.text;
  }

  void onCustomiseGiftOnClick(CardModel model) {}

  void onScheduleDate() {
    DateTimeUtils.pickDate(mContext!, call: (val) {
      scheduledDate.value = val;
    });
  }

  void onScheduleTime() {
    DateTimeUtils.pickTime(mContext!, call: (val) {
      scheduledTime.value = val;
    });
  }

  bool isValid() {
    if (!isPhoneNumberValid.value || getStringData(phoneTxt).isEmpty) {
      SnackBarApi.snackBarError("Please enter a valid phone number");
      return false;
    }

    if (scheduledDate.isEmpty && scheduledTime.isEmpty) {
      return true;
    }

    if (scheduledDate.isNotEmpty && scheduledTime.isEmpty) {
      SnackBarApi.snackBarError(
          "Please select the scheduled time for card delivery");
      return false;
    }

    if (scheduledDate.isEmpty && scheduledTime.isNotEmpty) {
      SnackBarApi.snackBarError(
          "Please select the scheduled date for card delivery");
      return false;
    }

    if (!DateTimeUtils.isValidDateTime("$scheduledDate $scheduledTime")) {
      SnackBarApi.snackBarError(
          "Please select a valid date and time. Check if time is not behind current time");
      return false;
    }

    return true;
  }

  void confirmPayment(CardModel cardModel, {bool payFromWallet = false}) {
    this.cardModel = cardModel;
    if (isValid()) {
      NumberUtils.formatPhone(phoneTxt.text, countryModel.codeName, (phone) {
        formattedPhoneNumber = phone;
        if (isGuestUser.value) {
          handleGuestUser();
        } else {
          confirmRequest(payFromWallet: payFromWallet);
        }
      });
    }
  }

  void confirmRequest({bool payFromWallet = false}) {
    UiApi.showConfirmDialog(
      title: "Confirm Payment",
      assetSize: SizeConfig.screenWidth * 0.2,
      titleStyle: AppTextStyles.titleStyleBold,
      messageWidget: Center(
        child: UiApi.richText(
          textAlign: TextAlign.center,
          maxLines: 3,
          mod: [
            RichTextModel(text: "Confirm payment of gift card(s) \nworth "),
            RichTextModel(
              text: "${CardController.cartTotalAmount.value} ",
              style: AppTextStyles.titleStyleBold
                  .copyWith(color: AppColors.primaryGreenColor),
              monitize: true,
            ),
            RichTextModel(text: " to Phone Number "),
            RichTextModel(text: formattedPhoneNumber),
          ],
        ),
      ),
      callBack: () {
        initPaymentRequest(payFromWallet: payFromWallet);
      },
    );
  }

  ///Get a redirect URL form Global Pay to continue with payment
  void initPaymentRequest({bool payFromWallet = false}) {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("cart_id", () => "${cardModel?.cart?.cartId ?? 0}");
    params.putIfAbsent("use_prime_wallet", () => payFromWallet);
    params.putIfAbsent("payment_to", () => cardModel?.dic?.value ?? "OTHERS");

    params.putIfAbsent(
        "telephone", () => NumberUtils.cleanPhoneNumber(formattedPhoneNumber));

    if (messageTxt.text.isNotEmpty) {
      params.putIfAbsent("message", () => messageTxt.text.trim());
    }

    if (scheduledDate.isNotEmpty) {
      params.putIfAbsent("scheduled_date",
          () => DateTimeUtils.dateTime("$scheduledDate $scheduledTime"));
    }

    webService?.makePaymentOfCard(params, (response) {
      if (response.success) {
        if (payFromWallet) {
          NavApi.fireSuccess(
            SuccessModel.payment(event: Event(action: EventAction.NAV_HOME)),
          );
        } else {
          cardController?.goToWebPayment(
            paymentUrl: response.data?.paymentUrl,
            call: () {
              NavApi.fireAction(EventAction.NAV_HOME);

              // if (isGuestUser.value) {
              //   NavApi.fireTargetOff(HomeScreen());
              // } else {
              //   NavApi.fireAction(EventAction.NAV_HOME);
              // }
            },
          );
        }
      } else {
        cardController?.handleError(
          mess: response.error,
          cartID: cardModel?.cart?.cartId ?? 0,
        );
      }
    });
  }

  ///Lets load this from an api
  void selectMessage() {
    DialogsApi.showBottomSheet(
      padding: EdgeInsets.only(
          left: AppDimens.dimen10,
          right: AppDimens.dimen10,
          top: AppDimens.dimen20),
      containerSize: AppDimens.dimen500,
      mainChild: UiApi.listView(
        list: messageList(),
        padding: EdgeInsets.zero,
      ),
    );
  }

  List<Widget> messageList() {
    List<Widget> list = [];

    list.add(Center(
        child: Text("Select Message", style: AppTextStyles.descStyleBold)));
    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());

    return list;
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
    panelController.animatePanelToPosition(1.0);
    switch (guestStage.value) {
      case GuestStage.init:
        guestStage.value = GuestStage.verifyPhone;
        break;
      case GuestStage.verifyPhone:
        initVerifyPhoneGenerateOtp();
        break;
      case GuestStage.verifyOtp:
        initGuestUserSignUp();
        break;
      case GuestStage.payment:
        panelController.animatePanelToPosition(0.0);
        initPaymentRequest();
        break;
      case GuestStage.success:
        // TODO: Handle this case.
        break;
      case GuestStage.loading:
        // TODO: Handle this case.
        break;
      case GuestStage.hasAccountAlready:
        // TODO: Handle this case.
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

    if (formattedGuestPhoneNumber.isEmpty) {
      guestStage.value = GuestStage.verifyPhone;
      return;
    }

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

    if (formattedGuestPhoneNumber.isEmpty) {
      guestStage.value = GuestStage.verifyPhone;
      return;
    } else if (guestUserOtpCode.isEmpty) {
      guestStage.value = GuestStage.verifyOtp;
      return;
    }

    guestStage.value = GuestStage.loading;

    webService?.signUpGuestUser(param, (resp) {
      if (resp.success) {
        guestStage.value = GuestStage.success;
        isGuestUser.value = false;
        prefUtils.saveGuestLoginDetails(resp, param);
        triggerPayment();
      } else {
        print("Status === ${resp.status}");
        //If user has an account on Prime already
        if (resp.status == 201) {
          guestStage.value = GuestStage.hasAccountAlready;
          guestUserOtpCode.value = "";
        } else {
          guestStage.value = GuestStage.verifyOtp;
          guestUserOtpCode.value = "";
          SnackBarApi.snackBarInfo(resp.error ?? "");
        }
      }
    });
  }

  void triggerPayment() {
    Utils.startTimer(10, () {
      panelController.animatePanelToPosition(0.0);
      initPaymentRequest();
    });
  }

  @override
  void initLoginRequest(
      {bool pinLogin = false,
      Function? call,
      bool back = true,
      String? telephone}) {
    panelController.animatePanelToPosition(0.0);
    super.initLoginRequest(
      pinLogin: true,
      back: false,
      telephone: formattedGuestPhoneNumber,
      call: () {
        Utils.startTimer(1, () {
          initPaymentRequest();
        });
      },
    );
  }
}
