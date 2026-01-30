import 'package:core_module/core_ui/base_screen/base_screen_dec.dart';
import 'package:primecustomer/controller/view/bio_pin_controller.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BioPinLoginScreen extends BaseScreenDecorated {
  BioPinController controller = Get.put(BioPinController());

  BioPinLoginScreen() {
    controller.bioApi.getAvailableBiometrics();
    prefUtils.setLogin(false);
    Utils.startTimer(2, () {
      controller.checkForAppUpdate();
      controller.checkForUnverifiedAccount();
    });
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  String decoPageAsset() {
    return "assets/images/ic_cluster_cards.png";
  }

  @override
  bool rotateAsset() {
    return true;
  }

  @override
  double decoPageTopPadding() {
    return 0;
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];
    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(
      UiApi.circleEmpty(
          padding: EdgeInsets.all(AppDimens.dimen2),
          child: UiApi.getProfilePic(
              url: prefUtils.getProfilePic(), radius: AppDimens.dimen35)),
    );

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(Center(
      child: Text("Enter your passcode",
          style: AppTextStyles.h5StyleRegular
              .copyWith(color: AppColors.introColor2)),
    ));

    list.add(SizedBox(height: AppDimens.dimen30));
    list.add(UiApi.pinEntryWidget(4, controller.pos));
    list.add(SizedBox(height: AppDimens.dimen50));
    list.add(UiApi.pinNumberWidget(["1", "2", "3"], onTap: (val) {
      controller.onPinClicked(val);
    }));
    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(UiApi.pinNumberWidget(["4", "5", "6"], onTap: (val) {
      controller.onPinClicked(val);
    }));

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(UiApi.pinNumberWidget(["7", "8", "9"], onTap: (val) {
      controller.onPinClicked(val);
    }));

    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(UiApi.pinNumberWidget([bio(), "0", delete()], onTap: (val) {
      controller.onPinClicked(val);
    }));

    list.add(SizedBox(height: AppDimens.dimen70));
    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              controller.onForgotPinOnClick();
            },
            child: Text(
              "Forgot Passcode?",
              style: AppTextStyles.descStyleRegular
                  .copyWith(color: AppColors.introColor2),
            ),
          ),
          InkWell(
            onTap: () {
              controller.onGoToLogin();
            },
            child: Row(
              children: [
                Text(
                  "LogIn",
                  style: AppTextStyles.descStyleBold
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(width: AppDimens.dimen5),
                Icon(Icons.person, size: AppDimens.dimen18)
                /*UiApi.assetImage(
                  "assets/images/ic_logout.png",
                  height: AppDimens.dimen18,
                  width: AppDimens.dimen18,
                  assetColor: AppColors.primaryGreenColor,
                ),*/
              ],
            ),
          ),
        ],
      ),
    );

    return list;
  }

  Widget bio() {
    return Obx(
      () => controller.isStartedBioLogIn.value
          ? UiApi.circularProgressIndicator(radius: AppDimens.dimen16)
          : controller.bioApi.bioWidget(
              color: AppColors.introColor2,
              call: () {
                Utils.startTimer(1, () => controller.initLoginRequest());
              },
            ),
    );
  }

  Widget delete() {
    return UiApi.delPinWidget(onTap: () {
      controller.onDeleteOnClick();
    });
  }

  @override
  Widget page(BuildContext context) {
    return Center(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.only(
          top: AppDimens.dimen16,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        itemCount: listView().length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) => listView()[index],
      ),
    );
  }
}
