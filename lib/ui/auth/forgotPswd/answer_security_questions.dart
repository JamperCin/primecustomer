import 'package:primecustomer/controller/view/forgot_password_controller.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerSeurityQuestions extends BaseScreenStandard {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  String appBarTitle() {
    return "Answer Security Questions";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
        list: listView(), padding: EdgeInsets.all(AppDimens.dimen25));
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.assetImage("assets/images/ic_phone_verify.svg"));
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(
      Text(
        "Please answer your security question. This will help us identify your identity to this account.",
        style: AppTextStyles.subDescStyleLight,
        textAlign: TextAlign.center,
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen70));

    list.add(
      Obx(
        () => Column(
          children: [
            Align(
              child: Text(
                controller.getQuestion().ask,
                style: AppTextStyles.titleStyleSemiBold,
              ),
            ),
            SizedBox(height: AppDimens.dimen20),
            UiApi.textFormField(
              hintText: "Answer",
              controller: controller.answerTxt,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen60));

    list.add(UiApi.button(
        text: "Submit",
        onPressed: () {
          controller.onSubmitAnswerOnClick();
        }));

    return list;
  }
}
