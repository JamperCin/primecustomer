import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/model/local/data_param_model.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';

class CompleteAddFundsController extends BaseController{
  TextEditingController amountCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  String cardNumber = "";

  late CardController cardController;


  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  void setModel(DataParamModel model) {
    cardNumber = model.param['purchase_code'].toString();
  }

  ///Confirm you want to really do this deposit
  Future<void> confirmPayment() async {
    // DialogsApi.alertDialogYesNo(
    //     title: 'Proceed to Add Funds?',
    //     mess: 'Are you sure you want to add funds to your card?',
    //     onYesTap: () {
    //       addFundsRequest();
    //     });

    UiApi.showConfirmDialog(
      imageAsset: "assets/images/ic_cart_file.png",
      title: "Proceed to Add Funds?",
      message: "Are you sure you want to add funds to your card?",
      buttonTitle: "Proceed",
      callBack: () {
        addFundsRequest();
      },
    );
  }

  ///Init a request to deposit money onto the 16-digit code
  Future<void> addFundsRequest() async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("amount", () => amountCtrl.text.trim());
    param.putIfAbsent("payment_to", () => "SELF");
    param.putIfAbsent("telephone", () => phoneCtrl.text.trim());
    param.putIfAbsent("purchase_code", () => cardNumber);

    await webService?.addFunds(param, (resp) {
      cardController.goToWebPayment(paymentUrl: resp.data?.paymentUrl);
    });
  }


}