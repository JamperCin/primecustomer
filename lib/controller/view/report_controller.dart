import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends BaseController {
  TextEditingController reportTxt = TextEditingController();
  RxBool isValidForm = false.obs;

  void onTextChanged(String val) {
    isValidForm.value = reportTxt.text.toString().trim().isNotEmpty &&
        reportTxt.text.toString().trim().length > 3;
  }

  void onSubmitOnClick() {
    if (isValidForm.value) {
      UiApi.showConfirmDialog(
          imageAsset: "assets/images/ic_feedback.png",
          title: "Confirm Report",
          message: "Are you sure you want to submit this as your report?",
          callBack: () {
            initReportRequest();
          });
    }
  }

  void initReportRequest() {
    HashMap<String, String> param = HashMap();
    param.putIfAbsent("message", () => getStringData(reportTxt));
    webService?.sendFeedback(param, (response) {
      DialogsApi.popUpSuccessDialog(mContext!,
          time: 5,
          asset: "assets/images/ic_feedback.png",
          mess:
              "Your report has successfully been submitted. A member from the support team will contact you shortly.",
          call: () {
        reportTxt.clear();
      });
    });
  }
}
