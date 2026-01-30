import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';

class BaseScreenNotification extends BaseScreenStandard {
  ///Listen to notifications when scrolling
  void onNotificationListen(ScrollUpdateNotification notification) {}

  Widget bodyData(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  Widget body(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          onNotificationListen(notification);
        }
        return false; // Return false to allow the notification to continue to be dispatched.
      },
      child: bodyData(context),
    );
  }
}
