import 'package:primecustomer/res/config/assets_config.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

class AppTextStyles {
//================Themes ===========================
  static double wordSpacing = 1.5;
  static double height = 1.3;
  static double letterSpacing = 0.2;

  static TextStyle display1 = TextStyle(
    fontFamily: AssetsConfig.FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: AppDimens.dimen36,
    wordSpacing: wordSpacing,
    height: height,
    letterSpacing: letterSpacing,
    color: AppColors.darkerText,
  );

  static TextStyle headline = TextStyle(
    fontFamily: AssetsConfig.FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: AppDimens.dimen24,
    wordSpacing: wordSpacing,
    height: height,
    letterSpacing: letterSpacing,
    color: AppColors.darkerText,
  );

  static TextStyle title = TextStyle(
    fontFamily: AssetsConfig.FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: AppDimens.title,
    wordSpacing: wordSpacing,
    height: height,
    letterSpacing: letterSpacing,
    color: AppColors.darkerText,
  );

  static TextStyle subtitle = TextStyle(
    fontFamily: AssetsConfig.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.dimen14,
    wordSpacing: wordSpacing,
    height: height,
    letterSpacing: letterSpacing,
    color: AppColors.darkText,
  );

  static TextStyle body2 = TextStyle(
    fontFamily: AssetsConfig.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.dimen14,
    wordSpacing: wordSpacing,
    height: height,
    letterSpacing: letterSpacing,
    color: AppColors.darkText,
  );

  static TextStyle body1 = TextStyle(
    fontFamily: AssetsConfig.FONT_FAMILY,
    fontWeight: FontWeight.w600,
    fontSize: AppDimens.dimen16,
    wordSpacing: wordSpacing,
    height: height,
    letterSpacing: letterSpacing,
    color: AppColors.darkText,
  );

  static TextStyle caption = TextStyle(
    fontFamily: AssetsConfig.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.dimen12,
    wordSpacing: wordSpacing,
    height: height,
    letterSpacing: letterSpacing,
    color: AppColors.lightText, // was lightText
  );

  //=============== h1 ============================
  static TextStyle h1StyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h1,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h1StyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h1,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h1StyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h1,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h1StyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h1,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h1StyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h1,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h1StyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h1,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //=============== h2 ============================
  static TextStyle h2StyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h2,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h2StyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h2,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h2StyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h2,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h2StyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h2,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h2StyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h2,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h2StyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h2,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //=============== h3 ============================

  static TextStyle h3StyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h3,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h3StyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h3,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h3StyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h3,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h3StyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h3,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h3StyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h3,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h3StyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h3,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //=============== h4 ============================
  static TextStyle h4StyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h4,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h4StyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h4,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h4StyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h4,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h4StyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h4,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h4StyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h4,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h4StyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h4,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //=============== h5 ============================
  static TextStyle h5StyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h5,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h5StyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h5,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h5StyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h5,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h5StyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h5,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h5StyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h5,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle h5StyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.h5,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //=============== Title ============================
  static TextStyle titleStyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.title,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle titleStyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.title,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle titleStyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.title,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle titleStyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.title,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle titleStyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.title,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle titleStyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.title,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //=============== Description ============================
  static TextStyle descStyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.desc,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle descStyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.desc,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle descStyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.desc,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle descStyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.desc,
      fontWeight: FontWeight.w400,
      // wordSpacing: 1.5,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle descStyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.desc,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle descStyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.desc,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //=============== Sub Description ============================
  static TextStyle subDescStyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.subDesc,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle subDescRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.getSize(12, 1.6),
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle subDescStyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.subDesc,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle subDescStyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.subDesc,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle subDescStyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.subDesc,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle subDescStyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.subDesc,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //=============== Small Sub Description ============================
  static TextStyle smallSubDescStyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallSubDesc,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallSubDescStyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallSubDesc,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallSubDescStyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallSubDesc,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallSubDescStyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallSubDesc,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallSubDescStyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallSubDesc,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallSubDescStyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallSubDesc,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //============Smallest style Description ============================
  static TextStyle smallestSubDescStyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallestSubDesc,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallestSubDescStyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallestSubDesc,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallestSubDescStyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallestSubDesc,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallestSubDescStyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallestSubDesc,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallestSubDescStyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallestSubDesc,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallestSubDescStyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallestSubDesc,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  //============Smaller style Description ============================
  static TextStyle smallerSubDescStyleLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallerSubDesc,
      fontWeight: FontWeight.w300,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallerSubDescStyleBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallerSubDesc,
      fontWeight: FontWeight.w700,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallerSubDescStyleMedium = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallerSubDesc,
      fontWeight: FontWeight.w500,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallerSubDescStyleRegular = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallerSubDesc,
      fontWeight: FontWeight.w400,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallerSubDescStyleSemiBold = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallerSubDesc,
      fontWeight: FontWeight.w600,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  static TextStyle smallerSubDescStyleUltraLight = TextStyle(
      color: AppColors.darkText,
      fontSize: AppDimens.smallerSubDesc,
      fontWeight: FontWeight.w200,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: AssetsConfig.FONT_FAMILY);

  ///////////////////////////////////////////////////////
  static TextStyle getStyle(
    TextStyle? appTextStyles,
    Color color, {
    TextDecoration textDecoration = TextDecoration.none,
    Color decorationColor = AppColors.black,
    double decorationThickness = 2.85,
    double? wordSpacing,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontSize: appTextStyles != null ? appTextStyles.fontSize : AppDimens.desc,
      fontWeight:
          appTextStyles != null ? appTextStyles.fontWeight : FontWeight.w300,
      decoration: textDecoration,
      decorationThickness: decorationThickness,
      decorationColor: decorationColor,
      fontFamily: AssetsConfig.FONT_FAMILY,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle style({
    TextStyle? style,
    Color color = Colors.black,
    TextDecoration textDecoration = TextDecoration.none,
    Color decorationColor = AppColors.black,
    double decorationThickness = 1,
    double? wordSpacing,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      color: color,
      fontSize: style != null ? style.fontSize : AppDimens.desc,
      fontWeight: style != null ? style.fontWeight : FontWeight.w300,
      decoration: textDecoration,
      decorationThickness: decorationThickness,
      decorationColor: decorationColor,
      fontFamily: AssetsConfig.FONT_FAMILY,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
