import 'package:flutter/material.dart';
import 'package:primecustomer/core/config/colors/app_colors.dart';

class AppColorTheme {
  AppColorTheme._();

  static const ColorScheme lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
    errorContainer: AppColors.errorContainer,
    outline: AppColors.lightOutline,
    surface: AppColors.lightBackground,
    onSurface: AppColors.addShade1BackgroundLight,
    onSurfaceVariant: AppColors.addShade2BackgroundLight,
    shadow: Colors.white,
    inverseSurface: AppColors.darkBackground,
    onInverseSurface: AppColors.lightBackground,
    tertiary: AppColors.lightGrey,
  );

  static const ColorScheme darkColorScheme = ColorScheme.light(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
    errorContainer: AppColors.errorContainer,
    outline: AppColors.darkOutline,
    surface: AppColors.darkBackground,
    onSurface: AppColors.addShade1BackgroundDark,
    onSurfaceVariant: AppColors.addShade2BackgroundDark,
    shadow: Colors.black,
    inverseSurface: AppColors.lightBackground,
    onInverseSurface: AppColors.darkBackground,
    tertiary: AppColors.darkGrey,
  );
}
