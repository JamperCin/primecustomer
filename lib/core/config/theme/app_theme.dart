import 'package:flutter/material.dart';
import 'package:primecustomer/core/config/colors/app_colors.dart';
import 'package:primecustomer/core/config/theme/app_bar_custom_theme.dart';
import 'package:primecustomer/core/config/theme/app_color_theme.dart';
import 'package:primecustomer/core/config/theme/app_text_theme.dart';
import 'package:primecustomer/core/config/theme/icon_button_app_theme.dart';
import 'app_typography.dart';
import 'theme_extensions.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: AppTypography.fontFamily,
    colorScheme: AppColorTheme.lightColorScheme,
    textTheme: AppTextTheme.lightTextTheme,
    extensions: <ThemeExtension<dynamic>>[CustomThemeExtension.light],
    appBarTheme: AppBarCustomTheme.lightAppBarTheme,
    iconButtonTheme: IconButtonAppTheme.lightIconButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: AppTypography.fontFamily,
    colorScheme: AppColorTheme.darkColorScheme,
    textTheme: AppTextTheme.darkTextTheme,
    extensions: <ThemeExtension<dynamic>>[CustomThemeExtension.dark],
    appBarTheme: AppBarCustomTheme.darkAppBarTheme,
    iconButtonTheme: IconButtonAppTheme.darkIconButtonTheme,
  );
}
