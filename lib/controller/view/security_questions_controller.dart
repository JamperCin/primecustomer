import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/model/remote/question.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityController extends BaseController {
  ///Questions Controller
  TextEditingController question1 = TextEditingController();
  TextEditingController question2 = TextEditingController();
  TextEditingController question3 = TextEditingController();

  ///Answers to the questions
  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();

  ///List of security Questions
  final RxList<Question> questionList = RxList<Question>();
  final List<Question> answeredQuestionList = [];

  ///Clear controllers
  void clearControllers() {
    question1.clear();
    question2.clear();
    question3.clear();
    answer1.clear();
    answer2.clear();
    answer3.clear();
    answeredQuestionList.clear();
  }

  ///Get all Available Security Questions
  void getSecurityQuestions() {
    webService?.getSecurityQuestions((response) {
      questionList.clear();
      questionList.addAll(response.data?.questions ?? []);
    });
  }

  void popUpListOfQuestions({required Function(Question question) callBack}) {
    ///Check if list of security questions is empty
    if (questionList.isEmpty) {
      getSecurityQuestions();
    }

    DialogsApi.showBottomSheet(
      title: "Select Question",
      padding: EdgeInsets.zero,
      containerSize: AppDimens.dimen500,
      backgroundColor: AppColors.white,
      child: Obx(
        () => UiApi.questionsWidget(questionList, (Question q) {
          callBack(q);
          NavApi.fireBack();
        }),
      ),
    );
  }

  Question getQuestion(Question q, int index) {
    return Question(id: q.id, createdAt: q.createdAt, index: index, ask: q.ask);
  }

  void saveQuestion(Question question, int index) {
    Question mMap = const Question();
    for (Question map in answeredQuestionList) {
      if (index == map.index) {
        mMap = map;
        break;
      }
    }

    answeredQuestionList.remove(mMap);
    answeredQuestionList.add(getQuestion(question, index));
  }

  bool isAllQuestionSelected() {
    if (ValidationUtils.validateDataEntry(question1,
        err: "Please select first question.")) {
      if (ValidationUtils.validateDataEntry(answer1,
          err: "Please answer first question.")) {
        if (ValidationUtils.validateDataEntry(question2,
            err: "Please select second question.")) {
          if (ValidationUtils.validateDataEntry(answer2,
              err: "Please answer second question.")) {
            if (ValidationUtils.validateDataEntry(question3,
                err: "Please select third question.")) {
              return ValidationUtils.validateDataEntry(answer3,
                  err: "Please answer third question.");
            }
          }
        }
      }
    }
    return false;
  }

  void initSavingQuestionsRequest() {
    if (isAllQuestionSelected()) {
      HashMap<String, Object> param = HashMap();
      HashMap<String, Object> answers = HashMap();
      List<Object> list = [];

      for (Question map in answeredQuestionList) {
        if (1 == map.index) {
          answers = HashMap();
          answers.putIfAbsent("question_id", () => map.id);
          answers.putIfAbsent("answer", () => getStringData(answer1));
          list.add(answers);
        }
        if (2 == map.index) {
          answers = HashMap();
          answers.putIfAbsent("question_id", () => map.id);
          answers.putIfAbsent("answer", () => getStringData(answer2));
          list.add(answers);
        }
        if (3 == map.index) {
          answers = HashMap();
          answers.putIfAbsent("question_id", () => map.id);
          answers.putIfAbsent("answer", () => getStringData(answer3));
          list.add(answers);
        }
      }

      param.putIfAbsent("answers", () => list);

      webService?.setNewSecurityQuestions(param, (response) {
        BaseController.isSecurityQuestionsAdded.value = true;
        prefUtils.setBool(PrefConstants.SECURITY_QUESTIONS, true);
        DialogsApi.popUpSuccessDialog(mContext!,
            mess:
                "Your security questions have successfully been saved. You will need to answer these questions during password reset",
            asset: "assets/images/ic_tick.png", call: () {
          NavApi.fireBack();
        });
      });
    }
  }
}
