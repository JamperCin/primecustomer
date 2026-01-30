import 'package:primecustomer/controller/view/delete_account_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNumberScreen extends BaseScreenStandard {
  DeleteAccountController controller = Get.put(DeleteAccountController());

  ChangeNumberScreen() {
    controller.shouldDeleteAccount = false;
    controller.clear();
  }

  @override
  String appBarTitle() {
    return "Change Phone Number";
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
          UiApi.iconText(icon: true, text: "Changing your phone number will :"),
          SizedBox(height: AppDimens.dimen10),
          UiApi.iconText(
              text: "Delete this current phone number from prime system."),
          UiApi.iconText(
              text:
                  "Switch all your account details from this current phone number to your new number."),
          UiApi.iconText(
              text:
                  "Switch all your purchased and redemption information to your new number"),
        ],
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen10));

    list.add(UiApi.phoneWidget(
      ctrl: controller.oldPhoneTxt,
      code: controller.oldCountryCode,
      name: controller.oldCountryName,
      validString: controller.validOldPhoneString,
      isValid: controller.isOldPhoneNumberValid,
      hint:
          "Confirm your number ending ${controller.getLastTwoDigits(asterik: 3)}",
      onSelectCountry: () {
        controller.onSelectCountryOnClick(old: true);
      },
      onChanged: (val) {
        controller.liveValidateOldPhoneNum();
      },
    ));

    list.add(SizedBox(height: AppDimens.dimen30));

    list.add(UiApi.phoneWidget(
      ctrl: controller.phoneTxt,
      code: controller.countryCode,
      name: controller.countryName,
      validString: controller.validPhoneString,
      isValid: controller.isPhoneNumberValid,
      hint: "Enter new phone number",
      onSelectCountry: () {
        controller.onSelectCountryOnClick();
      },
      onChanged: (val) {
        controller.liveValidatePhoneNum();
      },
    ));
    list.add(
      Padding(
        padding: EdgeInsets.all(AppDimens.dimen24),
        child: Text("Make sure you can receive SMS on this new number.",
            style: AppTextStyles.subDescStyleLight),
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(InkWell(
      onTap: () {
        controller.setContext(mContext!);
        controller.onValidateOldNumber();
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
                  "Change Phone Number",
                  style: AppTextStyles.titleStyleBold.copyWith(
                    color: controller.isPhoneNumberValid.value &&
                            controller.isOldPhoneNumberValid.value
                        ? AppColors.introColor2
                        : AppColors.textGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen20));
    list.add(
      Padding(
        padding: EdgeInsets.all(AppDimens.dimen24),
        child: UiApi.iconText(
            text: "This is a permanent action and cannot be undone.",
            color: AppColors.redLight),
      ),
    );
    list.add(SizedBox(height: AppDimens.dimen50));

    return list;
  }
}
