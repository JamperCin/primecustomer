import 'dart:collection';
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/enum/guest_staging.dart';
import 'package:primecustomer/data/model/remote/PlaceSuggestion.dart';
import 'package:primecustomer/data/model/remote/account.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/category_model.dart';
import 'package:primecustomer/data/model/remote/country_model.dart';
import 'package:primecustomer/data/model/remote/customer.dart';
import 'package:primecustomer/data/model/remote/person.dart';
import 'package:primecustomer/data/model/remote/suggestion.dart';
import 'package:primecustomer/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils.dart';

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
    isLogin = preference.getBool(PrefConstants.IS_LOGIN) ?? false;

    ///Intro indicator
    isIntroShown = preference.getBool(PrefConstants.IS_INTRO_SHOWN) ?? false;

    ///Sign Up Verification Indicator
    needToVerify = preference.getBool(PrefConstants.NEED_VERIFICATION) ?? false;

    ///Show the Bio and Pin Login Indicator
    needBio = canUsePin();
    //preference.getString(PrefConstants.PHONE_NUMBER) != null && preference.getString(PrefConstants.PASSWORD) != null; //&&
    // preference.getString(PrefConstants.SECURITY_PIN) != null; //&&
    //isLogin;

    ///Get the profile picture
    profilePicURl.value = preference.getString(PrefConstants.PROFILE_PIC) ?? "";
    debugPrint(
        "IsLogin => $isLogin || IsIntroShown => $isIntroShown || NeedBIO => $needBio || needToVerify => $needToVerify");
  }

  void clearPreference() async {
    preference = await SharedPreferences.getInstance();
    String phone = getString(PrefConstants.PHONE_NUMBER);
    String password = getString(PrefConstants.PASSWORD);
    String token = getString(PrefConstants.TOKEN);
    String verifiedToken = getString(PrefConstants.VERIFIED_TOKEN);
    bool introShown = getBool(PrefConstants.IS_INTRO_SHOWN);
    bool isContactPermissionAccepted =
        getBool(PrefConstants.CONTACT_PERMISSION_ALLOWED);
    bool isImagePermissionAccepted =
        getBool(PrefConstants.IMAGE_PERMISSION_ALLOWED);
    bool isLocPermissionAccepted =
        getBool(PrefConstants.LOCATION_PERMISSION_ALLOWED);

    preference.clear();
    preference.setString(PrefConstants.PHONE_NUMBER, phone);
    preference.setString(PrefConstants.PASSWORD, password);
    preference.setString(PrefConstants.TOKEN, token);
    preference.setString(PrefConstants.VERIFIED_TOKEN, verifiedToken);
    preference.setBool(PrefConstants.IS_INTRO_SHOWN, introShown);

    notificationCounter.value = 0;
    profilePicURl.value = "";
    guestUserToken = "";
    preference.setBool(
        PrefConstants.CONTACT_PERMISSION_ALLOWED, isContactPermissionAccepted);
    preference.setBool(
        PrefConstants.IMAGE_PERMISSION_ALLOWED, isImagePermissionAccepted);
    preference.setBool(
        PrefConstants.LOCATION_PERMISSION_ALLOWED, isLocPermissionAccepted);
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
      bool introShown = getBool(PrefConstants.IS_INTRO_SHOWN);
      bool isContactPermissionAccepted =
          getBool(PrefConstants.CONTACT_PERMISSION_ALLOWED);
      bool isImagePermissionAccepted =
          getBool(PrefConstants.IMAGE_PERMISSION_ALLOWED);
      bool isLocPermissionAccepted =
          getBool(PrefConstants.LOCATION_PERMISSION_ALLOWED);

      prefUtils.preference.clear();

      //set them back
      preference.setBool(PrefConstants.IS_INTRO_SHOWN, introShown);
      preference.setBool(PrefConstants.CONTACT_PERMISSION_ALLOWED,
          isContactPermissionAccepted);
      preference.setBool(
          PrefConstants.IMAGE_PERMISSION_ALLOWED, isImagePermissionAccepted);
      preference.setBool(
          PrefConstants.LOCATION_PERMISSION_ALLOWED, isLocPermissionAccepted);

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
    preference.setBool(PrefConstants.IS_INTRO_SHOWN, true);
  }

  void changePhone() async {
    preference = await SharedPreferences.getInstance();
    bool introShown = getBool(PrefConstants.IS_INTRO_SHOWN);
    bool isContactPermissionAccepted =
        getBool(PrefConstants.CONTACT_PERMISSION_ALLOWED);
    bool isImagePermissionAccepted =
        getBool(PrefConstants.IMAGE_PERMISSION_ALLOWED);
    bool isLocPermissionAccepted =
        getBool(PrefConstants.LOCATION_PERMISSION_ALLOWED);

    prefUtils.preference.clear();
    notificationCounter.value = 0;
    isGuestUser.value = false;
    guestUserToken = "";
    profilePicURl.value = "";
    guestStage.value = GuestStage.init;
    prefUtils = await PrefUtils().getPref();
    preference.setBool(PrefConstants.IS_INTRO_SHOWN, true);
    //set them back
    preference.setBool(PrefConstants.IS_INTRO_SHOWN, introShown);
    preference.setBool(
        PrefConstants.CONTACT_PERMISSION_ALLOWED, isContactPermissionAccepted);
    preference.setBool(
        PrefConstants.IMAGE_PERMISSION_ALLOWED, isImagePermissionAccepted);
    preference.setBool(
        PrefConstants.LOCATION_PERMISSION_ALLOWED, isLocPermissionAccepted);
  }

  bool isDemoUser() {
    return getString(PrefConstants.PHONE_NUMBER) == Constants.DEMO_USER;
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
    preference.setBool(PrefConstants.IS_LOGIN, val);
  }

  void saveLoginDetails(BaseResponseModel response, HashMap params) async {
    preference = await SharedPreferences.getInstance();
    preference.setString(PrefConstants.TOKEN, response.data?.token ?? "");
    preference.setBool(PrefConstants.IS_LOGIN, true);
    if (params.containsKey(PrefConstants.PASSWORD)) {
      preference.setString(
          PrefConstants.PASSWORD, params[PrefConstants.PASSWORD]);
    }
    if (params.containsKey(PrefConstants.FOR_NAME)) {
      preference.setString(
          PrefConstants.PHONE_NUMBER, params[PrefConstants.FOR_NAME]);
    }
  }

  void saveGuestLoginDetails(BaseResponseModel response, HashMap params) {
    preference.setString(PrefConstants.TOKEN, response.data?.token ?? "");
    preference.setBool(PrefConstants.IS_LOGIN, true);
    preference.setString(PrefConstants.PHONE_NUMBER, params["telephone"]);
  }

  void saveProfileDetails(
      HashMap<String, String> param, BaseResponseModel resp) {
    if (param["first_name"].toString().isNotEmpty) {
      preference.setString(
          PrefConstants.FIRST_NAME, param["first_name"].toString());
    }

    if (param["surname"].toString().isNotEmpty) {
      preference.setString(
          PrefConstants.LAST_NAME, param["surname"].toString());
    }

    if (param["email"].toString().isNotEmpty) {
      preference.setString(PrefConstants.EMAIL, param["email"].toString());
    }

    if (param["profile_pic_url"].toString().isNotEmpty) {
      preference.setString(
          PrefConstants.PROFILE_PIC, param["profile_pic_url"].toString());
    }
  }

  void saveDetails(BaseResponseModel? response) async {
    preference = await SharedPreferences.getInstance();
    if (response == null ||
        response.data == null ||
        response.data?.userDetails == null ||
        response.data?.customer == null) {
      return;
    }

    if ((response.data?.userDetails.phoneNumber ?? "").isEmpty &&
        (response.data?.customer.phoneNumber ?? "").isEmpty) {
      return;
    }

    Customer? customer = (response.data?.userDetails.phoneNumber ?? "").isEmpty
        ? response.data?.customer
        : response.data?.userDetails;

    if (customer == null || customer.phoneNumber.isEmpty) return;

    preference.setString(PrefConstants.USER_DETAILS, jsonEncode(customer));

    preference.setString(PrefConstants.EMAIL, customer.email);

    preference.setString(PrefConstants.DATE_JOINED, customer.joinedSince);

    preference.setString(PrefConstants.PHONE_NUMBER, customer.phoneNumber);
    preference.setBool(PrefConstants.IS_USER_ACTIVE, customer.active);
    preference.setBool(PrefConstants.IS_USER_BLOCKED, customer.blocked);

    preference.setInt(PrefConstants.USER_ID, customer.id);

    preference.setString(
        PrefConstants.VERIFIED_TOKEN, customer.verificationToken);

    Person? person = customer.person;

    if (person != null) {
      preference.setInt(PrefConstants.PERSON_TYPE_ID, person.personTypeId);
      preference.setInt(PrefConstants.PERSON_ID, person.personId);

      preference.setString(PrefConstants.PERSON_TYPE, person.personType);

      preference.setString(PrefConstants.PROFILE_PIC, person.profilePicUrl);

      preference.setString(PrefConstants.FIRST_NAME, person.firstName);
      preference.setString(PrefConstants.LAST_NAME, person.surname);
      preference.setString(PrefConstants.FULL_NAME, person.fullName);
    }

    CountryModel? countryModel = person?.country;
    if (countryModel != null) {
      final country = jsonEncode(countryModel);
      preference.setString(PrefConstants.COUNTRY, country);
      debugPrint("SAVING COUNTRY == $country");
    }
  }

  CountryModel getCountry() {
    String? c = preference.getString(PrefConstants.COUNTRY);
    if (c != null && c.isNotEmpty) {
      var jsonResponse = jsonDecode(c);
      if (jsonResponse != null) {
        return CountryModel.fromJson(jsonResponse);
      }
    }
    return const CountryModel();
  }

  String getProfilePic() {
    return getString(PrefConstants.PROFILE_PIC);
  }

  Customer getCustomer() {
    String? c = preference.getString(PrefConstants.USER_DETAILS);
    if (c != null && c.isNotEmpty) {
      var jsonResponse = jsonDecode(c);
      if (jsonResponse != null) {
        return Customer.fromJson(jsonResponse);
      }
    }
    return const Customer();
  }

  Person getPerson() {
    return getCustomer().person ?? const Person();
  }

  String getFullName() {
    String firstName = getCustomer().person?.firstName ?? "";
    String lastName = getCustomer().person?.surname ?? "";

    return "$firstName $lastName";
  }

  bool canUsePin() {
    return (getPhoneNumber().isNotEmpty &&
            getString(PrefConstants.SECURITY_PIN).isNotEmpty) ||
        canLogin();
  }

  bool canLogin() {
    return getString(PrefConstants.PHONE_NUMBER).isNotEmpty &&
        getString(PrefConstants.PASSWORD).isNotEmpty;
  }

  String getPhoneNumber() {
    return getString(PrefConstants.PHONE_NUMBER);
  }

  bool isYou({String phone = ""}) {
    return phone.replaceAll("+", "").trim() ==
        getPhoneNumber().replaceAll("+", "").trim();
  }

  String getEmailAddress() {
    return getString(PrefConstants.EMAIL);
  }

  String getLocation() {
    return getString(PrefConstants.LOCATION);
  }

  String getDateJoined() {
    return getString(PrefConstants.DATE_JOINED);
  }

  void saveTokenForPin(String token) {
    preference.setString(PrefConstants.VERIFIED_TOKEN, token);
    preference.setBool(PrefConstants.NEED_VERIFICATION, false);
  }

  void saveSignUpDetails(
      HashMap<String, Object?> params, BaseResponseModel? response) async {
    if (response == null) return;

    preference = await SharedPreferences.getInstance();

    ///Indicate with a boolean that, signUp is done left with verifying phone Number
    preference.setBool(PrefConstants.NEED_VERIFICATION, true);

    if (params.containsKey(PrefConstants.COUNTRY)) {
      final country = jsonEncode(params[PrefConstants.COUNTRY]);
      preference.setString(PrefConstants.COUNTRY, country);
    }

    if (params.containsKey(PrefConstants.FULL_NAME)) {
      preference.setString(
        PrefConstants.FULL_NAME,
        params[PrefConstants.FULL_NAME] as String? ?? '',
      );
    }

    if (params.containsKey(PrefConstants.FIRST_NAME)) {
      preference.setString(
        PrefConstants.FIRST_NAME,
        params[PrefConstants.FIRST_NAME] as String? ?? '',
      );
    }
    if (params.containsKey(PrefConstants.LAST_NAME)) {
      preference.setString(
        PrefConstants.LAST_NAME,
        params[PrefConstants.LAST_NAME] as String? ?? '',
      );
    }

    if (params.containsKey(PrefConstants.PROFILE_PIC)) {
      preference.setString(
        PrefConstants.PROFILE_PIC,
        params[PrefConstants.PROFILE_PIC] as String? ?? '',
      );
    }

    if (params.containsKey(PrefConstants.PHONE_NUMBER)) {
      preference.setString(
        PrefConstants.PHONE_NUMBER,
        params[PrefConstants.PHONE_NUMBER] as String? ?? '',
      );
    }

    if (params.containsKey(PrefConstants.PASSWORD)) {
      preference.setString(
        PrefConstants.PASSWORD,
        params[PrefConstants.PASSWORD] as String? ?? '',
      );
    }
  }

  void savePrimeWalletDetails(Account? account) {
    if (account == null) return;

    preference.setDouble(
      PrefConstants.PRIME_WALLET_BALANCE,
      account.availableBalance,
    );

    preference.setString(
      PrefConstants.PRIME_WALLET_CURRENCY,
      account.currency,
    );

    preference.setInt(
      PrefConstants.PRIME_WALLET_ID,
      account.id,
    );
  }

  List<CategoryModel> getListOfMenu() {
    List<CategoryModel> list = [];
    String json = getString(PrefConstants.MENU_CAT_LIST);
    if (json.isEmpty) {
      return list;
    }

    var jsonResponse = jsonDecode(json);
    var menuCat = jsonResponse["data"]["categories"] as List<dynamic>;

    if (menuCat.isNotEmpty) {
      for (var val in menuCat) {
        list.add(CategoryModel.fromJson(val as Map<String, dynamic>));
      }
    }
    return list;
  }

  dynamic getSavedObject(String key) {
    String json = getString(key);
    if (json.isNotEmpty) {
      var jsonResponse = convert.jsonDecode(json);
      return jsonResponse;
    } else {
      return null;
    }
  }

  List<Suggestion> getPlaceSuggestions() {
    List<Suggestion> list = [];

    try {
      var jsonResponse = getSavedObject(PrefConstants.PLACES);
      if (jsonResponse != null) {
        var place = jsonResponse["suggestions"] as List<dynamic>;
        if (place.isNotEmpty) {
          list.clear();
          for (var val in place) {
            list.add(Suggestion.fromJson(val as Map<String, dynamic>));
          }
        }
      }
    } catch (e) {
      return list;
    }

    return list;
  }

  void savePlace(List<Suggestion> list) {
    String place = Utils.convertEncode(PlaceSuggestion(list));
    preference.setString(
      PrefConstants.PLACES,
      place,
    );
  }

  void saveSelectedLocation(Suggestion sug) {
    String place = Utils.convertEncode(sug);
    preference.setString(
      PrefConstants.SELECTED_LOCATION,
      place,
    );
  }

  Future<Suggestion> getSelectedLocation() async {
    try {
      var jsonResponse = getSavedObject(PrefConstants.SELECTED_LOCATION);
      if (jsonResponse != null) {
        Suggestion sug =
            Suggestion.fromJson(jsonResponse as Map<String, dynamic>);
        return sug;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return const Suggestion();
  }

  bool isWalletBalanceEnough({double amount = 0.0}) {
    return (preference.getDouble(PrefConstants.PRIME_WALLET_BALANCE) ?? 0.0) >=
        amount;
  }

  String getWalletBalance() {
    return "${getDouble(PrefConstants.PRIME_WALLET_BALANCE) ?? 0.0}";
  }

  int getWalletId() {
    return getInt(PrefConstants.PRIME_WALLET_ID);
  }

  String getDailyTips() {
    String tip =
        "Did you know Prime has got a lot of your favorite brands across the country? "
        "Check it out to get your gift cards for that special occasion or love one.";
    return getString(PrefConstants.DAILY_TIP).isEmpty
        ? tip
        : getString(PrefConstants.DAILY_TIP);
  }

  void saveDailyTips(String tip) {
    preference.setString(PrefConstants.DAILY_TIP, tip);
  }

  Suggestion getDefaultLocation() {
    List<Suggestion> list = getPlaceSuggestions();
    if (list.isNotEmpty) {
      return list.last;
    }

    return const Suggestion(
      address: "Cantonments, Accra, Ghana",
      latitude: 5.576765,
      longitude: -0.178483,
    );
  }
}
