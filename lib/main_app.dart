import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:primecustomer/core/config/routes/app_routes.dart';
import 'package:primecustomer/core/config/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return LayoutBuilder(
          builder: (context, constraints) {
            appDimen = AppDimens(context, constantMultiplier: 1.75);
            return OrientationBuilder(
              builder: (context, orientation) => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.rootRoute,
                getPages: AppRoutes.finalRoute,
                title: 'Prime E-Gift',
                themeMode: ThemeMode.light,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
              ),
            );
          },
          // child: GetMaterialApp(
          //   debugShowCheckedModeBanner: false,
          //   initialRoute: AppRoutes.rootRoute,
          //   getPages: AppRoutes.finalRoute,
          //   title: 'Prime E-Gift',
          //   themeMode: ThemeMode.light,
          //   theme: AppTheme.lightTheme,
          //   darkTheme: AppTheme.darkTheme,
          // ),
        );
      },
    );
  }
}
