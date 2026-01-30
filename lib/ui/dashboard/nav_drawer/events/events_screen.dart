import 'package:primecustomer/controller/view/event_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderEventsScreen extends BaseScreenStandard {
  EventController controller = Get.put(EventController());

  @override
  String appBarTitle() {
    return "Events";
  }

  @override
  Widget body(BuildContext context) {
    return Column(children: listView());
  }

  @override
  List<Widget> actions() {
    return [
      Padding(
        padding: EdgeInsets.only(right: AppDimens.dimen20),
        child: UiApi.circleEmpty(
          onTap: () {},
          size: AppDimens.dimen30,
          child: Icon(
            Icons.add,
            color: AppColors.primaryGreenColor,
            size: AppDimens.dimen18,
          ),
        ),
      )
    ];
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(
      Expanded(
        child: UiApi.noDataWidget(
          asset: "assets/images/ic_events.jpg",
          assetSize: AppDimens.dimen250,
          title: "No Scheduled Events",
          message:
              "This space is intended to save all your special events like birthdays, "
              "father's days or that special occasion.\n\nFeel free to add events and Prime will take care of the rest.",
        ),
      ),
    );
    list.add(Padding(
      padding: EdgeInsets.only(
        bottom: AppDimens.dimen50,
        top: AppDimens.dimen20,
      ),
      child: UiApi.button(
        text: "Add Event",
        backgroundColor: AppColors.white,
        borderColor: AppColors.primaryGreenColor,
        textColor: AppColors.primaryGreenColor,
        onPressed: () {},
      ),
    ));

    return list;
  }
}
