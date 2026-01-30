import 'package:primecustomer/controller/view/delete_account_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_strings.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyUserOtp extends BaseScreenStandard {
  DeleteAccountController controller = Get.put(DeleteAccountController());

  VerifyUserOtp({Function(String)? call}) {
    controller.verificationCode.value = "";
    Utils.startTimer(1, () {
      controller.initTimerCheck();

      CardModel cardModel = getModel();
      if (cardModel.phoneNumber.isNotEmpty) {
        controller.formattedPhoneNumber = cardModel.phoneNumber;
        controller.formattedOldPhoneNumber = cardModel.phoneNumber;
        controller.handleAfterOtp = call;
      }
    });
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) return baseObject as CardModel;

    return CardModel();
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
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
                            controller.initSendOtp(resendCode: true);
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
