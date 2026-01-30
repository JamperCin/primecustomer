import 'package:primecustomer/controller/view/forgot_password_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends BaseScreenStandard {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());

  ResetPasswordScreen() {
    controller.passwordTxt.clear();
    controller.confPasswordTxt.clear();
  }

  @override
  String appBarTitle() {
    return "Reset Password";
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.assetImage("assets/images/ic_phone_verify.svg"));
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(
      Text(
        "Set new password. Make sure you keep your password safe.",
        style: AppTextStyles.descStyleRegular,
        textAlign: TextAlign.center,
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen70));

    list.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: AppTextStyles.subDescRegular,
          ),
          SizedBox(height: AppDimens.dimen5),
          UiApi.textFormField(
            isPasswordField: true,
            hintText: 'Enter your password',
            obscuringCharacter: '*',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            controller: controller.passwordTxt,
          ),
          SizedBox(height: AppDimens.dimen15),
          Text(
            'Confirm Password',
            style:
                AppTextStyles.subDescRegular.copyWith(color: AppColors.black),
          ),
          SizedBox(height: AppDimens.dimen5),
          UiApi.textFormField(
            isPasswordField: true,
            hintText: 'Confirm your password',
            obscuringCharacter: '*',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            controller: controller.confPasswordTxt,
          ),
        ],
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen60));

    list.add(UiApi.button(
        text: "Submit",
        onPressed: () {
          controller.onConfirmPasswordReset();
        }));

    return list;
  }
}
