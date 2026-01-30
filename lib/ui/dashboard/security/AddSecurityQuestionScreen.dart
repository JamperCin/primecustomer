import 'package:primecustomer/controller/view/security_questions_controller.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSecurityQuestionScreen extends BaseScreenStandard {
  SecurityController controller = Get.put(SecurityController());

  AddSecurityQuestionScreen() {
    controller.clearControllers();
    Utils.startTimer(1, () {
      controller.getSecurityQuestions();
    });
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  String appBarTitle() {
    return "Set Up Security Questions";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(
      Text(
        "Please add security question to your account.",
        style: AppTextStyles.titleStyleRegular,
        textAlign: TextAlign.center,
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(Text(
      "This will help us verify your identity whenever a change of password is required or a change of credentials needs to be done.",
      style: AppTextStyles.subDescStyleLight,
      textAlign: TextAlign.center,
    ));

    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(questionWidget(
        quesCtrl: controller.question1,
        ansCtrl: controller.answer1,
        onTap: () {
          controller.popUpListOfQuestions(callBack: (question) {
            controller.question1.text = question.ask;
            controller.questionList.remove(question);
            controller.saveQuestion(question, 1);
          });
        }));

    list.add(questionWidget(
        quesCtrl: controller.question2,
        ansCtrl: controller.answer2,
        onTap: () {
          controller.popUpListOfQuestions(callBack: (question) {
            controller.question2.text = question.ask;
            controller.questionList.remove(question);
            controller.saveQuestion(question, 2);
          });
        }));

    list.add(questionWidget(
        quesCtrl: controller.question3,
        ansCtrl: controller.answer3,
        onTap: () {
          controller.popUpListOfQuestions(callBack: (question) {
            controller.question3.text = question.ask;
            controller.questionList.remove(question);
            controller.saveQuestion(question, 3);
          });
        }));

    list.add(SizedBox(height: AppDimens.dimen30));
    list.add(UiApi.button(
        text: "Submit",
        onPressed: () {
          controller.initSavingQuestionsRequest();
        }));

    return list;
  }

  Widget questionWidget({
    required TextEditingController quesCtrl,
    required TextEditingController ansCtrl,
    GestureTapCallback? onTap,
  }) {
    return Column(
      children: [
        UiApi.textFormField(
          controller: quesCtrl,
          suffixIcon: Icon(Icons.keyboard_arrow_down, size: AppDimens.dimen25),
          labelText: "Select Question",
          // maxLines: 2,
          enabled: false,
          onTap: onTap,
        ),
        SizedBox(height: AppDimens.dimen10),
        UiApi.textFormField(
          labelText: "Answer",
          style: AppTextStyles.descStyleSemiBold,
          controller: ansCtrl,
          textInputAction: TextInputAction.done,
        ),
        SizedBox(height: AppDimens.dimen40),
      ],
    );
  }
}
