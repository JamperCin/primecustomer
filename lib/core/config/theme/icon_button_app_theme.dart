import 'package:flutter/material.dart';
import 'package:primecustomer/core/config/colors/app_colors.dart';

class IconButtonAppTheme {
  IconButtonAppTheme._();

  static final lightIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all(AppColors.darkText),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
    ),
  );

  static final darkIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all(AppColors.lightText),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
    ),
  );
}
