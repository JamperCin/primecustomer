import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:flutter/material.dart';

class PageAnimationController extends BaseController {
  /// Initialise the animations on the page
  AnimationController getPageAnimations(TickerProvider tickerProvider) {
    return AnimationController(
        duration: const Duration(milliseconds: 600), vsync: tickerProvider);
  }

  ///Get animations on the bottom app bar icons
  AnimationController getIconAnimations(TickerProvider tickerProvider) {
    return AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: tickerProvider);
  }

  Animation<double> topBarAnimation(AnimationController animationController) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
  }

  Animation<double> menuAnimation(AnimationController animationController) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval((1 / 13) * 5, 1.0, curve: Curves.fastOutSlowIn)));
  }

  void listenScrolling(
      ScrollController c, double opacity, Function(double) call) {
    c.addListener(() {
      if (c.offset >= 24) {
        if (opacity != 1.0) {
          call(1.0);
        }
      } else if (c.offset <= 24 && c.offset >= 0) {
        if (opacity != c.offset / 24) {
          call(c.offset / 24);
        }
      } else if (c.offset <= 0) {
        if (opacity != 0.0) {
          call(0.0);
        }
      }
    });
  }

  ///Set the animation duration to execute in the future to reload the whole body page of a scaffold
  static Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
