import 'package:primecustomer/controller/view/merchant_rating_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantRatingList extends BaseScreenStandard {
  MerchantRatingController controller = Get.put(MerchantRatingController());

  MerchantRatingList() {
    controller.ratingsList.clear();
    Utils.startTimer(1, () {
      controller.getMerchantRatings(getModel().clientId ?? 0);
    });
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) {
      return baseObject as CardModel;
    }

    return CardModel();
  }

  @override
  String appBarTitle() {
    return (getModel().clientName ?? "Merchants ") + "Reviews";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
        list: listView(), padding: EdgeInsets.all(AppDimens.dimen10));
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Obx(
      () => controller.isDoneLoadingRating.value &&
              controller.ratingsList.isNotEmpty
          ? UiApi.reviewWidget(controller.ratingsList)
          : controller.isDoneLoadingRating.value &&
                  controller.ratingsList.isEmpty
              ? UiApi.noDataWidget(
                  title: "No Review(s) Available",
                  asset: "assets/images/ic_ratings.png",
                  assetSize: AppDimens.dimen300,
                  message:
                      "No reviews or ratings available for this merchant. Merchant's reviews and ratings appear here.")
              : UiApi.loader(),
    ));

    return list;
  }
}
