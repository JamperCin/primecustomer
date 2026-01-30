import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/rating_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantRatingController extends BaseController {
  ///Ratings list
  RxList<RatingModel> ratingsList = RxList<RatingModel>();
  RxBool isDoneLoadingRating = false.obs;

  ///Merchant Infomation
  Rx<MerchantDetails> client = const MerchantDetails().obs;

  ///Rating value
  RxDouble ratingValue = 0.0.obs;
  RxString ratingName =
      "Your feedback will continue to remain anonymous until you switch it off."
          .obs;

  TextEditingController feedBackTxt = TextEditingController();

  RxBool remainAnonymous = true.obs;

  ///Get merchants ratings or reviews by other customers
  void getMerchantRatings(int merchantId) {
    isDoneLoadingRating.value = false;
    webService?.getMerchantRatings(merchantId, (response) {
      ratingsList.addAll(response.data?.ratings ?? []);
      isDoneLoadingRating.value = true;
    });
  }

  void clear() {
    ratingValue.value = 0;
    remainAnonymous.value = true;
    feedBackTxt.clear();
  }

  onRatingUpdate(double rating) {
    ratingValue.value = rating;
    switch (rating.toInt()) {
      case 0:
        ratingName.value =
            "Your feedback will continue to remain anonymous until you switch it off.";
        break;
      case 1:
        ratingName.value = "Terrible";
        break;
      case 2:
        ratingName.value = "Not Good";
        break;
      case 3:
        ratingName.value = "Good";
        break;
      case 4:
        ratingName.value = "Better";
        break;
      case 5:
        ratingName.value = "Excellent";
        break;
    }
  }

  void onSubmitOnClick() {
    if (ratingValue.value == 0) {
      SnackBarApi.snackBarInfo("Please select rating.");
      return;
    }
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("merchant_id", () => client.value.id);
    params.putIfAbsent("rating_value", () => ratingValue.value);
    params.putIfAbsent("anonymous", () => remainAnonymous.value);
    params.putIfAbsent("review_message", () => getStringData(feedBackTxt));

    webService?.rateMerchant(params, (response) {
      clear();
      DialogsApi.popUpSuccessDialog(mContext!,
          mess: "Thank you for your review.", call: () {
        NavApi.fireTargetHome();
      });
    });
  }
}
