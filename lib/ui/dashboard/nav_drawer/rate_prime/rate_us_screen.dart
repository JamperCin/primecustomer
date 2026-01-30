import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/app/app_dimens.dart';

class RateUsScreen extends BaseScreenStandard {
  final BaseController controller = Get.put(BaseController());
  @override
  String appBarTitle() {
    return "Rate Prime";
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
          "assets/images/ic_rate_us.png",
        ),
        SizedBox(height: AppDimens.dimen40),
        Text(
          "Rate Prime on ${controller.getStoreName()}",
          style: AppTextStyles.titleStyleBold,
        ),
        SizedBox(height: AppDimens.dimen20),
        Text(
          "Take time to rate Prime on the ${controller.getStoreName()}. This will go a long way for Prime. We really appreciate your feedback.",
          style: AppTextStyles.descStyleLight,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimens.dimen80),
        UiApi.button(
          child: UiApi.buttonChild(
              text: "Rate Prime",
              icon: Icon(
                Icons.thumb_up,
                color: AppColors.white,
                size: AppDimens.dimen20,
              )),
          onPressed: () {
            controller.manualRequestReview();
          },
        ),
        SizedBox(height: AppDimens.dimen30),
      ],
    ));

    return list;
  }
}
