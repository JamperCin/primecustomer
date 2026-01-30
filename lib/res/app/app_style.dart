import 'package:primecustomer/res/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';

import '../config/assets_config.dart';

const double _wordSpacing = 1.5;
const double _height = 1.3;
const double _letterSpacing = 0.2;
String _fontFamily = AssetsConfig.FONT_FAMILY;

///=================== L  I  G  H  T     M  O  D  E  =========================
///===========================================================================
TextStyle normalButtonLightModeStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w700,
  fontSize: appDimen.dimen(14),
  wordSpacing: _wordSpacing,
  height: _height,
  letterSpacing: _letterSpacing,
  color: AppColors.whiteColor,
);

TextStyle boldButtonLightModeStyle =
    normalButtonLightModeStyle.copyWith(fontWeight: FontWeight.w900);

///Label Text
TextStyle labelSmallTextLightModeStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w200,
  fontFamily: _fontFamily,
  fontSize: appDimen.dimen(12),
  wordSpacing: _wordSpacing,
  height: _height,
  letterSpacing: _letterSpacing,
  color: AppColors.darkColor,
);

TextStyle labelMediumTextLightModeStyle =
    labelSmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w400);

TextStyle labelLargeTextLightModeStyle =
    labelSmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w900);

///Body Text
TextStyle bodySmallTextLightModeStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w200,
  fontFamily: _fontFamily,
  fontSize: appDimen.dimen(16),
  wordSpacing: _wordSpacing,
  height: _height,
  letterSpacing: _letterSpacing,
  color: AppColors.darkColor,
);

TextStyle bodyMediumTextLightModeStyle =
    bodySmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w400);

TextStyle bodyLargeTextLightModeStyle =
    bodySmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w900);

///Title text
TextStyle titleSmallTextLightModeStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w200,
  fontFamily: _fontFamily,
  fontSize: appDimen.dimen(22),
  wordSpacing: _wordSpacing,
  height: _height,
  letterSpacing: _letterSpacing,
  color: AppColors.darkColor,
);

TextStyle titleMediumTextLightModeStyle =
    titleSmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w400);

TextStyle titleLargeTextLightModeStyle =
    titleSmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w900);

///Display text
TextStyle displaySmallTextLightModeStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w200,
  fontFamily: _fontFamily,
  fontSize: appDimen.dimen(35),
  wordSpacing: _wordSpacing,
  height: _height,
  letterSpacing: _letterSpacing,
  color: AppColors.darkColor,
);

TextStyle displayMediumTextLightModeStyle =
    displaySmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w400);

TextStyle displayLargeTextLightModeStyle =
    displaySmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w900);

///Heading text
TextStyle headingSmallTextLightModeStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w200,
  fontFamily: _fontFamily,
  fontSize: appDimen.dimen(45),
  wordSpacing: _wordSpacing,
  height: _height,
  letterSpacing: _letterSpacing,
  color: AppColors.darkColor,
);
TextStyle headingMediumTextLightModeStyle =
    headingSmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w400);

TextStyle headingLargeTextLightModeStyle =
    headingSmallTextLightModeStyle.copyWith(fontWeight: FontWeight.w900);
