import 'package:primecustomer/controller/view/merchant_rating_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateMerchantScreen extends BaseScreenStandard {
  MerchantRatingController controller = Get.put(MerchantRatingController());

  RateMerchantScreen() {
    controller.clear();
    Utils.startTimer(1, () {
      CardModel cardModel = getModel();
      controller.client.value = cardModel.client ?? const MerchantDetails();
    }, duration: const Duration(milliseconds: 180));
  }

  @override
  String appBarTitle() {
    return "Rate Merchant";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  List<Widget> actions() {
    return [
      InkWell(
        onTap: () {
          NavApi.fireTargetHome();
        },
        child: Padding(
          padding: EdgeInsets.only(right: AppDimens.dimen20),
          child: Icon(
            Icons.close,
            size: AppDimens.dimen25,
            color: AppColors.black,
          ),
        ),
      )
    ];
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) {
      return baseObject as CardModel;
    }

    return CardModel();
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen16),
      child: SingleChildScrollView(
        child: Column(
          children: listView(),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(
      Text(
        "How was your redemption?",
        textAlign: TextAlign.center,
        style: AppTextStyles.h4StyleBold,
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(Center(
      child: UiApi.ratingBarWidget(onRatingUpdate: controller.onRatingUpdate),
    ));
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(Obx(
      () => Text(
        controller.ratingName.value,
        style: AppTextStyles.descStyleRegular,
        textAlign: TextAlign.center,
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(
      Column(
        children: [
          UiApi.textArea(controller.feedBackTxt,
              hint: "(Optional) message here..."),
          SizedBox(height: AppDimens.dimen50),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                Obx(
                  () => CupertinoSwitch(
                    value: controller.remainAnonymous.value,
                    onChanged: (value) {
                      debugPrint("Value == $value");
                      controller.remainAnonymous.value = value;
                    },
                  ),
                ),
                Text(
                  "Remain anonymous",
                  style: AppTextStyles.smallSubDescStyleRegular,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimens.dimen50),
          UiApi.button(
              text: "Submit",
              backgroundColor: AppColors.white,
              borderColor: AppColors.primaryGreenColor,
              textColor: AppColors.primaryGreenColor,
              onPressed: () {
                controller.onSubmitOnClick();
              }),
        ],
      ),
    );

    return list;
  }
}
