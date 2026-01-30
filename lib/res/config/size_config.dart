import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static bool isTablet = false;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockSizeHorizontal = 0.0;
  static double blockSizeVertical = 0.0;
  static double scaleFactor = 0.0;
  static double _safeAreaHorizontal = 0.0;
  static double _safeAreaVertical = 0.0;
  static double safeBlockHorizontal = 0.0;
  static double safeBlockVertical = 0.0;
  static double textScaleFactor = 0.0;

  ///Aspect Ratio and ChildAspectRatio
  static double getAspectRatio({double v = 2.0}) {
    double defaultRatio = v;

    if (screenWidth <= 374) {
      defaultRatio = v * 1.1;
    } else if (screenWidth >= 375 && screenWidth <= 380) {
      defaultRatio = v;
    } else if (screenWidth > 380 && screenWidth < 450) {
      defaultRatio = v * 1.13;
    } else if (screenWidth > 450 && screenWidth < 550) {
      defaultRatio = v * 1.2;
    } else if (screenWidth > 550 && screenWidth < 650) {
      defaultRatio = v * 1.32;
    } else if (screenWidth >= 650 && screenWidth <= 900) {
      defaultRatio = v * 1.4;
    } else if (screenWidth > 900) {
      defaultRatio = v * 1.5;
    }

    return defaultRatio;
  }

  static double getGridAspectRatio({double v = 1.2}) {
    double defaultRatio = v;

    if (screenWidth <= 374) {
      defaultRatio = v * 1.01;
    } else if (screenWidth >= 375 && screenWidth <= 380) {
      defaultRatio = v;
    } else if (screenWidth > 380 && screenWidth < 430) {
      defaultRatio = v * 1.02;
    } else if (screenWidth > 430 && screenWidth < 650) {
      defaultRatio = v * 1.15;
    } else if (screenWidth >= 650 && screenWidth <= 900) {
      defaultRatio = v * 1.25;
    } else if (screenWidth > 900) {
      defaultRatio = v * 1.35;
    }

    return defaultRatio;
  }

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    textScaleFactor = _mediaQueryData.textScaleFactor;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    if (screenWidth >= 350 && screenWidth <= 500) {
      scaleFactor = 400.0 / 100;
    } else if (screenWidth > 500 && screenWidth <= 900) {
      scaleFactor = 500.0 / 100;
    } else if (screenWidth > 900) {
      scaleFactor = 600.0 / 100;
    } else {
      scaleFactor = screenWidth / 100;
    }

    var shortestSide = _mediaQueryData.size.shortestSide;

    // Determine if we should use mobile layout or not, 600 here is
    // a common breakpoint for a typical 7-inch tablet.
    isTablet = shortestSide > 600;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    //debugPrint("Height: $screenHeight == Width : $screenWidth  Scale : $scaleFactor  ShortestSide : $shortestSide Tablet : $isTablet");
  }
}
