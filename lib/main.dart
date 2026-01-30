import 'package:core_module/core_module.dart' as core;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:primecustomer/core/data/local/pref_utils.dart';
import 'package:primecustomer/core/def/global_access.dart';
import 'package:primecustomer/main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await _initCoreModule();

  runApp(const MainApp());
}

Future<void> _initCoreModule() async {
  await Future.delayed(const Duration(seconds: 1));
  await core.CoreModule().init(
    envPath: icEnvPath,
    defaultEnv: core.EnvType.production,
    loginScreen: 'LoginScreen',
    homePageScreen: 'MainDashboardScreen',
  );
  await initSingletons();
}

Future<void> initSingletons() async {
  // navUtils = core.NavUtils();
  // validationUtils = core.ValidationUtils();
  prefUtils = PrefUtils().init();
}
