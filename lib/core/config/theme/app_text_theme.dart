import 'package:flutter/material.dart';
import 'package:primecustomer/core/config/colors/app_colors.dart';
import 'package:primecustomer/core/config/theme/app_typography.dart';

class AppTextTheme {
  AppTextTheme._();

  //Light Theme for Text app wide
  static TextTheme lightTextTheme = TextTheme(
    //Label
    labelSmall: AppTypography.labelSmall.copyWith(color: AppColors.darkText),
    labelMedium: AppTypography.labelMedium.copyWith(color: AppColors.darkText),
    labelLarge: AppTypography.labelLarge.copyWith(color: AppColors.darkText),

    //Body
    bodySmall: AppTypography.bodyLarge.copyWith(color: AppColors.darkText),
    bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.darkText),
    bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.darkText),

    //Title
    titleSmall: AppTypography.titleSmall.copyWith(color: AppColors.darkText),
    titleMedium: AppTypography.titleMedium.copyWith(color: AppColors.darkText),
    titleLarge: AppTypography.titleLarge.copyWith(color: AppColors.darkText),

    //Headline
    headlineSmall: AppTypography.headlineSmall.copyWith(
      color: AppColors.darkText,
    ),
    headlineMedium: AppTypography.headlineMedium.copyWith(
      color: AppColors.darkText,
    ),
    headlineLarge: AppTypography.headlineLarge.copyWith(
      color: AppColors.darkText,
    ),

    //Display
    displaySmall: AppTypography.displaySmall.copyWith(
      color: AppColors.darkText,
    ),
    displayMedium: AppTypography.displayMedium.copyWith(
      color: AppColors.darkText,
    ),
    displayLarge: AppTypography.displayLarge.copyWith(
      color: AppColors.darkText,
    ),
  );

  //Dark Theme for Text app wide
  static TextTheme darkTextTheme = TextTheme(
    //Label
    labelSmall: AppTypography.labelSmall.copyWith(color: AppColors.lightText),
    labelMedium: AppTypography.labelMedium.copyWith(color: AppColors.lightText),
    labelLarge: AppTypography.labelLarge.copyWith(color: AppColors.lightText),

    //Body
    bodySmall: AppTypography.bodyLarge.copyWith(color: AppColors.lightText),
    bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.lightText),
    bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.lightText),

    //Title
    titleSmall: AppTypography.titleSmall.copyWith(color: AppColors.lightText),
    titleMedium: AppTypography.titleMedium.copyWith(color: AppColors.lightText),
    titleLarge: AppTypography.titleLarge.copyWith(color: AppColors.lightText),

    //Headline
    headlineSmall: AppTypography.headlineSmall.copyWith(
      color: AppColors.lightText,
    ),
    headlineMedium: AppTypography.headlineMedium.copyWith(
      color: AppColors.lightText,
    ),
    headlineLarge: AppTypography.headlineLarge.copyWith(
      color: AppColors.lightText,
    ),

    //Display
    displaySmall: AppTypography.displaySmall.copyWith(
      color: AppColors.lightText,
    ),
    displayMedium: AppTypography.displayMedium.copyWith(
      color: AppColors.lightText,
    ),
    displayLarge: AppTypography.displayLarge.copyWith(
      color: AppColors.lightText,
    ),
  );
}
