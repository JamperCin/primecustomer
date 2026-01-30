import 'package:flutter/material.dart';
import 'package:primecustomer/core/enums/app_font_family_type.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final _letterSpacing = 0.5;

class AppTypography {
  AppTypography._();

  static String fontFamily = AppFontFamilyType.sans.name;

  //Label Text styles : small, medium and large
  static TextStyle labelSmall = TextStyle(
    fontSize: 12.dp,
    letterSpacing: _letterSpacing,
  );

  static TextStyle labelMedium = TextStyle(
    fontSize: 12.dp,
    letterSpacing: _letterSpacing,
  );

  static TextStyle labelLarge = TextStyle(
    fontSize: 12.dp,
    letterSpacing: _letterSpacing,
  );

  //Body Text styles : small, medium and large
  static TextStyle bodySmall = TextStyle(
    fontSize: 14.dp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.dp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyLarge = TextStyle(
    fontSize: 14.dp,
    fontWeight: FontWeight.normal,
  );

  //Title Text styles : small, medium and large
  static TextStyle titleSmall = TextStyle(
    fontSize: 16.dp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleMedium = TextStyle(
    fontSize: 16.dp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleLarge = TextStyle(
    fontSize: 16.dp,
    fontWeight: FontWeight.bold,
  );

  //Headline Text styles : small, medium and large

  static TextStyle headlineSmall = TextStyle(
    fontSize: 20.dp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineMedium = TextStyle(
    fontSize: 24.dp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLarge = TextStyle(
    fontSize: 24.dp,
    fontWeight: FontWeight.bold,
  );

  //Display Text styles : small, medium and large
  static TextStyle displaySmall = TextStyle(
    fontSize: 28.dp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle displayMedium = TextStyle(
    fontSize: 28.dp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle displayLarge = TextStyle(
    fontSize: 28.dp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle button = TextStyle(
    fontSize: 16.dp,
    fontWeight: FontWeight.bold,
  );
}
