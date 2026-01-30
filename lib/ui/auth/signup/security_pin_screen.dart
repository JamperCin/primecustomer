import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/view/signup_controller.dart';
import '../../../data/model/remote/base/base_response_model.dart';
import '../../../res/app/app_dimens.dart';
import '../../../res/app/app_text_styles.dart';
import '../../../res/ui_helpers/ui_api.dart';

class SecurityPinScreen extends BaseScreenStandard {
  final SignUpController controller = Get.put(SignUpController());

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  String appBarTitle() {
    return "Set Passcode/Pin";
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  BaseResponseModel getModel() {
    return super.getModel() as BaseResponseModel;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppDimens.dimen32,
          left: AppDimens.dimen24,
          right: AppDimens.dimen24,
        ),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/images/ic_phone_verify.svg",
                height: AppDimens.dimen150,
              ),
            ),
            SizedBox(height: AppDimens.dimen40),
            Text(
              "Almost Done!!!\nAdd your Passcode/Pin",
              style: AppTextStyles.h3StyleBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.dimen20),
            Text(
              "Please do not share this pin with anyone. You’ll be required to confirm all transactions with this Passcode/Pin.",
              style: AppTextStyles.descStyleRegular,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.dimen50),
            UiApi.pinTextField(controller.securityPin, codeLength: 4,
                call: (code) {
              dismissKeyBoard(context);
            }),
            SizedBox(height: AppDimens.dimen10),
            Text(
              "Set your 4-digit pin",
              style: AppTextStyles.subDescStyleLight,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.dimen100),
            UiApi.button(
                text: "Continue",
                onPressed: () {
                  controller.onConfirmSecurityPin();
                }),
          ],
        ),
      ),
    );
  }
}
