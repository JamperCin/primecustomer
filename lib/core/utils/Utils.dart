import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primecustomer/core/utils/date_time_utils.dart';

class Utils {
  static String getStringData(TextEditingController editingController) {
    return editingController.text.toString().trim();
  }

  static void delayTimer(Function call) {
    startTimer(1, () {
      call();
    }, duration: const Duration(milliseconds: 180));
  }

  /// A countdown timer that can be configured to fire once or repeatedly.
  ///
  /// The timer counts down from the specified duration to 0.
  /// When the timer reaches 0, the timer invokes the specified callback function.
  /// Use a periodic timer to repeatedly count down the same interval.
  ///Start Timer

  static Timer startTimer(int time, Function? onclick, {Duration? duration}) {
    List<int> list = [];
    var oneSec = duration ?? const Duration(seconds: 1);
    return Timer.periodic(oneSec, (Timer t) {
      list.add(oneSec.inHours);
      print("Timer Loading ${list.length} == $time");
      if (list.length == time) {
        t.cancel();
        t.cancel();
        if (onclick != null) {
          onclick();
        }
      }
    });
  }

  static void tickTimer(int time, Function(String) call) {
    const oneSec = Duration(seconds: 1);
    String tickedTime = DateTimeUtils.convertSecToTime(time);
    Timer.periodic(oneSec, (Timer timer) {
      if (time == 1) {
        call("");
        timer.cancel();
      } else {
        time--;
        tickedTime = DateTimeUtils.convertSecToTime(time);
        call(tickedTime);
      }
    });
  }

  static void printLog(Object data) {
    String tag = Get.currentRoute;
    if (kDebugMode) {
      debugPrint("LOG : $tag : ==> $data");
    }
  }

  static String capitalizeLetter({
    String? val,
    bool? capOnlyFirstLetter,
    bool? capAllFirstLetters,
    bool caps = true,
  }) {
    if (val == null || val.isEmpty) {
      return "";
    }

    if (caps && capAllFirstLetters == null && capOnlyFirstLetter == null) {
      return val.toUpperCase();
    }

    if (caps && capOnlyFirstLetter == true) {
      return val.capitalizeFirst ?? "";
    }

    if (caps && capAllFirstLetters == true) {
      try {
        var buffer = StringBuffer();
        List<String> arr = val.trim().replaceAll("  ", " ").split(" ");
        for (String s in arr) {
          if (s.isNotEmpty) {
            buffer.write(s.capitalizeFirst);
            buffer.write(" ");
          }
        }
        return buffer.toString();
      } catch (e) {
        return val;
      }
    }

    return val;
  }

  /// Converts [value] to a JSON string.
  ///
  /// If value contains objects that are not directly encodable to a JSON
  /// string (a value that is not a number, boolean, string, null, list or a map
  /// with string keys), the [toEncodable] function is used to convert it to an
  /// object that must be directly encodable.
  ///
  /// If [toEncodable] is omitted, it defaults to a function that returns the
  /// result of calling `.toJson()` on the unencodable object.
  ///
  /// Throws a JsonEncodingError if [value] results impossible to encode.
  static String convertEncode(Object value) {
    try {
      return json.encode(value);
    } catch (e) {
      print(e);
      return "";
    }
  }

  static dynamic convertDecode(dynamic object) {
    if (object is Map) {
      return object;
    }
    String body = (object is String) ? object : convertEncode(object);
    try {
      var jsonResponse = jsonDecode(Utils.utf8convert(body));
      return jsonResponse;
    } catch (e) {
      return jsonDecode(body);
    }
  }

  /*static void contactDisclosure(Function onAccepted) {
    DisclosureModel model = DisclosureModel(
        appBarTitle: "Permission",
        title: "Contact Permission Needed by this feature",
        message:
            "This feature requires contact upload from your phone contacts. Prime needs this contact to "
            "create the ownership of the gift card by assigning the gift card to the phone number. "
            "\n\nIn cases where the phone number provided is not on Prime platform, an SMS is sent to "
            "the phone number containing details of the purchased gift card.",
        asset: "assets/images/ic_share_marketing.png",
        onAccepted: (accepted) {
          prefUtils.setBool(PrefConstants.CONTACT_PERMISSION_ALLOWED, accepted);
          if (accepted) onAccepted(accepted);
        });

    NavApi.fireTarget(ProminentDisclosure(disclosureModel: model));
  }*/

  /* static void pickContact(Function(PhoneContact) callBack) {
    bool contactPerm =
        prefUtils.getBool(PrefConstants.CONTACT_PERMISSION_ALLOWED);
    if (!contactPerm) {
      contactDisclosure(() => pickContact(callBack));
      return;
    }

    FlutterContactPicker.pickPhoneContact(askForPermission: true)
        .then((contact) {
      callBack(contact);
    });
  }*/

  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  static String getOptionAsset(String option) {
    switch (option.toLowerCase()) {
      case 'prime_wallet_card_payment':
        return 'assets/images/ic_debit_card.png';
      case 'prime_merchant_card_payment':
        return 'assets/images/ic_card_cluster.png';
      case 'mobile_money_or_bank_payment':
        return 'assets/images/ic_mtn_mobile_money.jpeg'; //assets/images/ic_visa_mastercard.png#
      default:
        return 'assets/images/ic_mtn_mobile_money.jpeg#assets/images/ic_visa.png';
    }
  }
}
