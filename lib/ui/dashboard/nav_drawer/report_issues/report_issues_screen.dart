import 'package:primecustomer/controller/view/report_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportIssueScreen extends BaseScreenStandard {
  final ReportController controller = Get.put(ReportController());

  @override
  String appBarTitle() {
    return "Report Issue";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppDimens.dimen30),
            UiApi.assetImage("assets/images/ic_feedback.png"),
            SizedBox(height: AppDimens.dimen30),
            UiApi.textArea(controller.reportTxt,
                onChanged: controller.onTextChanged),
            SizedBox(height: AppDimens.dimen30),
            Obx(
              () => UiApi.button(
                  text: "Submit",
                  backgroundColor: controller.isValidForm.value
                      ? AppColors.introColor2
                      : AppColors.dimWhite,
                  onPressed: () {
                    controller.onSubmitOnClick();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
