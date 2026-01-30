import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/auth/login/bio_pin_auth_screen.dart';
import 'package:primecustomer/ui/auth/login/login_screen.dart';
import 'package:primecustomer/ui/base/base_impl.dart';
import 'package:primecustomer/ui/base/base_screen_impl.dart';
import 'package:primecustomer/ui/base/success_screen.dart';
import 'package:primecustomer/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/local/base_object.dart';

class NavApi {
  //static final List<BaseScreenImpl> _previousScreens = [];

  ///
  ///
  ///Call this method to fire the Event for Navigation across the app
  ///Sample call will be like below:
  ///
  /// NavApi.fireEvent(
  ///                   Event(
  ///                     action: ActionEvent.NAV_TO,
  ///                     target: SignUpScreen(),
  ///                     model: Customer(name: "Abele", age: "67"),
  ///                   ),
  ///                 );
  /// Always the model passed extends the [BaseObject] class.
  /// This allows us to pass data from one screen to another screen
  static void fireEvent(Event event) {
    //iterate through he event action
    switch (event.action ?? EventAction.NAV_TO) {
      case EventAction.LOG_OUT:
        Get.offAll(
          () => prefUtils.canUsePin() ? BioPinLoginScreen() : LoginScreen(),
        );
        break;
      case EventAction.NAV_TO:
        if (event.target != null) {
          Get.to(
            () => event.target!,
            preventDuplicates: false,
            routeName: '${event.target?.toStringShort()}',
            transition: event.transition,
          )?.then((value) {
            if (event.call != null) {
              event.call!();
            }
          });

          // _previousScreens.add(event.target!);
        } else {
          SnackBarApi.snackBarInfo("No target defined");
        }
        break;
      case EventAction.BACK:
        if (event.target == null) {
          Get.back();
        } else {
          Get.until((route) =>
              Get.currentRoute == '/${event.target?.toStringShort()}');
        }
        break;
      case EventAction.NAV_HOME:
        if (event.target == null) {
          event.setTarget(MainDashboardScreen());
        }

        debugPrint("clicked ${event.target}");

        if (event.target != null) {
          Get.offAll(() => event.target!);
          debugPrint("rendered ${event.target}");
        } else {
          SnackBarApi.snackBarInfo("No target defined");
        }

        break;
      case EventAction.NAV_OFF:
        if (event.target != null) {
          Get.offAll(() => event.target!);
          // _previousScreens.add(event.target!);
        } else {
          SnackBarApi.snackBarInfo("No target defined");
        }
        break;
      case EventAction.TOKEN_EXPIRE:
        break;
      case EventAction.SUCCESS:
        if (event.model == null) {
          event.setModel(SuccessModel());
        }
        event.setTarget(SuccessScreen());

        SuccessModel model = event.model as SuccessModel;
        if (model.clearMemory) {
          Get.offAll(
            () => event.target!,
            routeName: '${event.target?.toStringShort()}',
          );
        } else {
          Get.to(
            () => event.target!,
            routeName: '${event.target?.toStringShort()}',
          );
        }

        break;
    }

    if (event.target != null && event.model != null) {
      event.target!.setModel(event.model!);
    }
  }

  // static Widget getPreviousScreen(BaseScreenImpl target) {
  //   if (_previousScreens.isEmpty) {
  //     return const SizedBox();
  //   }
  //
  //   int currentScreenIndex = _previousScreens.indexOf(target);
  //   if (currentScreenIndex == -1) {
  //     return const SizedBox();
  //   }
  //
  //   int previousScreenIndex =
  //       currentScreenIndex == 0 ? currentScreenIndex : currentScreenIndex - 1;
  //   if (previousScreenIndex < _previousScreens.length) {
  //     return _previousScreens[previousScreenIndex];
  //   }
  //
  //   return const SizedBox();
  // }

  static fireSuccess(SuccessModel model) {
    fireEvent(Event(action: EventAction.SUCCESS, model: model));
  }

  static fire(
      {BaseImpl? target,
      EventAction? action,
      BaseObject? model,
      Function? call}) {
    fireEvent(Event(target: target, model: model, action: action, call: call));
  }

  static fireTarget(
    BaseImpl? target, {
    BaseObject? model,
    Function? call,
    Transition? trans,
  }) {
    fireEvent(Event(
      target: target,
      model: model,
      call: call,
      transition: trans,
    ));
  }

  static fireTargetHome() {
    fireEvent(
        Event(target: MainDashboardScreen(), action: EventAction.NAV_HOME));
  }

  static fireTargetOff(BaseImpl? target, {BaseObject? model}) {
    fireEvent(Event(target: target, model: model, action: EventAction.NAV_OFF));
  }

  static fireAction(EventAction action) {
    fireEvent(Event(action: action));
  }

  static fireBack() {
    fireAction(EventAction.BACK);
  }
}

class Event {
  BaseImpl? target;
  EventAction? action;
  BaseObject? model;
  Function? call;
  Transition? transition;

  Event({this.action, this.target, this.model, this.call, this.transition});

  void setTarget(BaseScreenImpl target) {
    this.target = target;
  }

  void setModel(BaseObject model) {
    this.model = model;
  }
}
