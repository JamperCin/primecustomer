import 'dart:collection';
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/utils/map_utils.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../res/config/app_config.dart';
import '../../utils/Utils.dart';
import 'response_codes.dart';

class HttpHelper {
  final BaseController controller;
  final List<String> EXCEPTION_URL = [
    "prime.sika/v1/users/login",
    "prime.sika/v1/users/logout",
  ];

  HttpHelper(this.controller);

  HttpHelper getClient({bool showProgressBar = true, Widget? child}) {
    if (showProgressBar && controller.mContext != null) {
      DialogsApi.showProgressBar(context: controller.mContext!, child: child);
    }
    return HttpHelper(controller);
  }

  HashMap<String, Object> params(String key, Object object) {
    if (object is int || object is bool) {
      object = "$object";
    }

    HashMap<String, Object> params = HashMap();
    params.putIfAbsent(key, () => object);
    return params;
  }

  Future<http.Response> post(uri,
      {Map<String, String> headers = const {},
      body,
      Encoding? encoding}) async {
    printLogs(uri, requestType: "POST", headers: headers, params: body);
    return http.post(uri, body: body, encoding: encoding, headers: headers);
  }

  Future<http.Response> get(url,
      {Map<String, String> headers = const {}}) async {
    printLogs(url, requestType: "GET", headers: headers);
    return http.get(url, headers: headers);
  }

  Future<http.Response> put(url,
      {Map<String, String> headers = const {},
      body,
      Encoding? encoding}) async {
    printLogs(url, requestType: "PUT", headers: headers, params: body);
    return http.put(url, body: body, encoding: encoding, headers: headers);
  }

  Future<http.Response> delete(url,
      {Map<String, String> headers = const {},
      body,
      Encoding? encoding}) async {
    printLogs(url, requestType: "DELETE", headers: headers, params: body);
    return http.delete(url, body: body, encoding: encoding, headers: headers);
  }

  Future<http.Response> getClientGET(
    url, {
    Map<String, String> headers = const {},
    Map<String, Object>? params,
    bool isMapUrl = false,
  }) async {
    var uri =
        isMapUrl ? buildMapUrl(url, body: params) : buildUrl(url, body: params);

    printLogs(uri, requestType: "GET", headers: headers, params: params);
    return http.get(uri, headers: headers);
  }

  Uri buildMapUrl(String url, {dynamic body}) {
    return Uri(
      scheme: 'https',
      host: AppConfig.MAP_HOST,
      path: url,
      queryParameters: body,
    );
  }

  Uri buildUrl(String url, {dynamic body}) {
    return Uri(
      scheme: 'https',
      host: AppConfig.HOST,
      path: url.replaceAll("?", ""),
      queryParameters: body,
    );
  }

  void printLogs(
    uri, {
    String? requestType,
    Map<String, String>? headers,
    dynamic params,
  }) {
    //debugUtils.printLog("\n\n$requestType REQUEST: $uri\nHEADERS: $headers\nBODY: $params\n\n");
    Utils.printLog(
        "\n\n$requestType REQUEST: $uri\nHEADERS: $headers\nBODY: $params\n\n");
  }

  String getPlatformAccess() {
    return controller.platformAccess.isNotEmpty
        ? controller.platformAccess
        : "pCdroid";
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent("da-secret", () => getPlatformAccess());
    headers.putIfAbsent("Content-type", () => "application/json");
    return headers;
  }

  Map<String, String> getTokenHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent("da-secret", () => getPlatformAccess());
    headers.putIfAbsent("Content-type", () => "application/json");
    if (isGuestUser.value) {
      headers.putIfAbsent("X-Guest-Token", () => controller.getToken());
    } else {
      headers.putIfAbsent("Authorization", () => controller.getToken());
    }

    Utils.printLog("TOKEN: \n ${controller.getToken()}");
    return headers;
  }

  Map<String, String> getMultiPartTokenHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent("da-secret", () => getPlatformAccess());
    headers.putIfAbsent("Content-type", () => "multipart/form-data");
    if (isGuestUser.value) {
      headers.putIfAbsent("X-Guest-Token", () => controller.getToken());
    } else {
      headers.putIfAbsent("Authorization", () => controller.getToken());
    }
    return headers;
  }

  Map<String, String> getHeadersFormData() {
    Map<String, String> headers = {};
    headers.putIfAbsent("da-secret", () => getPlatformAccess());
    headers.putIfAbsent("Authorization", () => controller.getToken());
    headers.putIfAbsent(
        "Content-Type", () => "application/x-www-form-urlencoded");
    return headers;
  }

  Future<List<PrimeCardModel>> serializeCardResponse(
    var response, {
    ///Should logs be printed tot he console together with the normal internal http logs
    bool shouldPrint = true,

    ///Should the snackBar display errors when there is an error
    bool shouldShowSnackBar = true,

    ///Should the snackBar display errors when there is an error in the background
    bool showSnackWhen401 = false,

    ///Should send callback method even if there is an error to the api
    Function(bool, String)? forceCallBack,

    ///Show custom error message to the user forgetting the error from backend
    String? errorMessage,

    ///Progress Controller to notify the UI when request is done
    RxBool? isDoneLoading,
  }) async {
    isDoneLoading = isDoneLoading ?? false.obs;
    isDoneLoading.value = true;

    List<PrimeCardModel> cardsList = [];

    DialogsApi.dismissProgressBar();

    //Utils.printLog("REQUEST => ${response.request.url}\nLog ==> ${response.statusCode} \nRawResponse ${Utils.convertDecode(response.body)}\n\n\n");

    var responseMess = ResponseCodes.response(response.statusCode);

    try {
      //convert.jsonDecode(Utils.utf8convert(response.body));
      var jsonResponse = MapUtils().convertDecode(response.body);

      if (shouldPrint) {
        try {
          Utils.printLog(
              " \n\nRESPONSE ${response.request.url} \n$jsonResponse\n\n");
        } catch (e) {
          Utils.printLog("Failed to get response");
        }
      }
      BaseResponseModel baseResponse = BaseResponseModel.fromJson(jsonResponse);

      if (baseResponse.success) {
        cardsList.addAll(baseResponse.data?.cards ?? []);
        return cardsList;
      } else if (baseResponse.status.isEqual(401)) {
        if (forceCallBack != null) {
          forceCallBack(false, baseResponse.error ?? responseMess);
          return [];
        }
        if (!EXCEPTION_URL
            .contains(response.request.url.toString().trim().toLowerCase())) {
          controller.generateNewToken();
        } else {
          debugPrint("login doesn't expire");
        }
        if (showSnackWhen401) {
          SnackBarApi.snackBarError(
              baseResponse.error ?? errorMessage ?? responseMess);
        }
      } else {
        if (shouldShowSnackBar) {
          SnackBarApi.snackBarError(
              baseResponse.error ?? errorMessage ?? responseMess);
        }

        if (forceCallBack != null) {
          forceCallBack(
              false, baseResponse.error ?? errorMessage ?? responseMess);
        }
      }
    } catch (e) {
      DialogsApi.dismissProgressBar();
      Utils.printLog("Error exception: ${e.toString()}");

      if (shouldShowSnackBar) {
        SnackBarApi.snackBarError(errorMessage ?? responseMess);
      }

      if (forceCallBack != null) {
        forceCallBack(false, responseMess);
      }
    }
    return [];
  }

  void serializeResponse(
    var response,
    Function(BaseResponseModel response)? callback, {
    ///Should logs be printed to the console together with the normal internal http logs
    bool shouldPrint = false,

    ///Should the snackBar display errors when there is an error
    bool shouldShowSnackBar = true,

    ///Should the snackBar display errors when there is an error in the background
    bool showSnackWhen401 = false,

    ///Should send callback method even if there is an error to the api
    Function(bool, String)? forceCallBack,
    Function(BaseResponseModel)? forceRespCallBack,

    ///Show custom error message to the user forgetting the error from backend
    String? errorMessage,

    ///Progress Controller to notify the UI when request is done
    RxBool? isDoneLoading,
  }) {
    isDoneLoading = isDoneLoading ?? false.obs;
    isDoneLoading.value = true;

    DialogsApi.dismissProgressBar();

    Utils.printLog("RESPONSE--> => ${response.request.url}\nLog ==> ${response.statusCode} \nRawResponse ${Utils.convertDecode(response.body)}\n\n\n");

    var responseMess = ResponseCodes.response(response.statusCode);

    try {
      var jsonResponse = MapUtils().convertDecode(response.body);
      //convert.jsonDecode(Utils.utf8convert(response.body));
      if (shouldPrint) {
        try {
          Utils.printLog(
              " \n\nRESPONSE ${response.request.url} \n$jsonResponse\n\n");
        } catch (e) {
          Utils.printLog("Failed to get response");
        }
      }
      BaseResponseModel baseResponse = BaseResponseModel.fromJson(jsonResponse);

      if (baseResponse.success) {
        if (callback != null) {
          callback(baseResponse);
        }
      } else if (baseResponse.status.isEqual(401)) {
        if (forceCallBack != null) {
          forceCallBack(false, baseResponse.error ?? responseMess);
          return;
        }
        if (forceRespCallBack != null) {
          forceRespCallBack(baseResponse);
          return;
        }
        if (!EXCEPTION_URL
            .contains(response.request.url.toString().trim().toLowerCase())) {
          controller.generateNewToken();
        } else {
          debugPrint("login doesn't expire");
        }
        if (showSnackWhen401) {
          SnackBarApi.snackBarError(
              baseResponse.error ?? errorMessage ?? responseMess);
        }
      } else {
        if (shouldShowSnackBar) {
          SnackBarApi.snackBarError(
              baseResponse.error ?? errorMessage ?? responseMess);
        }

        if (forceCallBack != null) {
          forceCallBack(
              false, baseResponse.error ?? errorMessage ?? responseMess);
        }

        if (forceRespCallBack != null) {
          forceRespCallBack(baseResponse);
          return;
        }
      }
    } catch (e) {
      DialogsApi.dismissProgressBar();
      if (shouldPrint) {
        Utils.printLog("Error exception: ${e.toString()}");
      }

      if (shouldShowSnackBar) {
        SnackBarApi.snackBarError(errorMessage ?? responseMess);
      }

      if (forceCallBack != null) {
        forceCallBack(false, responseMess);
      }

      if (forceRespCallBack != null) {
        forceRespCallBack(BaseResponseModel(
            success: false, status: response.statusCode, error: e.toString()));
        return;
      }
    }
  }

  void serializeAwsResponse(
    var response,
    Function(BaseResponseModel response)? callback, {
    ///Should logs be printed to the console together with the normal internal http logs
    bool shouldPrint = false,

    ///Should the snackBar display errors when there is an error
    bool shouldShowSnackBar = true,

    ///Should the snackBar display errors when there is an error in the background
    bool showSnackWhen401 = false,

    ///Should send callback method even if there is an error to the api
    Function(bool, String)? forceCallBack,

    ///Show custom error message to the user forgetting the error from backend
    String? errorMessage,

    ///Progress Controller to notify the UI when request is done
    RxBool? isDoneLoading,
  }) {
    isDoneLoading = isDoneLoading ?? false.obs;
    isDoneLoading.value = true;
    // BaseController.isProgressLoading.value = false;
    DialogsApi.dismissProgressBar();

    try {
      Utils.printLog("RESPONSE --\n $response");
      var jsonResponse = convert.jsonDecode(response);
      if (shouldPrint) {
        Utils.printLog("RESPONSE\n $jsonResponse");
      }
      BaseResponseModel baseResponse = BaseResponseModel.fromJson(jsonResponse);

      if (baseResponse.success) {
        if (callback != null) {
          callback(baseResponse);
        }
      } else if (baseResponse.status.isEqual(401)) {
        if (forceCallBack != null) {
          forceCallBack(
              false,
              baseResponse.error ??
                  errorMessage ??
                  'An unknown error occurred.');
        }
        if (!EXCEPTION_URL
            .contains(response.request.url.toString().trim().toLowerCase())) {
          controller.generateNewToken();
        } else {
          if (shouldPrint) {
            debugPrint("login doesn't expire");
          }
        }
        if (showSnackWhen401) {
          SnackBarApi.snackBarError(errorMessage ??
              baseResponse.error ??
              "An unknown error occurred.");
        }
      } else {
        if (shouldShowSnackBar) {
          SnackBarApi.snackBarError(errorMessage ??
              baseResponse.error ??
              "An unknown error occurred.");
        }

        if (forceCallBack != null) {
          forceCallBack(
              false,
              errorMessage ??
                  baseResponse.error ??
                  "An unknown error occurred.");
        }
      }
    } catch (e) {
      if (shouldPrint) {
        Utils.printLog("Error exception: ${e.toString()}");
      }
      var mess = "An error occurred. Please try again later.";
      if (shouldShowSnackBar) {
        SnackBarApi.snackBarError(errorMessage ?? mess);
      }

      if (forceCallBack != null) {
        forceCallBack(false, errorMessage ?? mess);
      }
    }
  }

  List<dynamic> serializeRes(
    String body, {
    String key = 'users',

    ///Should the snackBar display errors when there is an error
    bool shouldShowSnackBar = true,

    ///Should logs be printed to the console together with the normal internal http logs
    bool shouldPrint = false,

    ///Should the snackBar display errors when there is an error in the background
    bool showSnackWhen401 = false,
  }) {
    if (shouldPrint) {
      debugPrint("RAW RESPONSE ==  $body");
    }

    var json = MapUtils().convertDecode(body);
    bool isSuccess =
        json.containsKey('success') ? json['success'] as bool : false;
    int status = json.containsKey('status') ? json['status'] as int : 0;
    json = json.containsKey('data') ? json['data'] : null;
    String? error = json.containsKey('error') ? json['error'] : null;

    DialogsApi.dismissProgressBar();

    List<dynamic> list = [];

    if (isSuccess && status == 200 || status == 201) {
      if (json == null) {
        return list;
      }

      try {
        if (json.containsKey(key)) {
          if (json[key] is List<dynamic> &&
              (json[key] as List<dynamic>).isNotEmpty) {
            list = (json[key] as List<dynamic>);
          }
        }
      } catch (e) {
        DialogsApi.dismissProgressBar();
        if (shouldPrint) {
          debugPrint("Error serializing == $e");
        }
      }
    } else {
      if (shouldShowSnackBar || (showSnackWhen401 && status.isEqual(401))) {
        SnackBarApi.snackBarError(error ?? "An unknown error occurred.");
      }
    }

    return list;
  }
}
