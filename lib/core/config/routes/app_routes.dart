import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';
import 'package:primecustomer/features/auth/login/login_screen.dart';

class AppRoutes {
  static const String rootRoute = "/";
  static const String homeRoute = "/home";

  AppRoutes._();

  static final finalRoute = [GetPage(name: rootRoute, page: () => getPage())];

  static BaseScreenImpl getPage() {
    return LoginScreen();
    //   if (prefUtils.isIntroShown) {
    //     if (prefUtils.needBio) {
    //       return BioPinLoginScreen();
    //     }

    //     if (!prefUtils.isLogin) {
    //       return LoginScreen();
    //     }

    //     return LoginScreen();
    //   } else {
    //     return IntroScreen();
    //   }
  }
}
