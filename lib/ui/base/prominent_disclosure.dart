import 'package:primecustomer/data/model/local/DisclosureModel.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProminentDisclosure extends BaseScreenStandard {
  final DisclosureModel disclosureModel;

  ProminentDisclosure({required this.disclosureModel});

  @override
  String appBarTitle() {
    return disclosureModel.appBarTitle;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen24),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UiApi.assetImage(disclosureModel.asset),
              SizedBox(height: AppDimens.dimen40),
              Text(
                disclosureModel.title,
                style: AppTextStyles.titleStyleBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimens.dimen20),
              Text(
                disclosureModel.message,
                style: AppTextStyles.descStyleLight,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: AppDimens.dimen40),
              Padding(
                padding: EdgeInsets.only(
                    left: AppDimens.dimen32, right: AppDimens.dimen32),
                child: UiApi.button(
                  text: "Agree",
                  onPressed: () {
                    Get.back();
                    if (disclosureModel.onAccepted != null) {
                      disclosureModel.onAccepted!(true);
                    }
                  },
                ),
              ),
              SizedBox(height: AppDimens.dimen20),
              Padding(
                padding: EdgeInsets.only(
                    left: AppDimens.dimen32, right: AppDimens.dimen32),
                child: UiApi.button(
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.red,
                  text: "Not Now",
                  textStyle: AppTextStyles.descStyleRegular
                      .copyWith(color: AppColors.red),
                  onPressed: () {
                    Get.back();
                    if (disclosureModel.onAccepted != null) {
                      disclosureModel.onAccepted!(false);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
