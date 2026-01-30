import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:primecustomer/data/model/remote/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationDetailsScreen extends BaseScreenStandard {
  @override
  NotificationModel getModel() {
    return baseObject as NotificationModel;
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  String appBarTitle() {
    return "Notifications";
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 20.dp()),
      child: Column(
        children: [
          Center(
            child: AssetImageWidget(
              asset: "assets/images/ic_notify.png",
              height: appDimen.screenHeight * 0.3,
              width: appDimen.screenWidth * 0.8,
            ),
          ),
          SizedBox(height: 10.dp()),
          Text(getModel().title, style: textTheme.titleLarge),
          SizedBox(height: 10.dp()),
          Text(getModel().body, style: textTheme.bodyMedium),
          if (getModel().sender.isNotEmpty)
            Text(getModel().sender, style: textTheme.bodyMedium),
          if (getModel().emoji.isNotEmpty)
            Text(getModel().emoji, style: textTheme.bodyMedium),
          SizedBox(height: 10.dp()),
        ],
      ),
    );
  }
}
