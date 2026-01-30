import 'package:primecustomer/controller/view/delete_account_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountScreen extends BaseScreenStandard {
  DeleteAccountController controller = Get.put(DeleteAccountController());

  DeleteAccountScreen() {
    controller.shouldDeleteAccount = true;
  }

  @override
  String appBarTitle() {
    return "Delete My Account";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView(), padding: EdgeInsets.zero);
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Padding(
      padding: EdgeInsets.all(AppDimens.dimen20),
      child: Column(
        children: [
          UiApi.iconText(icon: true, text: "Deleting your account will:"),
          SizedBox(height: AppDimens.dimen10),
          UiApi.iconText(
              text: "Delete your account info and your profile picture"),
          UiApi.iconText(text: "Delete all your purchased gift cards."),
          UiApi.iconText(text: "Delete all your gifted cards"),
          UiApi.iconText(text: "Delete all your e-Fund gift cards"),
          UiApi.iconText(text: "Delete all your favorite merchants and cards"),
          UiApi.iconText(text: "Delete all items in your cart"),
          UiApi.iconText(
              text: "Delete all your payments and redemptions history"),
        ],
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen30));

    list.add(UiApi.phoneWidget(
      ctrl: controller.phoneTxt,
      code: controller.countryCode,
      name: controller.countryName,
      validString: controller.validPhoneString,
      isValid: controller.isPhoneNumberValid,
      hint:
          "Enter phone number ending ${controller.getLastTwoDigits(asterik: 3)}",
      onSelectCountry: () {
        controller.onSelectCountryOnClick();
      },
      onChanged: (val) {
        controller.liveValidatePhoneNum();
      },
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(InkWell(
      onTap: () {
        controller.setContext(mContext!);
        controller.onDeleteOnAccountOnClick();
      },
      child: Container(
        color: AppColors.background,
        child: Padding(
          padding: EdgeInsets.all(AppDimens.dimen16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  "Delete My Account",
                  style: AppTextStyles.titleStyleBold.copyWith(
                    color: controller.isPhoneNumberValid.value
                        ? AppColors.redLight
                        : AppColors.textGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(InkWell(
      onTap: () {
        controller.onChangeNumberOnClick();
      },
      child: Container(
        color: AppColors.background,
        child: Padding(
          padding: EdgeInsets.all(AppDimens.dimen16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Change Number Instead",
                style: AppTextStyles.titleStyleBold
                    .copyWith(color: AppColors.introColor2),
              ),
            ],
          ),
        ),
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    return list;
  }
}
