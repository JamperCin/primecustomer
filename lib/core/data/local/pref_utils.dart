import 'dart:collection';
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:primecustomer/core/constants/app_constants.dart';
import 'package:primecustomer/core/constants/preference_constants.dart';
import 'package:primecustomer/core/def/global_access.dart';
import 'package:primecustomer/core/enums/guest_staging.dart';

class PrefUtils {
  late SharedPreferences preference;
  bool isLogin = false;
  bool isIntroShown = false;
  bool needToVerify = false;
  bool needBio = false;
  String verifiedToken = "";

  ///Initialise the SharedPreference at the main entry of the app
  PrefUtils init() {
    _checkLogin();
    return this;
  }

  Future<PrefUtils> getPref() async {
    preference = await SharedPreferences.getInstance();
    return this;
  }

  void _checkLogin() async {
    await getPref();

    ///Login indicator
    isLogin = preference.getBool(PreferenceConstants.IS_LOGIN) ?? false;

    ///Intro indicator
    isIntroShown =
        preference.getBool(PreferenceConstants.IS_INTRO_SHOWN) ?? false;

    ///Sign Up Verification Indicator
    needToVerify =
        preference.getBool(PreferenceConstants.NEED_VERIFICATION) ?? false;

    ///Show the Bio and Pin Login Indicator
    needBio = canUsePin();

    ///Get the profile picture
    profilePicURl.value =
        preference.getString(PreferenceConstants.PROFILE_PIC) ?? "";
    debugPrint(
      "IsLogin => $isLogin || IsIntroShown => $isIntroShown || NeedBIO => $needBio || needToVerify => $needToVerify",
    );
  }

  void clearPreference() async {
    preference = await SharedPreferences.getInstance();
    String phone = getString(PreferenceConstants.PHONE_NUMBER);
    String password = getString(PreferenceConstants.PASSWORD);
    String token = getString(PreferenceConstants.TOKEN);
    String verifiedToken = getString(PreferenceConstants.VERIFIED_TOKEN);
    bool introShown = getBool(PreferenceConstants.IS_INTRO_SHOWN);
    bool isContactPermissionAccepted = getBool(
      PreferenceConstants.CONTACT_PERMISSION_ALLOWED,
    );
    bool isImagePermissionAccepted = getBool(
      PreferenceConstants.IMAGE_PERMISSION_ALLOWED,
    );
    bool isLocPermissionAccepted = getBool(
      PreferenceConstants.LOCATION_PERMISSION_ALLOWED,
    );

    preference.clear();
    preference.setString(PreferenceConstants.PHONE_NUMBER, phone);
    preference.setString(PreferenceConstants.PASSWORD, password);
    preference.setString(PreferenceConstants.TOKEN, token);
    preference.setString(PreferenceConstants.VERIFIED_TOKEN, verifiedToken);
    preference.setBool(PreferenceConstants.IS_INTRO_SHOWN, introShown);

    notificationCounter.value = 0;
    profilePicURl.value = "";
    guestUserToken = "";
    preference.setBool(
      PreferenceConstants.CONTACT_PERMISSION_ALLOWED,
      isContactPermissionAccepted,
    );
    preference.setBool(
      PreferenceConstants.IMAGE_PERMISSION_ALLOWED,
      isImagePermissionAccepted,
    );
    preference.setBool(
      PreferenceConstants.LOCATION_PERMISSION_ALLOWED,
      isLocPermissionAccepted,
    );
    notificationCounter.value = 0;
    isGuestUser.value = false;
    guestUserToken = "";
    profilePicURl.value = "";
    guestStage.value = GuestStage.init;
    prefUtils = await PrefUtils().getPref();
  }

  void checkUserAgainstCurrentUser(HashMap map) async {
    preference = await SharedPreferences.getInstance();
    String phone = map.containsKey("forname") ? map["forname"] : "";
    if (phone != prefUtils.getPhoneNumber()) {
      bool introShown = getBool(PreferenceConstants.IS_INTRO_SHOWN);
      bool isContactPermissionAccepted = getBool(
        PreferenceConstants.CONTACT_PERMISSION_ALLOWED,
      );
      bool isImagePermissionAccepted = getBool(
        PreferenceConstants.IMAGE_PERMISSION_ALLOWED,
      );
      bool isLocPermissionAccepted = getBool(
        PreferenceConstants.LOCATION_PERMISSION_ALLOWED,
      );

      prefUtils.preference.clear();

      //set them back
      preference.setBool(PreferenceConstants.IS_INTRO_SHOWN, introShown);
      preference.setBool(
        PreferenceConstants.CONTACT_PERMISSION_ALLOWED,
        isContactPermissionAccepted,
      );
      preference.setBool(
        PreferenceConstants.IMAGE_PERMISSION_ALLOWED,
        isImagePermissionAccepted,
      );
      preference.setBool(
        PreferenceConstants.LOCATION_PERMISSION_ALLOWED,
        isLocPermissionAccepted,
      );

      notificationCounter.value = 0;
      isGuestUser.value = false;
      guestUserToken = "";
      profilePicURl.value = "";
      guestStage.value = GuestStage.init;
      prefUtils = await PrefUtils().getPref();
    }
  }

  void deleteAccount() async {
    preference = await SharedPreferences.getInstance();
    prefUtils.preference.clear();
    notificationCounter.value = 0;
    isGuestUser.value = false;
    guestUserToken = "";
    profilePicURl.value = "";
    guestStage.value = GuestStage.init;
    prefUtils = await PrefUtils().getPref();
    preference.setBool(PreferenceConstants.IS_INTRO_SHOWN, true);
  }

  void changePhone() async {
    preference = await SharedPreferences.getInstance();
    bool introShown = getBool(PreferenceConstants.IS_INTRO_SHOWN);
    bool isContactPermissionAccepted = getBool(
      PreferenceConstants.CONTACT_PERMISSION_ALLOWED,
    );
    bool isImagePermissionAccepted = getBool(
      PreferenceConstants.IMAGE_PERMISSION_ALLOWED,
    );
    bool isLocPermissionAccepted = getBool(
      PreferenceConstants.LOCATION_PERMISSION_ALLOWED,
    );

    prefUtils.preference.clear();
    notificationCounter.value = 0;
    isGuestUser.value = false;
    guestUserToken = "";
    profilePicURl.value = "";
    guestStage.value = GuestStage.init;
    prefUtils = await PrefUtils().getPref();
    preference.setBool(PreferenceConstants.IS_INTRO_SHOWN, true);
    //set them back
    preference.setBool(PreferenceConstants.IS_INTRO_SHOWN, introShown);
    preference.setBool(
      PreferenceConstants.CONTACT_PERMISSION_ALLOWED,
      isContactPermissionAccepted,
    );
    preference.setBool(
      PreferenceConstants.IMAGE_PERMISSION_ALLOWED,
      isImagePermissionAccepted,
    );
    preference.setBool(
      PreferenceConstants.LOCATION_PERMISSION_ALLOWED,
      isLocPermissionAccepted,
    );
  }

  bool isDemoUser() {
    return getString(PreferenceConstants.PHONE_NUMBER) ==
        AppConstants.DEMO_USER;
  }

  void setBool(String key, bool value) {
    preference.setBool(key, value);
  }

  void setString(String key, String value) {
    preference.setString(key, value);
  }

  bool getBool(String key) {
    return preference.getBool(key) ?? false;
  }

  String getString(String key) {
    return preference.getString(key) ?? "";
  }

  double getDouble(String key) {
    return preference.getDouble(key) ?? 0.00;
  }

  int getInt(String key) {
    return preference.getInt(key) ?? 0;
  }

  void setLogin(bool val) {
    preference.setBool(PreferenceConstants.IS_LOGIN, val);
  }

  void saveLoginDetails(BaseResponseModel response, HashMap params) async {
    preference = await SharedPreferences.getInstance();
    preference.setString(
      PreferenceConstants.TOKEN,
      response.data?["token"] ?? "",
    );
    preference.setBool(PreferenceConstants.IS_LOGIN, true);
    if (params.containsKey(PreferenceConstants.PASSWORD)) {
      preference.setString(
        PreferenceConstants.PASSWORD,
        params[PreferenceConstants.PASSWORD],
      );
    }
    if (params.containsKey(PreferenceConstants.FOR_NAME)) {
      preference.setString(
        PreferenceConstants.PHONE_NUMBER,
        params[PreferenceConstants.FOR_NAME],
      );
    }
  }

  void saveGuestLoginDetails(BaseResponseModel response, HashMap params) {
    preference.setString(
      PreferenceConstants.TOKEN,
      response.data?["token"] ?? "",
    );
    preference.setBool(PreferenceConstants.IS_LOGIN, true);
    preference.setString(PreferenceConstants.PHONE_NUMBER, params["telephone"]);
  }

  void saveProfileDetails(
    HashMap<String, String> param,
    BaseResponseModel resp,
  ) {
    if (param["first_name"].toString().isNotEmpty) {
      preference.setString(
        PreferenceConstants.FIRST_NAME,
        param["first_name"].toString(),
      );
    }

    if (param["surname"].toString().isNotEmpty) {
      preference.setString(
        PreferenceConstants.LAST_NAME,
        param["surname"].toString(),
      );
    }

    if (param["email"].toString().isNotEmpty) {
      preference.setString(
        PreferenceConstants.EMAIL,
        param["email"].toString(),
      );
    }

    if (param["profile_pic_url"].toString().isNotEmpty) {
      preference.setString(
        PreferenceConstants.PROFILE_PIC,
        param["profile_pic_url"].toString(),
      );
    }
  }

  void saveDetails(BaseResponseModel? response) async {
    preference = await SharedPreferences.getInstance();
    // if (response == null ||
    //     response.data == null ||
    //     response.data?.userDetails == null ||
    //     response.data?.customer == null) {
    //   return;
    // }

    // if ((response.data?.userDetails.phoneNumber ?? "").isEmpty &&
    //     (response.data?.customer.phoneNumber ?? "").isEmpty) {
    //   return;
    // }

    // Customer? customer = (response.data?.userDetails.phoneNumber ?? "").isEmpty
    //     ? response.data?.customer
    //     : response.data?.userDetails;

    // if (customer == null || customer.phoneNumber.isEmpty) return;

    // preference.setString(PreferenceConstants.USER_DETAILS, jsonEncode(customer));

    // preference.setString(PreferenceConstants.EMAIL, customer.email);

    // preference.setString(PreferenceConstants.DATE_JOINED, customer.joinedSince);

    // preference.setString(PreferenceConstants.PHONE_NUMBER, customer.phoneNumber);
    // preference.setBool(PreferenceConstants.IS_USER_ACTIVE, customer.active);
    // preference.setBool(PreferenceConstants.IS_USER_BLOCKED, customer.blocked);

    // preference.setInt(PreferenceConstants.USER_ID, customer.id);

    // preference.setString(
    //     PreferenceConstants.VERIFIED_TOKEN, customer.verificationToken);

    // Person? person = customer.person;

    // if (person != null) {
    //   preference.setInt(PreferenceConstants.PERSON_TYPE_ID, person.personTypeId);
    //   preference.setInt(PreferenceConstants.PERSON_ID, person.personId);

    //   preference.setString(PreferenceConstants.PERSON_TYPE, person.personType);

    //   preference.setString(PreferenceConstants.PROFILE_PIC, person.profilePicUrl);

    //   preference.setString(PreferenceConstants.FIRST_NAME, person.firstName);
    //   preference.setString(PreferenceConstants.LAST_NAME, person.surname);
    //   preference.setString(PreferenceConstants.FULL_NAME, person.fullName);
    // }

    // CountryModel? countryModel = person?.country;
    // if (countryModel != null) {
    //   final country = jsonEncode(countryModel);
    //   preference.setString(PreferenceConstants.COUNTRY, country);
    //   debugPrint("SAVING COUNTRY == $country");
    // }
  }

  CountryModel getCountry() {
    String? c = preference.getString(PreferenceConstants.COUNTRY);
    if (c != null && c.isNotEmpty) {
      var jsonResponse = jsonDecode(c);
      if (jsonResponse != null) {
        return CountryModel.fromJson(jsonResponse);
      }
    }
    return const CountryModel();
  }

  String getProfilePic() {
    return getString(PreferenceConstants.PROFILE_PIC);
  }

  // Customer getCustomer() {
  //   String? c = preference.getString(PreferenceConstants.USER_DETAILS);
  //   if (c != null && c.isNotEmpty) {
  //     var jsonResponse = jsonDecode(c);
  //     if (jsonResponse != null) {
  //       return Customer.fromJson(jsonResponse);
  //     }
  //   }
  //   return const Customer();
  // }

  // Person getPerson() {
  //   return getCustomer().person ?? const Person();
  // }

  // String getFullName() {
  //   String firstName = getCustomer().person?.firstName ?? "";
  //   String lastName = getCustomer().person?.surname ?? "";

  //   return "$firstName $lastName";
  // }

  bool canUsePin() {
    return (getPhoneNumber().isNotEmpty &&
            getString(PreferenceConstants.SECURITY_PIN).isNotEmpty) ||
        canLogin();
  }

  bool canLogin() {
    return getString(PreferenceConstants.PHONE_NUMBER).isNotEmpty &&
        getString(PreferenceConstants.PASSWORD).isNotEmpty;
  }

  String getPhoneNumber() {
    return getString(PreferenceConstants.PHONE_NUMBER);
  }

  bool isYou({String phone = ""}) {
    return phone.replaceAll("+", "").trim() ==
        getPhoneNumber().replaceAll("+", "").trim();
  }

  String getEmailAddress() {
    return getString(PreferenceConstants.EMAIL);
  }

  String getLocation() {
    return getString(PreferenceConstants.LOCATION);
  }

  String getDateJoined() {
    return getString(PreferenceConstants.DATE_JOINED);
  }

  void saveTokenForPin(String token) {
    preference.setString(PreferenceConstants.VERIFIED_TOKEN, token);
    preference.setBool(PreferenceConstants.NEED_VERIFICATION, false);
  }

  void saveSignUpDetails(
    HashMap<String, Object?> params,
    BaseResponseModel? response,
  ) async {
    if (response == null) return;

    preference = await SharedPreferences.getInstance();

    ///Indicate with a boolean that, signUp is done left with verifying phone Number
    preference.setBool(PreferenceConstants.NEED_VERIFICATION, true);

    if (params.containsKey(PreferenceConstants.COUNTRY)) {
      final country = jsonEncode(params[PreferenceConstants.COUNTRY]);
      preference.setString(PreferenceConstants.COUNTRY, country);
    }

    if (params.containsKey(PreferenceConstants.FULL_NAME)) {
      preference.setString(
        PreferenceConstants.FULL_NAME,
        params[PreferenceConstants.FULL_NAME] as String? ?? '',
      );
    }

    if (params.containsKey(PreferenceConstants.FIRST_NAME)) {
      preference.setString(
        PreferenceConstants.FIRST_NAME,
        params[PreferenceConstants.FIRST_NAME] as String? ?? '',
      );
    }
    if (params.containsKey(PreferenceConstants.LAST_NAME)) {
      preference.setString(
        PreferenceConstants.LAST_NAME,
        params[PreferenceConstants.LAST_NAME] as String? ?? '',
      );
    }

    if (params.containsKey(PreferenceConstants.PROFILE_PIC)) {
      preference.setString(
        PreferenceConstants.PROFILE_PIC,
        params[PreferenceConstants.PROFILE_PIC] as String? ?? '',
      );
    }

    if (params.containsKey(PreferenceConstants.PHONE_NUMBER)) {
      preference.setString(
        PreferenceConstants.PHONE_NUMBER,
        params[PreferenceConstants.PHONE_NUMBER] as String? ?? '',
      );
    }

    if (params.containsKey(PreferenceConstants.PASSWORD)) {
      preference.setString(
        PreferenceConstants.PASSWORD,
        params[PreferenceConstants.PASSWORD] as String? ?? '',
      );
    }
  }

  // void savePrimeWalletDetails(Account? account) {
  //   if (account == null) return;

  //   preference.setDouble(
  //     PreferenceConstants.PRIME_WALLET_BALANCE,
  //     account.availableBalance,
  //   );

  //   preference.setString(
  //     PreferenceConstants.PRIME_WALLET_CURRENCY,
  //     account.currency,
  //   );

  //   preference.setInt(
  //     PreferenceConstants.PRIME_WALLET_ID,
  //     account.id,
  //   );
  // }

  // List<CategoryModel> getListOfMenu() {
  //   List<CategoryModel> list = [];
  //   String json = getString(PreferenceConstants.MENU_CAT_LIST);
  //   if (json.isEmpty) {
  //     return list;
  //   }

  //   var jsonResponse = jsonDecode(json);
  //   var menuCat = jsonResponse["data"]["categories"] as List<dynamic>;

  //   if (menuCat.isNotEmpty) {
  //     for (var val in menuCat) {
  //       list.add(CategoryModel.fromJson(val as Map<String, dynamic>));
  //     }
  //   }
  //   return list;
  // }

  dynamic getSavedObject(String key) {
    String json = getString(key);
    if (json.isNotEmpty) {
      var jsonResponse = convert.jsonDecode(json);
      return jsonResponse;
    } else {
      return null;
    }
  }

  // List<Suggestion> getPlaceSuggestions() {
  //   List<Suggestion> list = [];

  //   try {
  //     var jsonResponse = getSavedObject(PreferenceConstants.PLACES);
  //     if (jsonResponse != null) {
  //       var place = jsonResponse["suggestions"] as List<dynamic>;
  //       if (place.isNotEmpty) {
  //         list.clear();
  //         for (var val in place) {
  //           list.add(Suggestion.fromJson(val as Map<String, dynamic>));
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     return list;
  //   }

  //   return list;
  // }

  // void savePlace(List<Suggestion> list) {
  //   String place = Utils.convertEncode(PlaceSuggestion(list));
  //   preference.setString(
  //     PreferenceConstants.PLACES,
  //     place,
  //   );
  // }

  // void saveSelectedLocation(Suggestion sug) {
  //   String place = Utils.convertEncode(sug);
  //   preference.setString(
  //     PreferenceConstants.SELECTED_LOCATION,
  //     place,
  //   );
  // }

  // Future<Suggestion> getSelectedLocation() async {
  //   try {
  //     var jsonResponse = getSavedObject(PreferenceConstants.SELECTED_LOCATION);
  //     if (jsonResponse != null) {
  //       Suggestion sug =
  //           Suggestion.fromJson(jsonResponse as Map<String, dynamic>);
  //       return sug;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return const Suggestion();
  // }

  bool isWalletBalanceEnough({double amount = 0.0}) {
    return (preference.getDouble(PreferenceConstants.PRIME_WALLET_BALANCE) ??
            0.0) >=
        amount;
  }

  String getWalletBalance() {
    return "${getDouble(PreferenceConstants.PRIME_WALLET_BALANCE) ?? 0.0}";
  }

  int getWalletId() {
    return getInt(PreferenceConstants.PRIME_WALLET_ID);
  }

  String getDailyTips() {
    String tip =
        "Did you know Prime has got a lot of your favorite brands across the country? "
        "Check it out to get your gift cards for that special occasion or love one.";
    return getString(PreferenceConstants.DAILY_TIP).isEmpty
        ? tip
        : getString(PreferenceConstants.DAILY_TIP);
  }

  void saveDailyTips(String tip) {
    preference.setString(PreferenceConstants.DAILY_TIP, tip);
  }

  // Suggestion getDefaultLocation() {
  //   List<Suggestion> list = getPlaceSuggestions();
  //   if (list.isNotEmpty) {
  //     return list.last;
  //   }

  //   return const Suggestion(
  //     address: "Cantonments, Accra, Ghana",
  //     latitude: 5.576765,
  //     longitude: -0.178483,
  //   );
  // }
}
