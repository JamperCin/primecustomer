import 'package:primecustomer/controller/view/guest_controller.dart';
import 'package:primecustomer/data/enum/guest_staging.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GuestUserSignUp extends BaseScreenStandard {
  final GuestController controller = Get.put(GuestController());

  GuestUserSignUp() {
    controller.clear();
  }

  @override
  String appBarTitle() {
    return "Sign Up";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => guestUserInfoWidget(context));
  }

  Widget guestUserInfoWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppDimens.dimen20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (guestStage.value != GuestStage.success) &&
                    (guestStage.value != GuestStage.hasAccountAlready)
                ? Column(
                    children: [
                      SizedBox(height: AppDimens.dimen20),
                      UiApi.assetImage("assets/images/ic_phone_verify.svg"),
                    ],
                  )
                : const SizedBox(),
            SizedBox(height: AppDimens.dimen50),
            Center(child: baseWidget()),
          ],
        ),
      ),
    );
  }

  Widget baseWidget() {
    switch (guestStage.value) {
      case GuestStage.verifyPhone:
        return verifyPhone();
      case GuestStage.init:
        return verifyPhone();
      case GuestStage.verifyOtp:
        return verifyOtp();
      case GuestStage.hasAccountAlready:
        return hasAccountAlready();
      case GuestStage.success:
        return successGuestSignUp();
      case GuestStage.loading:
        return UiApi.circularProgressBar(radius: AppDimens.dimen80);
      case GuestStage.payment:
        return const SizedBox();
    }
  }

  Widget verifyPhone() {
    return Column(
      children: [
        Text(
          "Enter Your Phone Number to receive a 4-digit PIN for verification",
          style: AppTextStyles.descStyleLight,
        ),
        SizedBox(height: AppDimens.dimen10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: UiApi.textFormField(
                enabled: false,
                hintText: '+233',
                controller: controller.guestCountryCodeTxt,
                onTap: () {
                  controller.onGuestPickCountryCode();
                },
              ),
              flex: 1,
            ),
            SizedBox(width: AppDimens.dimen10),
            Flexible(
              child: UiApi.textFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  hintText: 'Phone Number',
                  controller: controller.guestUserPhoneTxt,
                  focusColor: controller.isGuestPhoneNumberValid.value
                      ? null
                      : AppColors.red,
                  onChanged: (value) {
                    controller.liveValidateGuestPhoneNum();
                  }),
              flex: 3,
            ),
          ],
        ),
        SizedBox(height: AppDimens.dimen5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            controller.validGuestPhoneString.value,
            style: AppTextStyles.style(
              style: AppTextStyles.smallerSubDescStyleRegular,
              color: controller.isGuestPhoneNumberValid.value
                  ? AppColors.primaryGreenColor
                  : AppColors.red,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(height: AppDimens.dimen100),
        UiApi.button(
          text: "Submit",
          backgroundColor: controller.isGuestPhoneNumberValid.value
              ? AppColors.primaryGreenColor
              : AppColors.textGrey,
          borderColor: controller.isGuestPhoneNumberValid.value
              ? AppColors.primaryGreenColor
              : AppColors.textGrey,
          onPressed: () {
            controller.submitGuestPhoneForVerification();
          },
        ),
      ],
    );
  }

  Widget verifyOtp() {
    return Column(
      children: [
        Text(
          "Enter the 4-digit code sent to your phone number.",
          style: AppTextStyles.descStyleSemiBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimens.dimen40),
        UiApi.pinTextField(controller.guestUserOtpCode,
            codeLength: 4, observable: false, call: (code) {
          dismissKeyBoard(mContext!);
          controller.submitOtpForVerification();
        }),
        SizedBox(height: AppDimens.dimen40),
        controller.timer.value.isEmpty
            ? UiApi.textButton(
                leadingText: "Didn't get the code?",
                trailingText: "Resend Code",
                onTap: () {
                  controller.guestUserOtpCode.value = "";
                  controller.submitGuestPhoneForVerification();
                },
              )
            : const SizedBox(),
        SizedBox(height: AppDimens.dimen20),
        controller.timer.value.isNotEmpty
            ? UiApi.textButton(
                leadingText: "You can request for a new code in",
                trailingTextColor: AppColors.primaryGreenColor,
                leadingStyle: AppTextStyles.subDescStyleLight,
                trailingText: controller.timer.value,
              )
            : const SizedBox(),
      ],
    );
  }

  Widget successGuestSignUp() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppDimens.dimen5),
        UiApi.assetImage("assets/images/ic_tick.png"),
        SizedBox(height: AppDimens.dimen20),
        Text(
          "SUCCESS !!!",
          style: AppTextStyles.h3StyleBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimens.dimen40),
        UiApi.richText(
          maxLines: 6,
          textAlign: TextAlign.center,
          style: AppTextStyles.descStyleLight
              .copyWith(letterSpacing: .5, wordSpacing: 2.0, height: 1.5),
          mod: [
            RichTextModel(text: "An account has been created for "),
            RichTextModel(
              text: controller.formattedGuestPhoneNumber,
              style: AppTextStyles.descStyleBold,
            ),
            RichTextModel(text: ". The "),
            RichTextModel(
              text: "4-digit verification code ",
              style: AppTextStyles.descStyleBold,
            ),
            RichTextModel(text: "will be your temporal PIN to login. "),
            RichTextModel(text: "You can reset your PIN using the "),
            RichTextModel(
              text: "reset PIN ",
              style: AppTextStyles.descStyleBold,
            ),
            RichTextModel(text: "feature."),
          ],
        ),
        SizedBox(height: AppDimens.dimen20),
        UiApi.circularProgressIndicator(radius: AppDimens.dimen16),
        SizedBox(height: AppDimens.dimen20),
      ],
    );
  }

  Widget hasAccountAlready() {
    List<Widget> list = [];
    list.add(Text(
      "Already Having an Account?",
      style: AppTextStyles.descStyleBold,
    ));
    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(UiApi.pinEntryWidget(4, controller.pos));

    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(Text(
      "Verify your Passcode/Pin to proceed",
      style: AppTextStyles.subDescStyleLight,
    ));
    list.add(SizedBox(height: AppDimens.dimen40));

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

    list.add(UiApi.pinNumberWidget(["", "0", delete()], onTap: (val) {
      controller.onPinClicked(val);
    }));

    return Column(children: list);
  }

  Widget delete() {
    return UiApi.delPinWidget(onTap: () {
      controller.onDeleteOnClick();
    });
  }
}
