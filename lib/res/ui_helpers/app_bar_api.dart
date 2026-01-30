import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/app_colors.dart';
import '../app/app_dimens.dart';
import '../app/app_text_styles.dart';

class AppBarApi {
  ///Create an appBar with a light title
  static PreferredSizeWidget appBarLight({
    String title = "",
    double elevation = 0,
    double? appBarHeight,
    Widget? titleWidget,
    Widget? leadingIcon,
    List<Widget>? actions,
    IconThemeData iconTheme = const IconThemeData(
      color: AppColors.darkText,
    ),
    Color? backgroundColor = AppColors.white,
    Color titleColor = Colors.black,
  }) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      iconTheme: iconTheme,
      leading: leadingIcon,
      surfaceTintColor: backgroundColor,
      toolbarHeight: appBarHeight ?? AppDimens.dimen50,
      title: titleWidget ??
          UiApi.richText(mod: [
            RichTextModel(
              text: title,
              style: AppTextStyles.style(
                  style: AppTextStyles.titleStyleBold, color: titleColor),
            )
          ]),
      actions: actions,
    );
  }

  ///An AppBar with actions that has a counter on
  static Widget appBarLightWithCounter({
    String title = "",
    Widget? titleWidget,
    double elevation = 0,
    double? appBarHeight,
    RxInt? counter,
    Widget? leadingIcon,
    List<Widget>? actions,
    IconData icon = Icons.shopping_cart,
    IconThemeData iconTheme = const IconThemeData(color: AppColors.darkText),
    Color backgroundColor = AppColors.white,
    Function? onActionClick,
    Color titleColor = Colors.black,
  }) {
    counter = counter ?? 0.obs;

    return appBarLight(
      title: title,
      iconTheme: iconTheme,
      elevation: elevation,
      titleWidget: titleWidget,
      appBarHeight: appBarHeight,
      backgroundColor: backgroundColor,
      leadingIcon: leadingIcon,
      titleColor: titleColor,
      actions: actions ??
          [
            GestureDetector(
              onTap: () {
                if (onActionClick != null) {
                  onActionClick();
                }
              },
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: AppDimens.dimen20),
                      child: Icon(
                        icon,
                        color: AppColors.deactivatedText,
                        size: AppDimens.dimen32,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
    );
  }
}
