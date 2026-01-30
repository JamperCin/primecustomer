import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/remote/notification_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/ui/dashboard/notification/notification_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NotificationController extends BaseController {
  RxList<NotificationModel> notificationList = RxList<NotificationModel>();
  RxBool isDoneLoading = false.obs;
  RxBool isLoadingMore = false.obs;

  void getListOfNotifications() {
    isDoneLoading.value = false;
    webService?.getNotifications((response) {
      isDoneLoading.value = true;
      notificationList.clear();
      notificationList.addAll(response.data?.notifications ?? []);
      //addNotification();
      notificationCounter.value = notificationList.length;
    });
  }

  void addNotification() {
    notificationList.add(NotificationModel(
      title: "Samuel responded to your card",
      type: "Card Purchase",
      createdAt: "35 mins ago",
      emoji: "❤",
      body:
          "Hello i just responded to your card and i hope you doing good. I just bought you another card for xmas. Kindly send my greetings to all the family",
      sender:
          "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?cs=srgb&dl=pexels-suliman-sallehi-1704488.jpg&fm=jpg",
    ));

    notificationList.add(NotificationModel(
      title: "Linda responded to your redemption",
      type: "Card Purchase",
      createdAt: "1 month ago",
      emoji: "😍",
      body:
          "Hello i just responded to your card and i hope you doing good. I just bought you another card for xmas. Kindly send my greetings to all the family",
      sender:
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
    ));

    notificationList.add(NotificationModel(
      title: "Hello Jones responded to your card",
      type: "Card Purchase",
      createdAt: "1 week ago",
      emoji: "😇",
      body:
          "Hello i just responded to your card and i hope you doing good. I just bought you another card for xmas. Kindly send my greetings to all the family",
      sender:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPehc8rVewAwJzXHroVsbwRUWVOfRg4frqmw&usqp=CAU",
    ));

    notificationList.add(NotificationModel(
      title: "Samuel responded to your card",
      type: "Card Purchase",
      createdAt: "3 days ago",
      emoji: "🤝",
      body:
          "Hello i just responded to your card and i hope you doing good. I just bought you another card for xmas. Kindly send my greetings to all the family",
    ));

    notificationList.add(NotificationModel(
      title: "Samuel responded to your card",
      type: "Card Purchase",
      createdAt: "15 mins ago",
      emoji: "🙏",
      body:
          "Hello i just responded to your card and i hope you doing good. I just bought you another card for xmas. Kindly send my greetings to all the family",
      sender:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2iD6awG7ugwALMWGiwNVjjIPGu58gfRKhEg&usqp=CAU",
    ));

    notificationList.add(NotificationModel(
      title: "Samuel responded to your card",
      type: "Card Purchase",
      createdAt: "23 mins ago",
      emoji: "🐕",
      body:
          "Hello i just responded to your card and i hope you doing good. I just bought you another card for xmas. Kindly send my greetings to all the family",
      sender:
          "https://i.pinimg.com/736x/5b/e6/64/5be664a6ffc0978a5a9102bd66ce294a.jpg",
    ));

    notificationList.add(NotificationModel(
      title: "Samuel responded to your card",
      type: "Card Purchase",
      createdAt: "1 min ago",
      emoji: "🤢",
      body:
          "Hello i just responded to your card and i hope you doing good. I just bought you another card for xmas. Kindly send my greetings to all the family",
      sender: "https://wallpaperaccess.com/full/2213424.jpg",
    ));
  }

  void onNotificationOnTap(NotificationModel model) {
    navUtils.fireTarget(NotificationDetailsScreen(), model: model);
    // DialogsApi.popUpNormalDialog(
    //   mContext!,
    //   dismissIcon: true,
    //   title: model.title.isEmpty ? "Notification" : model.title,
    //   asset: "assets/images/ic_notify.png",
    //   child: Text(model.body, style: AppTextStyles.descStyleLight),
    // );
  }
}
