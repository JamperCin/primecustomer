import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteFriendsScreen extends BaseScreenStandard {
  final BaseController controller = Get.put(BaseController());

  @override
  String appBarTitle() {
    return "Invite Friends To Prime";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Column(
      children: [
        SizedBox(height: AppDimens.dimen20),
        Image.asset(
          "assets/images/ic_share_marketing.png",
        ),
        SizedBox(height: AppDimens.dimen40),
        Text(
          "Invite Friends And Families",
          style: AppTextStyles.titleStyleBold,
        ),
        SizedBox(height: AppDimens.dimen20),
        Text(
          "Share and invite friends and families to Prime to accrue more points-plus get access to our exclusive deals and flash sales. ",
          style: AppTextStyles.descStyleLight,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimens.dimen80),
        UiApi.button(
          child: UiApi.buttonChild(
              text: "Share Prime",
              icon: Icon(
                Icons.share,
                color: AppColors.white,
                size: AppDimens.dimen20,
              )),
          onPressed: () {
            controller.sharePrime();
          },
        ),
        SizedBox(height: AppDimens.dimen30),
      ],
    ));

    return list;
  }
}
