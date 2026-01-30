import 'package:primecustomer/controller/view/more_controller.dart';
import 'package:primecustomer/data/model/display/drawer_model.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends BaseScreenStandard {
  final MoreController controller = Get.put(MoreController());

  @override
  String appBarTitle() {
    return "More";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen20));

    for (DrawerModel mod in controller.drawerList) {
      list.add(UiApi.moreMenuItemWidget(mod, onTap: (index) {
        controller.onChangeDrawer(index);
      }));
    }

    return list;
  }
}
