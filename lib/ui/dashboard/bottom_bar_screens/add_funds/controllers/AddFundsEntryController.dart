import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/model/local/data_param_model.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/add_funds/screens/complete_add_fund_screens.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFundsEntryController extends BaseController {
  TextEditingController cardNumberCtrl = TextEditingController();

  RxString amountValue = "0.00".obs;


  // void onAmountChange(String amount) {
  //   amountValue.value = NumberUtils.moneyCurrencyFormat(amount, dec: 2);
  // }



  // Future<void> setModel(DataParamModel model) async {
  //   dataParam = model;
  // }

  void onContinueAddFunds() {
    if(cardNumberCtrl.text.length != 16){
      SnackBarApi.snackBarError("Card number must be 16 digits");
      return;
    }

    HashMap<String, Object> param = HashMap();
    param.putIfAbsent('purchase_code', () => cardNumberCtrl.text);
    navUtils.fireTarget(CompleteAddFundsScreen(), model: DataParamModel(param: param));
  }
}
