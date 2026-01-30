//import 'package:core_module/core/app/app_module_colors.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_style.dart';

ThemeData lightMode = ThemeData(
  platform: TargetPlatform.iOS,
  brightness: Brightness.light,
  textTheme: TextTheme(
    labelSmall: labelSmallTextLightModeStyle,
    labelMedium: labelMediumTextLightModeStyle,
    labelLarge: labelLargeTextLightModeStyle,
    //
    bodySmall: bodySmallTextLightModeStyle,
    bodyLarge: bodyLargeTextLightModeStyle,
    bodyMedium: bodyMediumTextLightModeStyle,

    displayLarge: displayLargeTextLightModeStyle,
    displayMedium: displayMediumTextLightModeStyle,
    displaySmall: displaySmallTextLightModeStyle,
    //
    headlineLarge: headingLargeTextLightModeStyle,
    headlineMedium: headingMediumTextLightModeStyle,
    headlineSmall: headingSmallTextLightModeStyle,
    //
    titleLarge: titleLargeTextLightModeStyle,
    titleMedium: titleMediumTextLightModeStyle,
    titleSmall: titleSmallTextLightModeStyle,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: AppColors.primaryGreenColor,
      textStyle: normalButtonLightModeStyle,
      disabledForegroundColor: const Color.fromARGB(255, 138, 249, 155),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: Colors.transparent,
      textStyle: normalButtonLightModeStyle,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(18),
          right: Radius.circular(18),
        ),
      ),
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,

    ///primary colors and inverted color
    primary: AppColors.primaryGreenColor,
    inversePrimary: AppColors.greenFadedColor,
    //
    onPrimary: AppColors.secondaryGreenColor,
    primaryContainer: AppColors.orangeQuadColor,
    primaryFixedDim: AppColors.orangeXColor,
    primaryFixed: AppColors.orangeFadeColor,

    ///Secondary colors
    secondary: AppColors.greyPrimaryColor,
    onSecondary: AppColors.greySecondaryColor,
    secondaryContainer: AppColors.greyTertiaryColor,

    ///Tertiary colors
    tertiary: AppColors.white,
    ///Error
    error: AppColors.redColor,
    onError: AppColors.redColor,

    ///Surface
    surface: AppColors.greySecondaryColor,
    onSurface: AppColors.white,
    surfaceBright: AppColors.nearlyWhite,

    tertiaryContainer: AppColors.categoryBgColor,

    ///Inverse surface
    inverseSurface: AppColors.darkColor,

    ///Green color
    outline: AppColors.greenPrimaryColor,
    shadow: AppColors.greyTertiaryLightColor,
    outlineVariant: AppColors.darkBrownColor,
    surfaceDim: AppColors.dividerColor,
  ),
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.black,
    foregroundColor: Colors.black,
    elevation: 5,
    // Set AppBar elevation
    backgroundColor: Colors.white,
    // Background color
    iconTheme: const IconThemeData(color: Colors.black),
    // Leading icon color
    titleTextStyle:
        TextStyle(color: Colors.black, fontSize: 16.dp()), // Title color
  ),
);

ThemeData darkMode = lightMode.copyWith(
  brightness: Brightness.dark,

  // dialogTheme: darkColor,
);
