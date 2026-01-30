import 'package:primecustomer/controller/view/e_fund_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_strings.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';
import 'package:get/get.dart';

class EfundIntroScreen extends BaseScreenStandard {
  EFundController controller = Get.put(EFundController());

  EfundIntroScreen() {
    controller.resetFundRequest();
  }

  @override
  String appBarTitle() {
    return "E-Fund";
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  CardModel getModel() {
    return baseObject as CardModel;
  }

  @override
  List<Widget> actions() {
    return [
      UiApi.textButton(
          trailingText: "Next",
          trailingTextColor: AppColors.primaryGreenColor,
          onTap: () {
            controller.onNextOnClick(getModel());
          })
    ];
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => controller.contacts.isEmpty
          ? Center(
              child: UiApi.noDataWidget(
              title: "Welcome  To E-Fund",
              asset: "assets/images/ic_efund.jpg",
              message: AppString.E_FUND_TEXT,
              padding: EdgeInsets.all(AppDimens.dimen24),
            ))
          : UiApi.listView(list: listView()),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    for (Contact c in controller.contacts) {
      list.add((UiApi.contactWidget(c, onDelete: (p) {
        controller.onDeletePhone(p);
      })));
    }
    list.add(SizedBox(height: AppDimens.dimen100));

    return list;
  }

  @override
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        size: AppDimens.dimen20,
        color: AppColors.white,
      ),
      onPressed: () {
        controller.onAddContact();
      },
    );
  }
}
