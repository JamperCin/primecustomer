import 'package:flutter/material.dart';
import 'package:primecustomer/core/config/colors/app_colors.dart';
import 'package:primecustomer/core/config/theme/app_typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarCustomTheme {
  AppBarCustomTheme._();

  static final AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.lightBackground,
    elevation: 0.0,
    titleTextStyle: AppTypography.bodyMedium,
    iconTheme: IconThemeData(color: AppColors.darkBackground),
    actionsIconTheme: IconThemeData(
      color: AppColors.lightBackground,
      size: 30.dp,
    ),
    centerTitle: false,
    toolbarTextStyle: AppTypography.bodySmall,
    actionsPadding: EdgeInsets.symmetric(horizontal: 10.dp, vertical: 5.dp),
  );

  static final AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.darkGreyBackground,
    elevation: 0.0,
    centerTitle: false,
    iconTheme: IconThemeData(color: AppColors.white),
    toolbarTextStyle: AppTypography.bodySmall.copyWith(color: AppColors.white),
    titleTextStyle: AppTypography.bodyMedium.copyWith(color: AppColors.white),
    actionsIconTheme: IconThemeData(color: AppColors.white),
    actionsPadding: EdgeInsets.symmetric(horizontal: 10.dp, vertical: 5.dp),
  );
}
