import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';
import 'package:primecustomer/ui/auth/login/bio_pin_auth_screen.dart';
import 'package:primecustomer/ui/auth/login/login_screen.dart';
import 'package:primecustomer/ui/intro/intro_screen.dart';
import 'package:get/route_manager.dart';

import '../../main.dart';

class AppRoutes {
  static const String rootRoute = "/";
  static const String homeRoute = "/home";

  AppRoutes._();

  static final finalRoute = [
    GetPage(name: rootRoute, page: () => getPage()),
  ];

  static BaseScreenImpl getPage() {
    if (prefUtils.isIntroShown) {
      if (prefUtils.needBio) {
        return BioPinLoginScreen();
      }

      if (!prefUtils.isLogin) {
        return LoginScreen();
      }

      return LoginScreen();
    } else {
      return IntroScreen();
    }
  }
}
