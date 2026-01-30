import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/enum/filter_type.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/http/api_interface.dart';
import 'package:primecustomer/data/model/local/RouteModel.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/config/app_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import 'http_helper.dart';

class WebService extends ApiInterface {
  //! Please remove this alert if this Get usage is valid (I haven't used `Get` before)
  late HttpHelper helper;

  WebService(BaseController controller) {
    helper = HttpHelper(controller);
  }

  ///========================== G E N E R I C   A P I   C A L L S    H E R E ========================

  Future<void> apiCallGet({
    Function(BaseResponseModel)? callback,
    Function(List<dynamic>)? listCallBack,
    String key = 'users',
    bool forceCallback = false,
    HashMap<String, Object>? param,
    int page = 0,
    int limit = 20,
    String url = '',
    bool showProgressBar = false,
    bool showSnackWhen401 = false,
    bool shouldShowSnackBar = false,
    bool shouldPrint = false,
  }) async {
    if (page > 0) {
      param = param ?? HashMap();
      param.putIfAbsent("page", () => "$page");
      param.putIfAbsent("limit", () => "$limit");
    }

    var response =
        await helper.getClient(showProgressBar: showProgressBar).getClientGET(
              url,
              headers: helper.getTokenHeaders(),
              params: param,
            );

    if (listCallBack != null) {
      List<dynamic> data = helper.serializeRes(response.body, key: key);
      listCallBack(data);
      return;
    }

    helper.serializeResponse(
      response,
      callback,
      shouldPrint: shouldPrint,
      showSnackWhen401: showSnackWhen401,
      shouldShowSnackBar: shouldShowSnackBar,
      forceCallBack: forceCallback
          ? (isSuccess, error) {
              if (!isSuccess) {
                BaseResponseModel res =
                    BaseResponseModel(success: false, error: error);
                if (callback != null) callback(res);
              }
            }
          : null,
    );
  }

  Future<void> apiCallPost({
    required Function(BaseResponseModel) callback,
    HashMap<String, Object>? param,
    int page = 0,
    String url = '',
    bool forceCallback = false,
    bool showProgressBar = false,
    bool showSnackWhen401 = false,
    bool shouldShowSnackBar = true,
    bool shouldPrint = false,
  }) async {
    if (page > 0) {
      param = param ?? HashMap();
      param.putIfAbsent("page", () => "$page");
      param.putIfAbsent("limit", () => "20");
    }

    var response =
        await helper.getClient(showProgressBar: showProgressBar).post(
              helper.buildUrl(url),
              headers: helper.getTokenHeaders(),
              body: jsonEncode(param),
            );

    helper.serializeResponse(
      response,
      callback,
      shouldPrint: shouldPrint,
      showSnackWhen401: showSnackWhen401,
      shouldShowSnackBar: shouldShowSnackBar,
      forceCallBack: forceCallback
          ? (isSuccess, error) {
              if (!isSuccess) {
                BaseResponseModel res =
                    BaseResponseModel(success: false, error: error);
                callback(res);
              }
            }
          : null,
    );
  }

  Future<void> apiCallPut({
    required Function(BaseResponseModel) callback,
    HashMap<String, Object>? param,
    int page = 0,
    String url = '',
    bool forceCallback = false,
    bool showProgressBar = false,
    bool showSnackWhen401 = false,
    bool shouldShowSnackBar = true,
    bool shouldPrint = false,
  }) async {
    if (page > 0) {
      param = param ?? HashMap();
      param.putIfAbsent("page", () => "$page");
      param.putIfAbsent("limit", () => "20");
    }

    var response = await helper.getClient(showProgressBar: showProgressBar).put(
          helper.buildUrl(url),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );

    helper.serializeResponse(
      response,
      callback,
      shouldPrint: shouldPrint,
      showSnackWhen401: showSnackWhen401,
      shouldShowSnackBar: shouldShowSnackBar,
      forceCallBack: forceCallback
          ? (isSuccess, error) {
              if (!isSuccess) {
                BaseResponseModel res =
                    BaseResponseModel(success: false, error: error);
                callback(res);
              }
            }
          : null,
    );
  }

  ///========================== G E N E R I C   A P I   C A L L S    H E R E ========================

  ///{{dev_base_url}}/prime.sika/v1/users/customer/login
  ///New Login api to allow one to use same phone number
  @override
  Future<void> login(
    HashMap<String, Object> params,
    Function(BaseResponseModel) callback, {
    String errorMess = "Wrong phone number or password entered.",
    bool forceBack = true,
    bool showProgressBar = true,
  }) async {
    var response = await helper
        .getClient(showProgressBar: showProgressBar)
        .post(helper.buildUrl("prime.sika/v1/users/login?"),
            body: jsonEncode(params), headers: helper.getHeaders());
    helper.serializeResponse(response, callback,
        showSnackWhen401: false,
        shouldShowSnackBar: false,shouldPrint: true,
        errorMessage: errorMess, forceCallBack: (success, error) {
      if (forceBack && !success) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> guestUserLogin(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/customers/guest-signup?"),
          body: jsonEncode(params),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback,
        showSnackWhen401: false,
        shouldShowSnackBar: false, forceCallBack: (success, error) {
      if (!success) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> signUpCustomer(HashMap<String, Object> params,
      Function(BaseResponseModel)? callBack) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/customers/signup?"),
          body: jsonEncode(params),
          headers: helper.getHeaders(),
        );

    helper.serializeResponse(response, callBack);
  }

  @override
  Future<void> verifySecurityPin(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/users/verify-pin?"),
          body: jsonEncode(params),
          headers: helper.getTokenHeaders(),
        );

    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: true,
      errorMessage: "Invalid Passcode/Pin entered",
    );
  }

  @override
  Future<void> updateProfileDetails(HashMap<String, Object> params,
      Function(BaseResponseModel) callBack) async {
    var response = await helper.getClient().put(
        helper.buildUrl("prime.sika/v1/customers/profile?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());

    helper.serializeResponse(response, callBack);
  }

  @override
  Future<void> verifyCode(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    String verificationCode = params["code"] as String? ?? '';
    params.remove("code");
    var response = await helper.getClient().post(
          helper.buildUrl(
              "prime.sika/v1/users/customer/$verificationCode/verify?"),
          body: jsonEncode(params),
          headers: helper.getHeaders(),
        );

    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> verifyWalletCode(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl(
              "prime.sika/v1/wallets/customer/${params["wallet_id"]}/verify?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );

    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> resendVerificationsCode(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/users/customer/resend-verification?"),
        body: jsonEncode(params),
        headers: helper.getHeaders());

    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> resetPassword(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/users/reset-password?"),
        body: jsonEncode(params),
        headers: helper.getHeaders());

    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> resendWalletVerificationsCode(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl(
            "prime.sika/v1/wallets/customer/${params["wallet_id"]}/send-verification-code?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());

    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> signOut(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/users/logout?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());

    helper.serializeResponse(response, callback, showSnackWhen401: true,
        forceCallBack: (success, mess) {
      if (!success) {
        callback(BaseResponseModel(success: false, error: mess));
      }
    });
  }

  @override
  Future<void> setSecurityPin(
      HashMap<String, Object> params, Function(BaseResponseModel) callback,
      {String api = "prime.sika/v1/users/customer/verified-secret?"}) async {
    var response = await helper.getClient().post(helper.buildUrl(api),
        body: jsonEncode(params), headers: helper.getHeaders());
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getUserDetails(Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).get(
        helper.buildUrl("prime.sika/v1/users/customer/details?"),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback, shouldShowSnackBar: false);
  }

  @override
  Future<void> getMenuCategories(Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).get(
        helper.buildUrl("prime.sika/v1/cards/categories?"),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback, shouldShowSnackBar: false);
  }

  @override
  Future<void> checkoutToCart(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/cards/checkout?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getPaymentAccounts(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().get(
        helper.buildUrl("prime.sika/v1/payment/accounts?"),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> makePaymentOfCard(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/payments/customer?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback, shouldShowSnackBar: false,shouldPrint: true,
        forceCallBack: (isSuccess, error) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> getListOfCards(
      Map<String, Object> params, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).getClientGET(
          "prime.sika/v1/published-cards/list",
          params: params,
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getPublishedCardsOnePerMerchant(
      Map<String, Object> params, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).getClientGET(
          "prime.sika/v1/published-cards/one-per-merchant",
          params: params,
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<List<PrimeCardModel>> searchCardsAndMerchant(String filter) async {
    Map<String, Object> params = {};
    params.putIfAbsent("search_string", () => filter);

    var response = await helper.getClient(showProgressBar: false).getClientGET(
          "prime.sika/v1/published-cards/one-per-merchant",
          params: params,
          headers: helper.getTokenHeaders(),
        );

    return helper.serializeCardResponse(
      response,
      shouldShowSnackBar: false,
      showSnackWhen401: false,
    );
  }

  @override
  Future<void> filterPublishCards(
      Map<String, Object> params, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().getClientGET(
          "prime.sika/v1/published-cards/list",
          params: params,
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getListOfPromotionalCards(
      Map<String, dynamic> params, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().get(
          helper.buildUrl(
              "prime.sika/v1/published-cards/list?promotions_only=true"),
          headers: helper.getTokenHeaders(),
          // params: params,
        );
    helper.serializeResponse(
      response,
      callback,
    );
  }

  @override
  Future<void> addCardsToCart(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/carts/customer/create?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response,shouldPrint: true, callback);
  }

  @override
  Future<void> addCardsToFavorite(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).post(
        helper.buildUrl("prime.sika/v1/customers/favourite-card?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback, shouldShowSnackBar: false);
  }

  @override
  Future<void> getFavoriteCards(
      Map<String, Object> params, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).getClientGET(
        "prime.sika/v1/cards/customer/favourite-list?",
        headers: helper.getTokenHeaders(),
        params: params);
    helper.serializeResponse(response, callback, shouldShowSnackBar: false);
  }

  @override
  Future<void> getFavoriteMerchants(
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().get(
        helper.buildUrl("prime.sika/v1/customers/favourite-list?"),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback, shouldShowSnackBar: false);
  }

  @override
  Future<void> getCardsInCart(Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).get(
        helper.buildUrl("prime.sika/v1/carts/customer/current-cart?"),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response,shouldPrint: true, callback);
  }

  @override
  Future<void> removeItemFromCart(
      int cardId, int cartId, Function(BaseResponseModel) callback) async {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("cart_id", () => "$cartId");

    var response = await helper.getClient().put(
          helper.buildUrl("prime.sika/v1/carts/customer/remove/$cardId?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback, shouldShowSnackBar: false,
        forceCallBack: (isSuccess, error) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> clearCart(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/carts/customer/clear?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    // helper.serializeResponse(response, callback);
    helper.serializeResponse(response, callback,
        shouldShowSnackBar: false,
        showSnackWhen401: false, forceCallBack: (isSuccess, error) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> addPaymentAccount(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/wallets/customer/create?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());

    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getListOfPaymentsWallets(
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().get(
        helper.buildUrl("prime.sika/v1/wallets/customer/list?"),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getWalletTypes(Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().get(
        helper.buildUrl("prime.sika/v1/wallets/customer/list-types?"),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> sendFeedback(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/customers/collect-feedback?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> sendFcmToken(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).post(
          helper.buildUrl("prime.sika/v1/fcms?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback, shouldShowSnackBar: false);
  }

  @override
  Future<void> verifyUserPhone(
      String userId, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).getClientGET(
          "prime.sika/v1/users/verify-id",
          headers: helper.getHeaders(),
          params: helper.params("user_id", userId),
        );
    helper.serializeResponse(response, callback,
        shouldShowSnackBar: false,
        showSnackWhen401: false, forceCallBack: (isSuccess, error) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> getUsersSavedQuestions(
    int userId,
    Function(BaseResponseModel) callback,
  ) async {
    var response = await helper.getClient(showProgressBar: false).getClientGET(
          "prime.sika/v1/questions/user-list",
          headers: helper.getHeaders(),
          params: helper.params("user_id", userId),
        );
    helper.serializeResponse(response, callback,
        shouldShowSnackBar: false,
        showSnackWhen401: false, forceCallBack: (isSuccess, error) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> setNewPassword(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/users/reset-password?"),
          headers: helper.getHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getSecurityQuestions(
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).get(
          helper.buildUrl("prime.sika/v1/questions/customer/list?"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback);
  }

  /* @override
  Future<void> getMyCardsBought(
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().get(
          helper.buildUrl("prime.sika/v1/payments/customer/list?"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback);
  }*/

  ///{{dev_base_url}}/prime.sika/v1/accounts/customer/bought-cards/list?
  ///account_to[]=SELF&account_to[]=OTHERS&account_to[]=EFUND&statuses[]=UNUSED&
  ///statuses[]=PARTIALY_USED&statuses[]=REDEEMED&statuses[]=CASHED_OUT&page=1&limit=5&from=01/01/2001&to=31/12/2021&test_exempt=
  @override
  Future<void> getBoughtCards(Map<String, Object> params, WalletType type,
      bool showProgress, Function(BaseResponseModel) callback) async {
    String url = '';
    switch (type) {
      case WalletType.PURCHASED:
        url = "prime.sika/v1/accounts/customer/bought-cards/list";
        break;
      case WalletType.GIFTED_OUT:
        url = "prime.sika/v1/accounts/customer/gifted-cards/list";
        break;
      case WalletType.GIFTED_IN:
        url = "prime.sika/v1/accounts/customer/gifted-cards/list";
        break;
      case WalletType.E_FUND:
        // url = "prime.sika/v1/customers/efund-requests?";
        url = "prime.sika/v1/customers/efund-requests/groups";
        break;
    }
    var response =
        await helper.getClient(showProgressBar: showProgress).getClientGET(
              url,
              headers: helper.getTokenHeaders(),
              params: params,
            );
    helper.serializeResponse(response, callback, shouldPrint: true);
  }

  @override
  Future<void> setNewSecurityQuestions(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/questions/customer/answer-question?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> verifyAnswerToQuestion(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/questions/verify-answer?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback, shouldShowSnackBar: false,
        forceCallBack: (isSuccess, mess) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: mess);
        callback(res);
      }
    });
  }

  @override
  Future<void> deletePaymentWallet(
      int walletId, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().delete(
          helper.buildUrl("prime.sika/v1/wallets/customer/$walletId?"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getAdverts(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).getClientGET(
          "prime.sika/v1/customers/marketing/images",
          headers: helper.getTokenHeaders(),
          params: params,
        );
    helper.serializeResponse(
      response,
      callback,
      shouldShowSnackBar: false,
    );
  }

  @override
  Future<void> redeemCard(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: true).post(
          helper.buildUrl("prime.sika/v1/accounts/customer/redeem?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback,
        shouldShowSnackBar: false,
        shouldPrint: true, forceCallBack: (isSuccess, mess) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: mess);
        callback(res);
      }
    });
  }

  @override
  Future<void> reGiftCard(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/accounts/customer/re-gift?"),
        headers: helper.getTokenHeaders(),
        body: jsonEncode(params));
    helper.serializeResponse(response, callback, shouldPrint: true);
  }

  @override
  Future<void> getGiftedCard(
      Map<String, Object> params, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().getClientGET(
          "prime.sika/v1/accounts/customer/gifted-cards/list",
          headers: helper.getTokenHeaders(),
          params: params,
        );
    helper.serializeResponse(
      response,
      callback,
    );
  }

  @override
  Future<void> fundPrimeWallet(
      int id, Function(BaseResponseModel) callback) async {
    HashMap<String, String> param = HashMap();
    param.putIfAbsent("account_id", () => "$id");
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/accounts/customer/cash-out?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );
    helper.serializeResponse(response, callback, shouldPrint: true);
  }

  @override
  Future<void> uploadFile(
      File file, Function(BaseResponseModel) callback) async {
    var request =
        MultipartRequest("POST", helper.buildUrl("prime.sika/v1/upload-file?"));
    request.headers.addAll(helper.getMultiPartTokenHeaders());
    String fileName = "prime_customer${DateTime.now().millisecond}_img.jpg";
    request.files.add(
      MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: fileName,
        contentType: MediaType('image', 'jpg'),
      ),
    );
    helper.printLogs(request.url,
        requestType: "POST", headers: helper.getMultiPartTokenHeaders());

    request.send().then((response) async {
      final respStr = await response.stream.bytesToString();
      helper.serializeAwsResponse(respStr, callback,
          showSnackWhen401: true,
          shouldPrint: true, forceCallBack: (success, error) {
        callback(BaseResponseModel(success: success, error: error));
      });
    });
  }

  ///SAMPLE META FOR APP UPDATE
  ///   {
  ///             "ios": {
  ///                 "feature": "Improved performance and fixed various bugs.\n\nEnhanced the UI design for easy usage with the following added features:\n\n- Fixed cart not loading.\n- Added update profile\n- Added feature to gift cards with messages and date\n- Added easy login with PIN or Touch ID/Face ID\n- Remoulded cards ui for better experience\n- Resolved filters on cards and promotional cards",
  ///                 "forceUpdate": true,
  ///                 "versionCode": 7
  ///             },
  ///             "android": {
  ///                 "feature": "Improved performance and fixed various bugs.\n\nEnhanced the UI design for easy usage with the following added features:\n\n- Fixed cart not loading.\n- Added update profile\n- Added feature to gift cards with messages and date\n- Added easy login with PIN or Touch ID/Face ID\n- Remoulded cards ui for better experience\n- Resolved filters on cards and promotional cards",
  ///                 "forceUpdate": true,
  ///                 "versionCode": 5
  ///             },
  ///             "prime_pay":{
  ///                 "feature": "Improved performance and fixed various bugs.\n\nEnhanced the UI design for easy usage with the following added features:\n\n- Fixed card details not loading.",
  ///                 "forceUpdate": true,
  ///                 "versionCode": 7
  ///             }
  ///    }
  @override
  Future<void> checkAppUpdate(Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).get(
          helper.buildUrl("prime.sika/v1/mobile-app-version-meta?"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: false,
      shouldShowSnackBar: false,
    );
  }

  @override
  Future<void> getPrimeWalletDetails(
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient(showProgressBar: false).get(
          helper.buildUrl("prime.sika/v1/accounts/customer/prime"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: false,
      shouldShowSnackBar: false,
    );
  }

  @override
  Future<void> getPaymentTransactions(
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().get(
          helper.buildUrl("prime.sika/v1/payments/customer/list?"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(
      response,
      callback,
      shouldPrint: true,
      showSnackWhen401: true,
      shouldShowSnackBar: true,
    );
  }

  @override
  Future<void> getRedemptionTransactions(
    int page,
    Function(BaseResponseModel) callback, {
    TransactionType type = TransactionType.REDEMPTION,
    bool showProgress = true,
  }) async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "20");
    param.putIfAbsent(
        "transaction_type",
        () => type == TransactionType.REDEMPTION
            ? "card_redemption"
            : "card_purchase");
    String url = type == TransactionType.PURCHASE
        ? "prime.sika/v1/payments/customer/list?"
        : "prime.sika/v1/transactions/customer/list?";
    var response =
        await helper.getClient(showProgressBar: showProgress).getClientGET(
              url,
              headers: helper.getTokenHeaders(),
              params: param,
            );
    helper.serializeResponse(
      response,
      callback,
      shouldPrint: true,
      showSnackWhen401: true,
      shouldShowSnackBar: true,
    );
  }

  @override
  Future<void> cancelTransactions(
      String id, Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/payments/customer/$id/cancel?"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: true,
      shouldShowSnackBar: true,
    );
  }

  @override
  Future<void> sendGiftCardFeedback(
    dynamic params,
    int giftId,
    Function(BaseResponseModel) callback,
  ) async {
    var response = await helper.getClient(showProgressBar: false).post(
          helper.buildUrl(
              "prime.sika/v1/accounts/customer/gifted-cards/$giftId/feedback?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> sendCardsForEFund(HashMap<String, Object> params,
      Function(BaseResponseModel) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/customers/efund-requests?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback, shouldShowSnackBar: false,
        forceCallBack: (isSuccess, error) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  ///Pass accountId or Purchase code
  @override
  Future<void> getDetailsOfCardAccount(
      String id, Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient(showProgressBar: false).get(
          helper.buildUrl("prime.sika/v1/accounts/customer/$id"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback,
        showSnackWhen401: false,
        shouldShowSnackBar: false, forceCallBack: (success, error) {
      if (!success) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> rateMerchant(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/customers/rate-merchant"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getMerchantRatings(
      int merchantId, Function(BaseResponseModel response) callback) async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("merchant_id", () => "$merchantId");

    var response = await helper.getClient(showProgressBar: false).getClientGET(
          "prime.sika/v1/customers/rate-merchant-list?",
          headers: helper.getTokenHeaders(),
          params: param,
        );
    helper.serializeResponse(response, callback,
        showSnackWhen401: false,
        shouldShowSnackBar: false, forceCallBack: (success, error) {
      if (!success) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> claimCoupon(HashMap<String, Object> param, bool isPromoCode,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl(isPromoCode
              ? "prime.sika/v1/accounts/customer/generate-promo-code-otp?"
              : "prime.sika/v1/accounts/customer/claim"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> verifyCouponClaimCode(HashMap<String, Object> param,
      bool isPromoCode, Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl(isPromoCode
              ? "prime.sika/v1/accounts/customer/claim-prime-promo"
              : "prime.sika/v1/accounts/customer/verify-claim?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getNotifications(
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient(showProgressBar: false).get(
          helper.buildUrl("prime.sika/v1/notes/list?"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getNearByMerchants(Map<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient(showProgressBar: false).post(
          helper.buildUrl("prime.sika/v1/cards/customer/merchant-near-by?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback,
        showSnackWhen401: false,
        shouldShowSnackBar: false, forceCallBack: (success, error) {
      if (!success) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  // @override
  // Future<void> fetchTravelTimeAndDistance(
  //     LatLng l1, LatLng l2, Function(BaseResponseModel p1) callback) async {
  //   HashMap<String, Object> params = HashMap();
  //   params.putIfAbsent("origin", () => "${l1.latitude},${l1.longitude}");
  //   params.putIfAbsent("destination", () => "${l2.latitude},${l2.longitude}");
  //   params.putIfAbsent("key", () => AppConfig.googleAPIKey);
  //   params.putIfAbsent("units", () => 'imperial');

  //   var response = await helper.getClientGET(
  //     'https://maps.googleapis.com/maps/api/distancematrix/json?',
  //     params: params,
  //     isMapUrl: true,
  //   );

  //   var jsonResponse = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     ///handle the response
  //     if (jsonResponse["status"] == "OK") {
  //       List<dynamic> routes = jsonResponse["routes"];
  //       if (routes.isNotEmpty) {
  //         String route =
  //             jsonResponse["routes"][0]["overview_polyline"]["points"];
  //         String distance =
  //             jsonResponse["routes"][0]["legs"][0]["distance"]["text"];
  //         int distanceValue =
  //             jsonResponse["routes"][0]["legs"][0]["distance"]["value"];
  //         String duration =
  //             jsonResponse["routes"][0]["legs"][0]["duration"]["text"];
  //         int durationValue =
  //             jsonResponse["routes"][0]["legs"][0]["duration"]["value"];

  //         String start_address =
  //             jsonResponse["routes"][0]["legs"][0]["start_address"];

  //         String end_address =
  //             jsonResponse["routes"][0]["legs"][0]["end_address"];

  //         // callBack(RouteModel(
  //         //   route: route,
  //         //   distance: distance,
  //         //   duration: duration,
  //         //   startAddress: start_address,
  //         //   endAddress: end_address,
  //         //   distanceValue: distanceValue,
  //         //   durationValue: durationValue,
  //         // ));
  //       }
  //     }
  //   } else {
  //     debugPrint('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  // @override
  // Future<void> getRouteCoordinates(
  //     LatLng l1, LatLng l2, Function(RouteModel) callBack) async {
  //   String url = "maps/api/directions/json";
  //   HashMap<String, Object> params = HashMap();
  //   params.putIfAbsent("origin", () => "${l1.latitude},${l1.longitude}");
  //   params.putIfAbsent("destination", () => "${l2.latitude},${l2.longitude}");
  //   params.putIfAbsent("key", () => AppConfig.googleAPIKey);

  //   var response = await helper.getClientGET(
  //     url,
  //     params: params,
  //     isMapUrl: true,
  //   );

  //   var jsonResponse = jsonDecode(response.body);
  //   // debugPrint("RESPONSE ${jsonResponse}");

  //   if (response.statusCode == 200) {
  //     ///handle the response
  //     if (jsonResponse["status"] == "OK") {
  //       List<dynamic> routes = jsonResponse["routes"];
  //       if (routes.isNotEmpty) {
  //         String route =
  //             jsonResponse["routes"][0]["overview_polyline"]["points"];
  //         String distance =
  //             jsonResponse["routes"][0]["legs"][0]["distance"]["text"];
  //         int distanceValue =
  //             jsonResponse["routes"][0]["legs"][0]["distance"]["value"];
  //         String duration =
  //             jsonResponse["routes"][0]["legs"][0]["duration"]["text"];
  //         int durationValue =
  //             jsonResponse["routes"][0]["legs"][0]["duration"]["value"];

  //         String start_address =
  //             jsonResponse["routes"][0]["legs"][0]["start_address"];

  //         String end_address =
  //             jsonResponse["routes"][0]["legs"][0]["end_address"];

  //         callBack(RouteModel(
  //           route: route,
  //           distance: distance,
  //           duration: duration,
  //           startAddress: start_address,
  //           endAddress: end_address,
  //           distanceValue: distanceValue,
  //           durationValue: durationValue,
  //         ));
  //       }
  //     }
  //   } else {
  //     debugPrint('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  @override
  Future<void> generateGuestOtp(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient(showProgressBar: false).post(
          helper.buildUrl("prime.sika/v1/customers/guest-otp"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback,
        showSnackWhen401: false,
        shouldShowSnackBar: false, forceCallBack: (success, error) {
      if (!success) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> signUpGuestUser(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient(showProgressBar: false).post(
          helper.buildUrl("prime.sika/v1/customers/guest-signup"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback,
        showSnackWhen401: false,
        shouldShowSnackBar: false, forceRespCallBack: (resp) {
      callback(resp);
    });
  }

  @override
  Future<void> sendUerOtp(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/customers/user-otp"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> verifyUserOtp(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/customers/verify-user-otp"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> deleteAccount(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response =
        await helper.getClient(child: UiApi.deleteAccountText()).delete(
              helper.buildUrl("prime.sika/v1/customers/profile/remove"),
              headers: helper.getTokenHeaders(),
              body: jsonEncode(params),
            );

    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> changePhoneNumber(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper
        .getClient(
            child: UiApi.deleteAccountText(text: "Changing Phone Number..."))
        .post(
          helper.buildUrl("prime.sika/v1/customers/change-phone-otp"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback);
  }

  ///=========== E V E N T S    O R    C A L E N D A R =====================
  @override
  Future<void> createEvent(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/customers/change-phone-otp"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> deleteAnEvents(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    var response = await helper
        .getClient(
            child: UiApi.deleteAccountText(text: "Changing Phone Number..."))
        .post(
          helper.buildUrl("prime.sika/v1/customers/change-phone-otp"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> getListOfEvents(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    var response = await helper
        .getClient(
            child: UiApi.deleteAccountText(text: "Changing Phone Number..."))
        .post(
          helper.buildUrl("prime.sika/v1/customers/change-phone-otp"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> updateAnEvents(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    var response = await helper
        .getClient(
            child: UiApi.deleteAccountText(text: "Changing Phone Number..."))
        .post(
          helper.buildUrl("prime.sika/v1/customers/change-phone-otp"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );
    helper.serializeResponse(response, callback);
  }

  @override
  Future<void> payForEFund(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl(
              "prime.sika/v1/customers/efund-requests/efund-group-pay"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(response, callback, shouldShowSnackBar: false,
        forceCallBack: (isSuccess, error) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  @override
  Future<void> commentOnEFund(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    var response = await helper.getClient().post(
          helper
              .buildUrl("prime.sika/v1/customers/efund-requests-comments/add"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(param),
        );
    helper.serializeResponse(response, callback, shouldShowSnackBar: false,
        forceCallBack: (isSuccess, error) {
      if (!isSuccess) {
        BaseResponseModel res = BaseResponseModel(success: false, error: error);
        callback(res);
      }
    });
  }

  ///------------------------------------- M A R K E T  P L A C E -----------------------------------
  ///================================================================================================

  ///SHOPS----------------------------
  @override
  Future<void> fetchShopsWithProducts(
      int page, Function(BaseResponseModel) callback) async {
    return apiCallGet(
      url: 'prime.sika/v1/markets-places/list?',
      callback: callback,
      page: page,
      shouldPrint: true,
    );
  }

  @override
  Future<void> fetchAllShops(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    return apiCallGet(
      url: 'prime.sika/v1/markets-places/shops?',
      callback: callback,
      param: param,
      showSnackWhen401: false,
      shouldShowSnackBar: false,
    );
  }

  @override
  Future<void> fetchAllProductsOfAShop(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    if (!param.containsKey('merchant_id')) {
      debugPrint("Cannot make api call, merchant_id is required");
      return;
    }

    String id = param['merchant_id'] as String;
    param.remove('merchant_id');

    return apiCallGet(
      url: 'prime.sika/v1/markets-places/$id/shop-list-products?',
      callback: callback,
      param: param,
      shouldPrint: true,
    );
  }

  @override
  Future<void> fetchProductsFromAllShops(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    return apiCallGet(
      url: 'prime.sika/v1/markets-places/products?',
      callback: callback,
      param: param,
    );
  }

  @override
  Future<void> fetchProductDetails(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    return apiCallGet(
      url: 'prime.sika/v1/customers/rate-merchant-list?',
      callback: callback,
      param: param,
      shouldShowSnackBar: true,
    );
  }

  @override
  Future<void> saveProductsToCart(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) async {
    return apiCallPost(
      url: 'prime.sika/v1/markets-places/create-shopcart?',
      callback: callback,
      param: param,
      showProgressBar: true,
      shouldShowSnackBar: true,
    );
  }

  @override
  Future<void> fetchProductCategories(
      int page, Function(BaseResponseModel response) callback) async {
    // HashMap<String, Object> param = HashMap();
    // param.putIfAbsent("page", () => "$page");
    // param.putIfAbsent("limit", () => "30");
    //
    // var response = await helper.getClient(showProgressBar: false).getClientGET(
    //       "prime.sika/v1/markets-places/products-types?",
    //       headers: helper.getTokenHeaders(),
    //       params: param,
    //     );
    // helper.serializeResponse(response, callback,
    //     showSnackWhen401: false, shouldShowSnackBar: false);

    return apiCallGet(
      url: 'prime.sika/v1/markets-places/products-types?',
      callback: callback,
      page: page,
    );
  }

  @override
  Future<void> fetchProductsCart(Function(BaseResponseModel) callback) async {
    return apiCallGet(
      url: 'prime.sika/v1/markets-places/current-product-cart?',
      forceCallback: true,
      callback: callback,
    );
  }

  @override
  Future<void> fetchPaymentOptions(Function(BaseResponseModel) callback) async {
    return apiCallGet(
      url: 'prime.sika/v1/shop-payments/types?',
      forceCallback: true,
      callback: callback,
    );
  }

  @override
  Future<void> fetchOrders(
      int page, Function(BaseResponseModel) callback) async {
    return apiCallGet(
      url: 'prime.sika/v1/markets-places/orders?',
      forceCallback: true,
      callback: callback,
    );
  }

  @override
  Future<void> makePaymentOfProduct(
      HashMap<String, Object> param, Function(BaseResponseModel) callback) {
    return apiCallPost(
      url: 'prime.sika/v1/shop-payments/customer/pay?',
      callback: callback,
      param: param,
      showProgressBar: true,
    );
  }

  @override
  Future<void> fetchSingleShopAndProducts(
      int shopId, Function(BaseResponseModel) callback) async {
    return await apiCallGet(
      url: 'prime.sika/v1/markets-places/$shopId/shop-list-products?',
      forceCallback: true,
      callback: callback,
    );
  }

  @override
  Future<void> createAddress(HashMap<String, Object> param,
      Function(BaseResponseModel) callback) async {
    return apiCallPost(
      url: "prime.sika/v1/customers/address?",
      callback: callback,
      param: param,
      shouldPrint: true,
    );
  }

  @override
  Future<void> fetchDeliveryAddress(
      int page, Function(BaseResponseModel p1) callback) {
    return apiCallGet(
      url: 'prime.sika/v1/customers/addresses?',
      callback: callback,
      page: page,
    );
  }

  @override
  Future<void> clearProductClear(
      int cartId, Function(BaseResponseModel p1) callback) {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("shop_cart_id", () => cartId);

    return apiCallPost(
      url: "prime.sika/v1/markets-places/clear?",
      callback: callback,
      showProgressBar: true,
      param: param,
    );
  }

  @override
  Future<void> sendConfirmationOtp(
      HashMap<String, Object> param, Function(BaseResponseModel) callback) {
    return apiCallPost(
      url: "prime.sika/v1/accounts/merchant/send-confirmation-code?",
      callback: callback,
      showProgressBar: true,
      param: param,
    );
  }

  @override
  Future<void> fetchPurchasedAndGiftedCards(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback) {
    return apiCallGet(
      url: "prime.sika/v1/accounts/customer/cards/list?",
      callback: callback,
      param: param,
    );
  }

  @override
  Future<void> fetchOrderPayments(
      HashMap<String, Object> param, Function(BaseResponseModel p1) callback) {
    return apiCallGet(
      url: 'prime.sika/v1/shop-payments/customer/list',
      callback: callback,
      param: param,
    );
  }

  @override
  Future<void> cancelAnOrder(
      String reference, Function(BaseResponseModel p1) callback) {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent('order_reference', () => reference);

    return apiCallGet(
      url: 'prime.sika/v1/shop-payments/customer/list',
      callback: callback,
      param: param,
    );
  }

  @override
  Future<void> fetchDiscountedProducts(
      HashMap<String, Object> param, Function(BaseResponseModel p1) callback) {
    return apiCallGet(
      url: 'prime.sika/v1/markets-places/discount-products',
      callback: callback,
      param: param,
    );
  }

  // @override
  // Future<List<T>> fetchData<T>({
  //   required String url,
  //   HashMap<String, Object>? param,
  // }) async {
  //   List<T> results = [];
  //   await apiCallGet(
  //     url: url,
  //     param: param,
  //   );
  //   return results;
  // }

  @override
  Future<void> addProductToWishList(HashMap<String, Object> param,
      Function(BaseResponseModel) callback) async {
    return apiCallPost(
      url: 'prime.sika/v1/markets-places/wishlist/save',
      callback: callback,
      param: param,
      showSnackWhen401: false,
      shouldShowSnackBar: false,
    );
  }

  @override
  Future<void> updateProductsCart(
      HashMap<String, Object> param, Function(BaseResponseModel) callback) {
    String cartId =
        param.containsKey("cartId") ? param['cartId'] as String : '';
    param.remove('cartId');

    return apiCallPut(
      url: 'prime.sika/v1/markets-places/update/$cartId?',
      callback: callback,
      param: param,
      shouldPrint: true,
      showProgressBar: true,
    );
  }

  @override
  Future<void> removeProductCartItem(
      HashMap<String, Object> param, Function(BaseResponseModel p1) callback) {
    String cartId =
        param.containsKey("cartId") ? param['cartId'] as String : '';
    param.remove('cartId');

    return apiCallPut(
      url: 'prime.sika/v1/markets-places/remove/$cartId?',
      callback: callback,
      param: param,
      shouldPrint: true,
      showProgressBar: true,
    );
  }

  @override
  Future<void> addFunds(
      HashMap<String, Object> param, Function(BaseResponseModel p1) callback) {
    return apiCallPost(
      url: 'prime.sika/v1/physical/card/payments/customer',//'prime.sika/v1/add-funds?',
      callback: callback,
      showProgressBar: true,
      param: param,shouldPrint: true,
    );
  }
}
