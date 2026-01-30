import 'dart:async';

import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../../data/constants/constants.dart';
import '../../utils/Utils.dart';
import '../app/app_colors.dart';
import '../app/app_dimens.dart';
import '../app/app_text_styles.dart';

class DialogsApi {
  static Timer? timer;

  ///Show a loading progress bar on screen and block all ui interactions
  static void showProgressBar(
      {required BuildContext context, bool autoClose = true, Widget? child}) {
    Loader.show(
      context,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiApi.circularProgressIndicatorExt(),
          child ?? const SizedBox.shrink(),
        ],
      ),
      //  themeData: Theme.of(context).copyWith(cc: Colors.black38),
      overlayColor: Colors.black.withOpacity(0.6),
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
    );

    if (autoClose) {
      timer = Utils.startTimer(Constants.PROGRESS_DURATION, () {
        dismissProgressBar();
      });
    }
  }

  static void dismissProgressBar() {
    Loader.hide();
    timer?.cancel();
  }

  static void showBottomSheet({
    String jsonPath = "",
    String? title,
    TextStyle? titleStyle,
    Widget? child,
    Widget? mainChild,
    Widget? leadingTitle,
    Widget? trailingTitle,
    Widget? bottomButton,
    Widget? parent,
    String buttonText = "",
    bool showButton = false,
    bool isRoundedCorner = false,
    bool isDismissable = true,
    bool isDraggable = true,
    bool showCloseButton = true,
    Color backgroundColor = AppColors.background,
    Function? onClick,
    double? containerSize,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double lottieSize = 80,
    double? topPadding,
    double borderRadius = 18.0,
    Color buttonColor = AppColors.primaryGreenColor,
  }) {
    containerSize = containerSize ?? AppDimens.dimen400;
    padding = padding ??
        EdgeInsets.only(
            top: AppDimens.dimen16,
            bottom: AppDimens.dimen16,
            right: AppDimens.dimen32,
            left: AppDimens.dimen32);

    // showModalBottomSheet<dynamic>(
    //     isScrollControlled: true,
    //     context: context,
    //     builder: (BuildContext bc) {
    //       return Wrap(
    //           children: <Widget>[...]
    //       );
    //     }
    // );

    Get.bottomSheet(
      parent ??
          Container(
            height: containerSize,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius)),
            ),
            padding: padding,
            margin: margin,
            child: mainChild ??
                Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: topPadding ?? AppDimens.dimen40),
                      child: ListView(
                        children: [
                          jsonPath.isNotEmpty
                              ? Image.network(jsonPath, height: lottieSize)
                              : const SizedBox(),
                          SizedBox(
                            height: AppDimens.dimen10,
                          ),
                          child ?? const Text(""),
                          SizedBox(
                            height: showButton
                                ? AppDimens.dimen40
                                : AppDimens.dimen10,
                          ),
                          showButton
                              ? Container(
                                  padding: EdgeInsets.only(
                                      left: AppDimens.dimen32,
                                      right: AppDimens.dimen32),
                                  child: SizedBox(
                                    height: AppDimens.dimen45,
                                    width: AppDimens.dimen200,
                                    child: UiApi.button(
                                      backgroundColor: buttonColor,
                                      textColor: AppColors.white,
                                      text: buttonText,
                                      onPressed: () {
                                        Get.back();
                                        onClick!();
                                      },
                                    ),
                                  ),
                                )
                              : const Text(""),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(AppDimens.dimen8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            leadingTitle ?? const SizedBox(),
                            if (title != null)
                              Flexible(
                                flex: 1,
                                child: Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: titleStyle ??
                                      AppTextStyles.titleStyleBold,
                                ),
                              ),
                            if (showCloseButton)
                              Flexible(
                                flex: 0,
                                child: SizedBox(
                                  height: AppDimens.dimen25,
                                  width: AppDimens.dimen25,
                                  child: FloatingActionButton(
                                    mini: true,
                                    backgroundColor: AppColors.background,
                                    onPressed: () {
                                      NavApi.fireBack();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: AppDimens.dimen16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      child: bottomButton ?? const SizedBox(),
                      alignment: Alignment.bottomCenter,
                    )
                  ],
                ),
          ),
      enableDrag: isDraggable,
      isDismissible: isDismissable,
      isScrollControlled: true,
    );
  }

  static Future<void> popUpDialog(
    BuildContext context, {
    String title = "",
    Widget? leadingTitle,
    Widget? content,
    TextStyle? titleStyle,
    bool dismissible = false,
    bool dismissIcon = true,
    List<Widget>? actions,
    double borderRadius = 10,
  }) async {
    return showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (context) {
          return AlertDialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            actions: actions,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leadingTitle ?? const SizedBox(),
                Flexible(
                  flex: 1,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: titleStyle ?? AppTextStyles.titleStyleBold,
                  ),
                ),
                dismissIcon
                    ? Flexible(
                        flex: 0,
                        child: SizedBox(
                          height: AppDimens.dimen25,
                          width: AppDimens.dimen25,
                          child: FloatingActionButton(
                            mini: true,
                            backgroundColor: AppColors.background,
                            onPressed: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              size: AppDimens.dimen16,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            content: content ?? const SizedBox(),
          );
        });
  }

  static void popUpSuccessDialog(
    BuildContext ctx, {
    String mess = "",
    String title = "Success!!!",
    String? asset,
    Widget? child,
    Function? call,
    List<Widget>? actions,
    int time = 5,
  }) {
    Utils.startTimer(time, () {
      NavApi.fireBack();
      if (call != null) {
        call();
      }
    });
    //Call Dialog
    DialogsApi.popUpDialog(
      ctx,
      actions: actions,
      dismissIcon: false,
      content: UiApi.dialogMessage(
        title: title,
        mess: mess,
        asset: asset ?? "assets/images/ic_tick.png",
        child: child,
      ),
    );
  }

  static void popUpNormalDialog(
    BuildContext ctx, {
    String mess = "",
    String title = "Success!!!",
    String? asset,
    Widget? child,
    bool dismissIcon = false,
    List<Widget>? actions,
  }) {
    DialogsApi.popUpDialog(
      ctx,
      actions: actions,
      dismissIcon: dismissIcon,
      content: UiApi.dialogMessage(
        title: title,
        mess: mess,
        asset: asset ?? "assets/images/ic_tick.png",
        child: child,
      ),
    );
  }

  static Widget actionButton({String text = 'OK', GestureTapCallback? onTap}) {
    return TextButton(
      onPressed: () {
        NavApi.fireBack();
        if (onTap != null) {
          onTap();
        }
      },
      child: Text(
        text,
        style: AppTextStyles.titleStyleSemiBold,
      ),
    );
  }

  static void alertDialog({String mess = '', String title = ''}) {
    popUpDialog(
      Get.context!,
      dismissIcon: false,
      title: title,
      content: Text(
        mess,
        style: AppTextStyles.descStyleLight,
      ),
      actions: [actionButton()],
    );
  }

  static void alertDialogYesNo({
    String title = '',
    String mess = '',
    String positiveButtonText = 'Yes',
    String negativeButtonText = 'No',
    GestureTapCallback? onYesTap,
    GestureTapCallback? onNoTap,
  }) {
    popUpDialog(
      Get.context!,
      dismissIcon: false,
      title: title,
      content: Text(
        mess,
        style: AppTextStyles.descStyleLight,
      ),
      actions: [
        actionButton(text: negativeButtonText, onTap: onNoTap),
        actionButton(text: positiveButtonText, onTap: onYesTap),
      ],
    );
  }
}
