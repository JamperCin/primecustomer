import 'package:core_module/core/extensions/int_extension.dart';
import 'package:primecustomer/controller/view/notification_controller.dart';
import 'package:primecustomer/data/model/remote/notification_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

class NotificationScreen extends BaseScreenStandard {
  final NotificationController controller = Get.put(NotificationController());

  NotificationScreen() {
    controller.isDoneLoading.value = false;
    controller.notificationList.clear();

    Utils.startTimer(1, () {
      controller.getListOfNotifications();
    });
  }

  @override
  String appBarTitle() {
    return "Notifications";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  double appBarHeight() {
    return AppDimens.dimen60;
  }

 /* @override
  List<Widget> actions() {
    return [
      Padding(
        padding: EdgeInsets.only(
          right: AppDimens.dimen20,
          top: AppDimens.dimen5,
        ),
        child: Obx(
          () => UiApi.circleEmpty(
            padding: EdgeInsets.all(1.dp()),
            child: UiApi.bottomNavItem(
              icon: Icons.notifications,
              isBadge: true,
              badgeTextSize: AppDimens.dimen10,
              badgeTextPadding: 1.dp(),
              count: notificationCounter,
              iconSize: AppDimens.dimen28,
              iconColor: AppColors.deactivatedText,
              animKey: GlobalKey<AnimatorWidgetState>(),
            ),
          ),
        ),
      ),
    ];
  }*/

  @override
  Widget body(BuildContext context) {
    return Obx(() => controller.notificationList.isNotEmpty &&
            controller.isDoneLoading.value
        ? UiApi.listView(list: listView())
        : controller.notificationList.isEmpty && controller.isDoneLoading.value
            ? Center(
                child: UiApi.noDataWidget(
                asset: "assets/images/ic_notify.png",
                assetSize: AppDimens.dimen200,
                title: "Empty Notifications",
                message:
                    "You have no notifications in your inbox. All notifications "
                    "from your transactions and in-app notifications appears here.",
              ))
            : UiApi.loader(size: 4));
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(notificationWidget());

    return list;
  }

  Widget notificationWidget() {
    List<Widget> list = [];

    for (NotificationModel mod in controller.notificationList) {
      list.add(
          UiApi.notificationItem(mod, onTap: controller.onNotificationOnTap));
    }

    return Column(children: list);
  }
}
