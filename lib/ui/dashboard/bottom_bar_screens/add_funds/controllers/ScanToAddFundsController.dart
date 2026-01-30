import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/local/data_param_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/add_funds/screens/complete_add_fund_screens.dart';
import 'package:flutter/material.dart';

class ScanToAddFundsController extends BaseController {
  TextEditingController cardNumberTextController = TextEditingController();


  void onCloseOnClick() {
    NavApi.fireBack();
  }

  void onQrScanned(String code) {
    NavApi.fireBack();

    if(!code.contains("https") || code.length < 16){
      SnackBarApi.snackBarError("An invalid card scanned. Please try again");
      return;
    }
    final card16DigitCode = code.substring(code.length - 16, code.length);

    try{
      int.parse(card16DigitCode);
    }catch(e){
      SnackBarApi.snackBarError("An invalid card scanned. Please try again");
      return;
    }

    debugPrint("CODE HERE == $code ---> Card Code == $card16DigitCode");

    HashMap<String, Object> param = HashMap();
    param.putIfAbsent('purchase_code', () => card16DigitCode);
    navUtils.fireTarget(CompleteAddFundsScreen(), model: DataParamModel(param: param));
  }

}
