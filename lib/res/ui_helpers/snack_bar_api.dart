import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarApi {
  ///General SnackBar with options
  static void snackBar({
    String title = '',
    String message = '',
    IconData icon = Icons.info_outline,
    Color backgroundColor = AppColors.background,
    Color textColor = Colors.black,
    Color iconColor = Colors.black,
    Color? overlayColor,
    bool showProgressIndicator = false,
    SnackPosition snackPosition = SnackPosition.TOP,
    double overlayBlur = 5.0,
    double barBlur = 0.3,
    Curve? forwardAnimationCurve,
    Curve? reverseAnimationCurve,
    Duration? animationDuration,
  }) {
    Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: iconColor),
      backgroundColor: backgroundColor,
      snackPosition: snackPosition,
      showProgressIndicator: showProgressIndicator,
      overlayBlur: overlayBlur,
      overlayColor: overlayColor ?? Colors.black.withOpacity(0.5),
      shouldIconPulse: true,
      barBlur: barBlur,
      snackStyle: SnackStyle.FLOATING,
      forwardAnimationCurve: forwardAnimationCurve ?? Curves.easeOutCirc,
      reverseAnimationCurve: reverseAnimationCurve ?? Curves.easeOutCirc,
      animationDuration: animationDuration ?? const Duration(seconds: 1),
      titleText: Text(
        title,
        style: AppTextStyles.descStyleBold.copyWith(color: textColor),
      ),
      messageText: Text(
        message,
        style: AppTextStyles.descStyleLight.copyWith(color: textColor),
      ),
    );
  }

  static void snackBarError(String message, {String title = "Error"}) {
    snackBar(
      title: title,
      message: message,
      icon: Icons.error,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  static void snackBarInfo(String message, {String title = "Info"}) {
    snackBar(
      title: title,
      message: message,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  static void snackBarSuccess(String message, {String title = "Success"}) {
    snackBar(
      title: title,
      message: message,
      icon: Icons.done,
      backgroundColor: AppColors.background,
      textColor: AppColors.primaryGreenColor,
      iconColor: AppColors.primaryGreenColor,
    );
  }

  static void snackBarToast(
    String message, {
    String title = "Success",
    Color? bgColor,
    IconData icon = Icons.notifications,
  }) {
    snackBar(
      title: title,
      message: message,
      icon: icon,
      backgroundColor: bgColor ?? AppColors.market3,
      textColor: AppColors.white,
      iconColor: AppColors.white,
      overlayBlur: 0.0,
      barBlur: 0.0,
      overlayColor: Colors.transparent,
    );
  }
}
