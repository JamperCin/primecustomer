import 'package:primecustomer/controller/view/settings_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends BaseScreenStandard {
  SettingsController controller = Get.put(SettingsController());

  @override
  String appBarTitle() {
    return "Settings";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
        list: listView(),
        padding: EdgeInsets.only(
          top: AppDimens.dimen20,
        ));
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    // list.add(UiApi.settingsItemWidget("Invite Friends And Families", () {
    //   controller.onInviteFriendsOnClick();
    // }));
    list.add(UiApi.settingsItemWidget("User Profile", () {
      controller.onProfileOnClick();
    }));

    list.add(UiApi.settingsItemWidget("Change My Number", () {
      controller.onChangeNumber();
    }));
    list.add(UiApi.settingsItemWidget("About Prime", () {
      controller.onAboutPrimeOnClick();
    }));

    list.add(SizedBox(height: AppDimens.dimen100));
    list.add(InkWell(
      onTap: () {
        controller.onDeleteAccountOnClick();
      },
      child: Center(
        child: Text(
          "Delete My Account",
          style:
              AppTextStyles.h5StyleMedium.copyWith(color: AppColors.redLight),
        ),
      ),
    ));

    return list;
  }
}
