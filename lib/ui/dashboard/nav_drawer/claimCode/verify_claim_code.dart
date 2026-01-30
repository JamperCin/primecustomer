import 'package:primecustomer/controller/view/claim_code_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyClaimCode extends BaseScreenStandard {
  final ClaimCodeController controller = Get.put(ClaimCodeController());

  VerifyClaimCode() {
    controller.pinCode.value = "";
  }

  @override
  String appBarTitle() {
    return "Verify Code";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(UiApi.assetImage("assets/images/ic_success_pin.png"));

    list.add(SizedBox(height: AppDimens.dimen30));

    list.add(Obx(
      () => Text(
        controller.isPromoCode.value
            ? "Claim Promo Code"
            : "Claim 16-Digit Gift Code",
        style: AppTextStyles.h5StyleBold,
        textAlign: TextAlign.center,
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen10));

    list.add(Text(
      "Enter the 6-digit code sent to your phone number.",
      style: AppTextStyles.descStyleLight,
      textAlign: TextAlign.center,
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(
        UiApi.pinTextField(controller.pinCode, codeLength: 6, call: (code) {
      dismissKeyBoard(mContext!);
    }));

    list.add(SizedBox(height: AppDimens.dimen100));

    list.add(UiApi.button(
        text: "Verify",
        onPressed: () {
          controller.verifyCode();
        }));

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(
      Obx(
        () => Column(
          children: [
            controller.timer.value.isEmpty
                ? UiApi.textButton(
                    leadingText: "Didn't get the code?",
                    trailingText: "Resend Code",
                    onTap: () {
                      controller.pinCode.value = "";
                      controller.initCodeClaim(resendCode: true);
                    },
                  )
                : const SizedBox(),
            SizedBox(height: AppDimens.dimen20),
          ],
        ),
      ),
    );

    list.add(
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
    );

    return list;
  }
}
