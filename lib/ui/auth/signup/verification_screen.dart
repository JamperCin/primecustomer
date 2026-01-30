import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_strings.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/view/signup_controller.dart';

class VerificationScreen extends BaseScreenStandard {
  final SignUpController controller = Get.put(SignUpController());

  VerificationScreen() {
    Utils.startTimer(1, () {
      controller.initTimerCheck();
    });
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  String appBarTitle() {
    return "Verification";
  }

  @override
  Color backgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppDimens.dimen16,
        left: AppDimens.dimen24,
        right: AppDimens.dimen24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: UiApi.assetImage("assets/images/ic_phone_verify.svg"),
            ),
            SizedBox(height: AppDimens.dimen40),
            Text(
              AppString.VERIFICATION_CODE_TEXT,
              style: AppTextStyles.descStyleLight,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.dimen40),
            UiApi.pinTextField(controller.verificationCode, codeLength: 6,
                call: (code) {
              dismissKeyBoard(context);
              controller.onLastPinEntered(code);
            }),
            SizedBox(height: AppDimens.dimen80),
            UiApi.button(
                text: "Verify",
                onPressed: () {
                  controller.setContext(context);
                  controller
                      .onLastPinEntered(controller.verificationCode.value);
                }),
            SizedBox(height: AppDimens.dimen20),
            Obx(
              () => Column(
                children: [
                  controller.timer.value.isEmpty
                      ? UiApi.textButton(
                          leadingText: "Didn't get the code?",
                          trailingText: "Resend Code",
                          onTap: () {
                            controller.setContext(context);
                            controller.confirmRequest(resendCode: true);
                          },
                        )
                      : const SizedBox(),
                  SizedBox(height: AppDimens.dimen20),
                ],
              ),
            ),
            Obx(
              () => controller.timer.value.isNotEmpty
                  ? UiApi.textButton(
                      leadingText: "You can request for a new code in",
                      trailingTextColor: AppColors.primaryGreenColor,
                      leadingStyle: AppTextStyles.subDescStyleLight,
                      trailingText: controller.timer.value,
                    )
                  : const SizedBox(),
            ),
            SizedBox(height: AppDimens.dimen50),
          ],
        ),
      ),
    );
  }
}
