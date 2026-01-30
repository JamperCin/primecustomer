import 'package:primecustomer/controller/view/forgot_password_controller.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPinScreen extends BaseScreenStandard {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());

  ResetPinScreen() {
    controller.clear();
  }

  @override
  String appBarTitle() {
    return "Reset Pin";
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

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.assetImage("assets/images/ic_phone_verify.svg"));
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(
      Text(
        "Set new Pin on your account. Make sure you keep your pin safe. You’ll be required to confirm all transactions with this Passcode/Pin",
        style: AppTextStyles.descStyleRegular,
        textAlign: TextAlign.center,
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen70));

    list.add(
      UiApi.pinTextField(controller.securityPin, codeLength: 4, call: (code) {
        dismissKeyBoard(mContext!);
      }),
    );
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(
      Text(
        "Enter your new four-digit Passcode/Pin",
        style: AppTextStyles.descStyleRegular,
        textAlign: TextAlign.center,
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen80));

    list.add(UiApi.button(
        text: "Submit",
        onPressed: () {
          controller.onConfirmPinReset();
        }));

    return list;
  }
}
