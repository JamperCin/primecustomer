import 'package:primecustomer/controller/view/bio_pin_controller.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_dec.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseAuthScreen extends BaseScreenDecorated {
  BioPinController controller = Get.put(BioPinController());
  Function? call;

  BaseAuthScreen({this.call}) {
    controller.pinCode = "";
    controller.pos.value = 0;
    controller.bioApi.getAvailableBiometrics();
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
  bool rotateAsset() {
    return true;
  }

  @override
  String decoPageAsset() {
    return "assets/images/ic_card_cluster.png";
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
          child: UiApi.getProfilePic(radius: AppDimens.dimen35)),
    );

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(Center(
      child: Text("Enter your passcode",
          style: AppTextStyles.h5StyleRegular
              .copyWith(color: AppColors.introColor2)),
    ));

    list.add(SizedBox(height: AppDimens.dimen30));
    list.add(UiApi.pinEntryWidget(4, controller.pos));
    list.add(SizedBox(height: AppDimens.dimen30));
    list.add(UiApi.pinNumberWidget(["1", "2", "3"], onTap: (val) {
      controller.onPinClicked(val, call: call);
    }));
    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(UiApi.pinNumberWidget(["4", "5", "6"], onTap: (val) {
      controller.onPinClicked(val, call: call);
    }));

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(UiApi.pinNumberWidget(["7", "8", "9"], onTap: (val) {
      controller.onPinClicked(val, call: call);
    }));

    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(UiApi.pinNumberWidget([bio(), "0", delete()], onTap: (val) {
      controller.onPinClicked(val, call: call);
    }));

    list.add(SizedBox(height: AppDimens.dimen70));
    list.add(
      Center(
        child: InkWell(
          onTap: () {
            NavApi.fireBack();
          },
          child: Text(
            "Cancel?",
            style: AppTextStyles.descStyleRegular
                .copyWith(color: AppColors.introColor2),
          ),
        ),
      ),
    );

    return list;
  }

  Widget bio() {
    return controller.bioApi.bioWidget(
        color: AppColors.introColor2,
        call: () {
          NavApi.fireBack();
          if (call != null) {
            call!();
          }
        });
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
