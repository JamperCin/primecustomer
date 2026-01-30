import 'dart:collection';
import 'dart:io';

import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/http/web_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FireBaseApi {
  static late FirebaseMessaging _firebaseMessaging;
  //Todo: Get below information from Firebase console
  //Get 'apiKey' from the android/app/google-services.json file under 'api_key'
  final String apiKey = 'AIzaSyCP1X-6ZfegDso5ra-WlHHkuDs4Tt1qimg';
  final String appId = '1:446094824789:android:0111e5fcdf939235164bdc';
  final String messagingSenderId = '446094824789';
  final String projectId = 'prime-296009';

  ///Initialise Firebase
  /// Call this from [main.dart]
  Future<void> initializeFirebase() async {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: apiKey,
          appId: appId,
          messagingSenderId: messagingSenderId,
          projectId: projectId,
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  }

  ///================== Handle Proper Initialisation of FireBase here================================
  ///This needs to be called in your HomeController once for proper setup of FCM Token
  static initFireBase(WebService webService) {
    _init();
    _checkForFcmToken((token) => _sendFcmToken(token, webService));
  }

  ///Send the FCM Token to the backend server
  static void _sendFcmToken(String token, WebService webService) {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("fcm_id", () => token);
    webService.sendFcmToken(params, (response) {
      //if FCM is saved at the backend then save on device too
      prefUtils.setString(PrefConstants.FCM, token);
    });
  }

  ///Call this method in the controller after user has signed up or Logged In
  ///This call needs to be called first after the permission request
  ///This helps to initialise the Firebase in the app
  static void _init() {
    _firebaseMessaging = FirebaseMessaging.instance;

    //Request for notification Permission
    _requestNotificationPermission();

    //Register a Lister to Foreground and background messaging from server
    _registerForeAndBBackgroundListeners();
  }

  ///Call this function to request for permission on IOS devices to show notifications
  ///Permission needs to be enabled or accepted by user before this function can be used
  static void _requestNotificationPermission() async {
    _firebaseMessaging
        .requestPermission(
            alert: true,
            announcement: false,
            badge: true,
            carPlay: false,
            criticalAlert: false,
            provisional: false,
            sound: true)
        .then((settings) {
      debugPrint('User granted permission: ${settings.authorizationStatus}');
    });
  }

  ///Get token from FCM
  static void _checkForFcmToken(Function(String) fcm) {
    _firebaseMessaging.getToken().then((token) {
      debugPrint("FCM TOKEN ==== \n $token");
      if (token != null && token != prefUtils.getString(PrefConstants.FCM)) {
        fcm(token);
      } else {
        debugPrint("Fcm already saved successfully <====>");
      }
    });
  }

  /// Set the background messaging handler early on, as a named top-level function
  // static void initBackgroundMessageListener() {
  //   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // }

  /// Define a top-level named handler which background/terminated messages will
  /// call.
  ///
  /// To verify things are working, check out the native platform logs.
  // static Future<void> _firebaseMessBackgroundHandler(RemoteMessage msg) async {
  //   debugPrint("Background messaging ======>>>>");
  //   NotificationApi.notifyFcm(msg);
  // }

  ///Listen to foreground notifications
  static void _registerForeAndBBackgroundListeners() {
    //on Foreground
    FirebaseMessaging.onMessage.listen(_handleForeground);

    //On Background
    FirebaseMessaging.onBackgroundMessage(_handleBackground);

    //When user clicks on Notification to open app
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOnNotificationOnClick);
  }

  static Future<void> _handleForeground(RemoteMessage msg) async {
    debugPrint("Background messaging ======>>>> ${msg.toMap().toString()}");
    // NotificationApi.notifyFcm(msg);
  }

  static Future<void> _handleBackground(RemoteMessage msg) async {
    debugPrint("Foreground messaging ======>>>> ${msg.toMap().toString()}");
    // NotificationApi.notifyFcm(msg);
  }

  static Future<void> _handleOnNotificationOnClick(RemoteMessage msg) async {
    final initMess = await _firebaseMessaging.getInitialMessage();
    if (initMess != null) {
      msg = initMess;
    }
    debugPrint("Notification clicked ======>>>> ${msg.toMap().toString()}");
  }
}
