import 'dart:collection';
import 'dart:io';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/api/notification_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_strings.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/app_config.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/auth/completeSignUp/verify_phone_screen.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/http/web_service.dart';
import '../../utils/Utils.dart';

class BaseController extends GetxController {
  String platformAccess = "pCdroid";
  RxInt _tokenExpirationCounter = 0.obs;
  bool _isTokenExpirationDialogShown = false;
  BuildContext? mContext;
  WebService? webService;
  InAppReview inAppReview = InAppReview.instance;
  static RxBool isSecurityQuestionsAdded = true.obs;

  void setContext(BuildContext context) {
    mContext = context;
    SizeConfig().init(context);
    webService = WebService(this);
  }

  void initSmsPlugin() async {
    await SmsAutoFill().listenForCode();
  }

  String getLastTwoDigits({String? phone, int? asterik}) {
    String phoneNumber = phone ?? prefUtils.getPhoneNumber();
    String digits = "";
    int length = asterik ?? phoneNumber.length;
    for (int i = 0; i < length; i++) {
      digits = digits + "*";
      if (asterik == null && i == length - 3) {
        break;
      }
    }
    String results = "";
    if (phoneNumber.isNotEmpty) {
      int start = phoneNumber.length - 2;
      int end = phoneNumber.length;
      results = phoneNumber.substring(start, end);
    }
    return digits + results;
  }

  void dismissKeyboard({BuildContext? context}) {
    FocusScope.of(context ?? mContext!).unfocus();
  }

  ///Automatically request user to rate your app on app store and playStore
  void autoRequestReview() async {
    if (!prefUtils.getBool(PrefConstants.IS_REVIEW_POP_SHOWN)) {
      inAppReview = InAppReview.instance;
      bool isReviewAvailable = await inAppReview.isAvailable();

      if (isReviewAvailable) {
        inAppReview.requestReview();
        prefUtils.setBool(PrefConstants.IS_REVIEW_POP_SHOWN, true);
      }
    }
  }

  ///Manually request user to rate your app on app store and playStore
  void manualRequestReview() {
    inAppReview = InAppReview.instance;
    inAppReview.openStoreListing(appStoreId: Constants.PRIME_APP_STORE_ID);
  }

  void getPlatformAccess() {
    if (kIsWeb) {
      platformAccess = "pCweb";
    } else {
      platformAccess = Platform.isAndroid ? "pCdroid" : "pCios";
    }
  }

  String getStoreName() {
    return Platform.isAndroid ? "Google Play Store" : "Apple Store";
  }

  String getToken() {
    String token = isGuestUser.value
        ? guestUserToken
        : "Bearer ${prefUtils.getString(PrefConstants.TOKEN)}";
    return token;
  }

  void _showSessionTimeOutDialog() {
    _isTokenExpirationDialogShown = true;
    UiApi.showConfirmDialog(
      imageAsset: "assets/images/ic_error.jpg",
      shouldDismissDialog: false,
      title: "Session Expired",
      message:
          "Your session has expired or this user is currently logged in on another device. Kindly logout.",
      buttonTitle: "Log Out",
      titleStyle: AppTextStyles.h3StyleRegular,
      messageStyle: AppTextStyles.smallSubDescStyleLight,
      color: AppColors.white,
      callBack: () {
        _tokenExpirationCounter = 0.obs;
        _isTokenExpirationDialogShown = false;
        prefUtils.setBool(PrefConstants.IS_LOGIN, false);
        NavApi.fireAction(EventAction.LOG_OUT);
      },
    );
  }

  ///Re-generate new Token and save to the shared preference
  ///Re-generate new Token and save to the shared preference
  void generateNewToken() {
    if (!prefUtils.getBool(PrefConstants.IS_LOGIN)) {
      debugPrint("Hasn't logged in");
      return;
    }

    _tokenExpirationCounter++;

    if (_tokenExpirationCounter.value >= 2 && !_isTokenExpirationDialogShown) {
      _showSessionTimeOutDialog();
    }
  }

  void printLog(String log) {
    Utils.printLog(log);
  }

  String getStringData(TextEditingController ctl) {
    return ctl.text.trim();
  }

  launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }

    /* final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'jampercola@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );

    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '233245007680',
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    );*/
  }

  void callContact(String? tel) {
    if (tel == null || tel.isEmpty) {
      SnackBarApi.snackBarInfo(
        "Sorry, this call cannot be placed. Telephone number not specified.",
      );
      return;
    }
    launchURL(Uri(scheme: 'tel', path: tel));
  }

  ///Handle the response form LOGIN and Navigate based
  ///-- If SUCCESS then save the login details and Open the main dashboard of Gift cards
  ///--If ERROR then check the error message if
  ///                                         -- User account needs verification
  ///                                         -- User credentials are wrong or blocked
  void onSuccessLogin(
    BaseResponseModel response,
    HashMap map, {
    String? error,
  }) {
    if (response.success) {
      isGuestUser.value = false;

      ///If this is a new user then clear everything on app
      prefUtils.checkUserAgainstCurrentUser(map);
      prefUtils.saveLoginDetails(response, map);
      NavApi.fireAction(EventAction.NAV_HOME);
    } else {
      if (AppString.USER_NOT_VERIFIED == response.error) {
        SnackBarApi.snackBarInfo(
          "Account has not been verified. Kindly complete the "
          "verification process to start using this account.",
        );
        Utils.startTimer(4, () {
          NavApi.fireTarget(
            VerifyPhoneScreen(),
            model: CardModel(phoneNumber: map["forname"] ?? ""),
          );
        });
      } else {
        SnackBarApi.snackBarInfo(
          error ?? response.error ?? "An error occurred",
        );
      }
    }
  }

  Future<void> sharePrime() async {
    //TODO await FlutterShare.share(
    //     title: 'Prime E-Gift',
    //     text: 'Buy a gift card to surprise a loved one using prime.',
    //     linkUrl: AppConfig.PRIME_APP_STORE_URL(),
    //     chooserTitle: 'Choose Platform');
  }

  void checkForAppUpdate() {
    webService?.checkAppUpdate((response) {
      if (response.data != null && response.data?.meta != null) {
        int versionCode = 0;
        String updateMessage =
            "New update available on app store.\n\nClick below to update your app for improved functionality.";
        bool forceUpdate = true;

        if (Platform.isAndroid) {
          versionCode = response.data?.meta.android.versionCode ?? 0;

          updateMessage = response.data?.meta.android.feature ?? updateMessage;

          forceUpdate = response.data?.meta.android.forceUpdate ?? forceUpdate;
        } else if (Platform.isIOS) {
          versionCode = response.data?.meta.ios.versionCode ?? 0;
          updateMessage = response.data?.meta.ios.feature ?? updateMessage;

          forceUpdate = response.data?.meta.ios.forceUpdate ?? forceUpdate;
        }

        checkIfUpdateNeeded(versionCode, updateMessage, forceUpdate);
      }
    });
  }

  checkIfUpdateNeeded(
    int updatedVersionCode,
    String updateMessage,
    bool forceUpdate,
  ) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int buildNumber = NumberUtils.parseInt(packageInfo.buildNumber);

    debugPrint("build number $buildNumber");

    if (updatedVersionCode > buildNumber) {
      //send notification
      NotificationApi.showNotification(
        title: "New Update Available.",
        body:
            "A new update is available for download. Kindly download to enjoy amazing features",
      );

      UiApi.showConfirmDialog(
        color: AppColors.white,
        containerSize: AppDimens.dimen600,
        imageAsset: "assets/images/ic_success_pin.png",
        title: "New Update Available.",
        message: updateMessage,
        buttonTitle: "Update Prime",
        shouldDismissDialog: !forceUpdate,
        callBack: () {
          manualRequestReview();
        },
      );
    }
  }
}
