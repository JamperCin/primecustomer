import 'package:core_module/core_module.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/enum/guest_staging.dart';
import 'package:primecustomer/res/api/fire_base_api.dart';
import 'package:primecustomer/res/api/map_api.dart';
import 'package:primecustomer/res/api/notification_api.dart';
import 'package:primecustomer/res/app/app_routes.dart';
import 'package:primecustomer/res/app/app_themes.dart';
import 'package:primecustomer/utils/pref_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PrefUtils prefUtils = PrefUtils();
//MapApi mapApi = MapApi();
RxInt notificationCounter = 0.obs;
//RxBool isGuestUser = false.obs;
String guestUserToken = "";
RxString profilePicURl = "".obs;
const icEnvPath = "assets/config/env.json";
Rx<GuestStage> guestStage = GuestStage.init.obs;


@pragma('vm:entry-point')
Future<void> firebaseBackgroundMessageHandler(RemoteMessage msg) async {
  debugPrint("Background messaging ======>>>> ${msg.toMap().toString()}");
   // Initialize Firebase if not already initialized
  await FireBaseApi().initializeFirebase();

 // NotificationApi.notifyFcm(msg);
  // Perform background tasks based on the message data
}

///Main Entry of the app
///This is the main entry into the prime customer app
///Kindly initialise all your code from here
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  ///Load the map api to load assets and marker icon
 // mapApi.init();

  ///Initialise Firebase for proper firebase messaging and notifications for only Mobile Platforms[Android, IOS]
  await FireBaseApi().initializeFirebase();

  ///Initialise SharedPreference
  prefUtils = PrefUtils().init();

  await _initCoreModule();

  ///Init Local Notification
  ///Set the @param [initSchedule] param to TRUE to make use of the scheduling feature
  NotificationApi.init(initSchedule: true);

  ///set orientations
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) {
    runApp(ParentApp());
  });
}

Future<void> _initCoreModule() async {
  await Future.delayed(const Duration(seconds: 1));
  await CoreModule().init(
    envPath: icEnvPath,
    defaultEnv: EnvType.production,
    loginScreen: 'LoginScreen',
    homePageScreen: 'MainDashboardScreen',
  );
}

class ParentApp extends StatelessWidget {
  BaseController controller = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    appDimen = AppDimens(context, constantMultiplier: 1.75);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.rootRoute,
      getPages: AppRoutes.finalRoute,
      title: 'Prime E-Gift',
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
