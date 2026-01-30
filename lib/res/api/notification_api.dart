import 'dart:convert' as convert;
import 'dart:io';

import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/enum/notification_type.dart';
import 'package:primecustomer/data/model/remote/notification_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/file_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../main.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final _onNotificationClickHandler = BehaviorSubject<String?>();
  static NotificationType _notificationType = NotificationType.NORMAL;

  ///Initialise Notification api with predefined Settings
  ///Make Sure to call this method in your [main.dart]
  ///@param [ initSchedule] This determines if you can use the scheduling feature of notification
  ///This allows you to set Date and Time when the notification should be executed
  static Future init({bool initSchedule = false}) async {
    const androidSettings = AndroidInitializationSettings("@drawable/prime");
    // const iosSettings = IOSInitializationSettings();
    const initSettingsDarwin = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: initSettingsDarwin,
    );

    //Initialise Notification
    _notifications.initialize(settings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
        onDidReceiveBackgroundNotificationResponse:
            onDidReceiveBackgroundNotificationResponse);

    //When app is closed or quit register listener to onClicks of notification
    _notifications.getNotificationAppLaunchDetails().then((details) {
      if (details != null && details.didNotificationLaunchApp) {
        debugPrint("Quit ==== Receiver");
        //_onNotificationClickHandler.add(details.payload);
      }
    });

    //Use this function to listen to notifications
    //Handlers to listen to notification onClicks, Cancel flags etc
    //check the notification type
    _onNotificationClickHandler.stream.listen((event) {
      listToNotificationsOnClick(event);
    });

    if (initSchedule) {
      _initTimeZone();
    }
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  static void onDidReceiveNotificationResponse(NotificationResponse payload) {
    debugPrint("Running ==== Receiver");
    _onNotificationClickHandler.add(payload.payload);
  }

  static void onDidReceiveBackgroundNotificationResponse(
      NotificationResponse details) {}

  //Request for user permission to allow notifications
  static Future<bool> requestPermission() async {
    // FlutterLocalNotificationsPlugin fnp = FlutterLocalNotificationsPlugin();
    // fnp
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.requestNotificationsPermission();

    bool? isPermissionAccepted = await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (Platform.isIOS) {
      final iosPlugin = _notifications.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();

      isPermissionAccepted = await iosPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    return isPermissionAccepted ?? false;
  }

  ///Init TimeZone Database
  static Future _initTimeZone() async {
    tz.initializeTimeZones();
    final locationName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(locationName));
  }

  ///Define Notification details for both Android and IOS
  static Future _notificationDetails({
    String? file,
    customSound = "coins.wav",
  }) async {
    final icon =
        await FileUtils.downloadFile(AssetsConfig.PRIME_ICON, "largeIcon.jpg");
    BigPictureStyleInformation? androidStyle;
    String? bigPicturePath;

    ///Check if big Picture is needed
    if (file != null && file.isNotEmpty) {
      bigPicturePath = await FileUtils.downloadFile(file, "bigPicture.jpg");

      androidStyle = BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath),
        largeIcon: FilePathAndroidBitmap(icon),
      );
    }

    return NotificationDetails(
        android: AndroidNotificationDetails(
          'PRIME_ID',
          'PRIME_CHANNEL',
          channelDescription: 'PRIME_CHANNEL_DESC',
          importance: Importance.high,
          styleInformation: androidStyle,
          channelShowBadge: true,
          sound:
              RawResourceAndroidNotificationSound(customSound.split(".").first),
        ),
        iOS: DarwinNotificationDetails(
          badgeNumber: notificationCounter.value,
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          sound: customSound,
          attachments: bigPicturePath == null
              ? null
              : <DarwinNotificationAttachment>[
                  DarwinNotificationAttachment(bigPicturePath)
                ],
        ));
  }

  ///Show simple Notification on a device
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    String? largePicture, //= AppStrings.PRIME_ICON,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(file: largePicture),
        payload: payload,
      );

  ///Play notification ONCE at a scheduled DateTime
  ///Show a scheduled simple Notification on a device
  ///Sample date will be like [DateTimeUtils.convertDateFromString("2021-09-20 22:39:00")]
  ///This is used when you need to play a notification at a particular date and Time once.
  // static Future showScheduledNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? payload,
  //   required DateTime scheduledDate,
  // }) async =>
  //     _notifications.zonedSchedule(
  //       id,
  //       title,
  //       body,
  //       tz.TZDateTime.from(scheduledDate, tz.local),
  //       await _notificationDetails(),
  //       payload: payload,
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //     );

  ///Show REPEATED Notification each day an exact Time
  ///Show a scheduled simple Notification on a device
  ///Eg: Time passed can be @[Time(8,30,0)]  Every morning : 08:30:00 AM
  // static Future showDailyScheduledNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? payload,
  //   required TimeOfDay time,
  // }) async =>
  //     _notifications.zonedSchedule(
  //       id,
  //       title,
  //       body,
  //       _scheduleDailyAtExactTime(
  //           time), //Schedule this Notification every morning 8 AM
  //       await _notificationDetails(),
  //       payload: payload,
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //       matchDateTimeComponents: DateTimeComponents.time,
  //     );

  ///Show REPEATED notifications on specific days at an exact Time
  ///Show a scheduled simple Notification on a device
  ///Time passed can be @[Time(8,30,0)]  Every morning : 08:30:00 AM
  ///List of days can be like eg.: [DateTime.monday, DateTime.wednesday]
  // static Future showSpecificDaysScheduledNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? payload,
  //   required TimeOfDay time,
  //   List<int> days = const [],
  // }) async =>
  //     _notifications.zonedSchedule(
  //       id,
  //       title,
  //       body,
  //       _scheduleSpecificDays(time, days: days),
  //       await _notificationDetails(),
  //       payload: payload,
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //       matchDateTimeComponents: DateTimeComponents.time,
  //     );

  ///Create a daily scheduled Time
  static tz.TZDateTime _scheduleDailyAtExactTime(TimeOfDay time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      // time.second,
    );

    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  ///Create specific week days scheduled Time
  static tz.TZDateTime _scheduleSpecificDays(TimeOfDay time,
      {List<int> days = const []}) {
    tz.TZDateTime scheduledDate = _scheduleDailyAtExactTime(time);

    while (!days.contains(scheduledDate.weekday)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }

  ///Use this function to listen to notifications
  ///Handlers to listen to notification onClicks, Cancel flags etc
  static void listToNotificationsOnClick(event) {
    debugPrint("SELECTED  UNCONVERTED $event");
    var jsonResponse = Utils.convertDecode(event);
    NotificationModel model = NotificationModel.fromJson(jsonResponse);
    Utils.printLog(" \n\nRESPONSE ${model.toJson().toString()}\n\n");
  }

  static void cancel(int id) => _notifications.cancel(id);

  static void cancelAll() => _notifications.cancelAll();

  ///Call this method anytime FCM is fired to show a notification
  static void notifyFcm(RemoteMessage msg) {
    String? title;
    String? message;
    String? payload;
    PrimeCardModel card = const PrimeCardModel();
    Map<String, dynamic> data = {};

    if (msg.notification != null) {
      RemoteNotification rmt = msg.notification ?? const RemoteNotification();
      message = rmt.body;
      title = rmt.title ?? "Prime";
    }

    data = msg.data;
    _getNotificationType(data.containsKey("type") ? data["type"] : null);

    if (_notificationType == NotificationType.CARD_PUBLISHED) {
      card = _getCardPublished(data);
      payload = card.toJson().toString();
    }

    debugPrint(
        "NOTIF : ${msg.toMap().toString()} == $title ==== $message === == $_notificationType ===${data.toString()}");

    notificationCounter.value++;

    showNotification(
      title: title,
      body: message,
      payload: payload,
      largePicture: card.image,
    );
  }

  static PrimeCardModel _getCardPublished(Map<String, dynamic> json) {
    if (json.containsKey("card")) {
      try {
        var card = json["card"];
        var map = <String, dynamic>{};
        if (card is String) {
          map = convert.jsonDecode(card);
        } else if (card is Map<String, dynamic>) {
          map = card;
        }

        return PrimeCardModel.fromJson(map);
      } catch (e) {
        debugPrint("CARD EXCEP ${e.toString()}");
      }
    }

    return const PrimeCardModel();
  }

  static void _getNotificationType(String? type) {
    if (type == null || type.isEmpty) {
      _notificationType = NotificationType.NORMAL;
      return;
    }
    switch (type.toUpperCase()) {
      case "CARD_PUBLISHED":
        _notificationType = NotificationType.CARD_PUBLISHED;
        return;
      case "ADVERT":
        _notificationType = NotificationType.ADVERT;
        return;
      case "APP_UPDATE":
        _notificationType = NotificationType.APP_UPDATE;
        return;
      case "NORMAL":
        _notificationType = NotificationType.NORMAL;
        return;
      case "GENERAL_INFO":
        _notificationType = NotificationType.GENERAL_INFO;
        return;
      default:
        _notificationType = NotificationType.NORMAL;
        return;
    }
  }

  ///Every morning 8.00 AM Notify customer and remember them to checkout
  ///for new cards and make purchase
  static void notifyUsersDailyToCheckPublishedCards() {
    Map<String, dynamic> map = {};
    map.putIfAbsent("type", () => "NORMAL");

    ///Check if this has already been called as its needed to be called once in the lifetime of the app
    if (prefUtils.getBool(PrefConstants.NOTIFY_DAILY_REMINDER)) {
      return;
    }

    // NotificationApi.showDailyScheduledNotification(
    //   title: "Prime E-Gift",
    //   body: prefUtils.getDailyTips(),
    //   payload: map.toString(),
    //   time: const Time(08, 30, 0), //Every morning 8.30 AM
    // );
    //
    // prefUtils.setBool(PrefConstants.NOTIFY_DAILY_REMINDER, true);

    // showScheduledNotification(
    //   scheduledDate: DateTime(
    //     DateTime.now().year,
    //     DateTime.now().month,
    //     DateTime.now().day,
    //     DateTime.now().hour,
    //     DateTime.now().minute + 2,
    //   ),
    //   title: "Prime E-Gift",
    //   body: prefUtils.getDailyTips(),
    //   payload: Utils.convertEncode(map),
    // );
  }
}
