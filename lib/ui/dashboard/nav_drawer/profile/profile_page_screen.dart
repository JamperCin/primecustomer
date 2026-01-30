import 'package:primecustomer/controller/view/profile_controller.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_stateful_dec.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfilePageScreen extends BaseScreenStatefulDecorated {
  ProfileController controller = Get.put(ProfileController());

  @override
  void initState(SingleTickerProviderStateMixin vsync) {
    super.initState(vsync);
    controller.prePopulateData();
  }

  @override
  double decoPageTopPadding() {
    return AppDimens.dimen5;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  Widget page(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  NavApi.fireBack();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: AppDimens.dimen20,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.onEditProfilePnClick();
                },
                child: Icon(Icons.edit, size: AppDimens.dimen20),
              ),
            ],
          ),
          Expanded(
            child: UiApi.listView(list: listView(), padding: EdgeInsets.zero),
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen30));
    list.add(
      Center(
        child: UiApi.getProfilePic(
          radius: AppDimens.dimen55,
          url: profilePicURl.value,
        ),
      ),
    );
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Joined",
          style: AppTextStyles.subDescRegular,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: AppDimens.dimen5),
        UiApi.divider(width: 1, height: AppDimens.dimen20),
        SizedBox(width: AppDimens.dimen5),
        Text(
          DateTimeUtils.formatDateString(prefUtils.getDateJoined(),
              format: "dd MMM yyyy"),
          style: AppTextStyles.subDescStyleSemiBold,
          textAlign: TextAlign.center,
        ),
      ],
    ));

    list.add(SizedBox(height: AppDimens.dimen70));
    list.add(Text(
      "Personal Information",
      style: AppTextStyles.titleStyleBold,
      textAlign: TextAlign.left,
    ));
    list.add(SizedBox(height: AppDimens.dimen10));

    list.add(Container(
      decoration: UiApi.deco(),
      padding: EdgeInsets.only(
        left: AppDimens.dimen10,
        top: AppDimens.dimen20,
        right: AppDimens.dimen20,
        bottom: AppDimens.dimen20,
      ),
      child: Column(
        children: [
          UiApi.rowIconText(
            icon: Icons.person,
            text: "Full Name",
            subText: controller.getFullName(),
          ),
          SizedBox(height: AppDimens.dimen30),
          UiApi.rowIconText(
            icon: Icons.call_sharp,
            text: "Contact Info",
            subText: controller.getPhone(),
          ),
          SizedBox(height: AppDimens.dimen30),
          UiApi.rowIconText(
            icon: Icons.mark_email_read_outlined,
            text: "Email",
            subText: controller.getEmailAddress(),
          ),
          SizedBox(height: AppDimens.dimen30),
          UiApi.rowIconText(
            icon: Icons.location_on,
            text: "Location",
            subText: controller.getLocationAddress(),
          ),
        ],
      ),
    ));
    list.add(SizedBox(height: AppDimens.dimen70));

    list.add(Center(
      child: InkWell(
        onTap: () {
          controller.onDeleteAccount();
        },
        child: Text(
          "Delete Account",
          style: AppTextStyles.h5StyleBold.copyWith(color: AppColors.red),
        ),
      ),
    ));

    return list;
  }
}
