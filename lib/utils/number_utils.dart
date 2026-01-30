import 'package:country_picker/country_picker.dart';
import 'package:primecustomer/extensions/double_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import '../data/model/remote/country_model.dart';

class NumberUtils {
  static String calcDiscountPercent(double price, double discount) {
    if (price == 0 || discount == 0) {
      return "0";
    }

    double percent = (discount / price) * 100;
    print("percent == $percent");
    return percent.toDecimalPlaces(dec: 0);
  }

  ///Parse money
  static String parseIntMoney(String source) {
    int value = 0;
    try {
      if (!source.contains(".")) {
        value = parseInt(source);
      } else {
        int index = source.indexOf(".");
        String temp = source.replaceAll(".", "");
        value = parseInt(temp);

        if (value == 0) {
          //return "0";
        }

        print("SRC $source == IND $index == TEM $temp == VSL $value");

        List<String> list = temp.split("");
        int i = 0;
        temp = "";
        for (String str in list) {
          temp = temp + str;
          if (i == index - 1) {
            temp = temp + ".";
          }
          i++;
        }
        return temp;
      }
    } catch (e) {
      print("Error $e");
    }
    return "$value";
  }

  static String moneyCurrencyFormat(
    dynamic price, {
    int dec = 0,
    String currency = "GHS",
  }) {
    if (price is String) {
      return "$currency ${moneyFormat(price, decPlace: dec)}";
    }

    if (price is double) {
      return "$currency ${moneyFormatDouble(price, decPlace: dec)}";
    }

    return "$currency 0.00";
  }

  static String moneyFormat(dynamic price, {int decPlace = 0}) {
    if (price == null || (price is String && price.isEmpty)) {
      return "0.00";
    }

    if (price is double) {
      return moneyFormatDouble(price, decPlace: decPlace);
    }

    var value = price;
    double p = parseDouble(price);
    value = p.toStringAsFixed(decPlace);

    if (price.length > 2) {
      value = value.replaceAll(RegExp(r'\.D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return value;
  }

  static String moneyFormatDouble(double? price, {int decPlace = 0}) {
    if (price == null) {
      return "0.00";
    }

    try {
      var value = price.toStringAsFixed(decPlace);

      if (price.toString().length > 2) {
        value = value.replaceAll(RegExp(r'\.D'), '');
        value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
        return value;
      }
      return value;
    } catch (e) {
      debugPrint("Format ==> $e");
      return "0.00";
    }
  }

  static double parseDouble(String amount) {
    double value = 0.0;
    try {
      value = amount.isEmpty ? 0.0 : double.parse(amount);
    } catch (e) {
      print("Error -- $amount ==> $e");
    }
    return value;
  }

  static int parseInt(String source) {
    int value = 0;
    try {
      value = int.parse(source);
    } catch (e) {
      debugPrint("Error $e");
    }
    return value;
  }

  static String cleanPhoneNumber(String phone) {
    return phone.trim().replaceAll("+", "").replaceAll(" ", "");
  }

  static void formatPhone(String phone, String code, Function(String) call) {
    var isoCode = IsoCode.GH;
    for (var iso in IsoCode.values) {
      if (iso.name.toUpperCase() == code.toUpperCase()) {
        isoCode = iso;
        break;
      }
    }
    try {
      final parsedPhone = PhoneNumber.parse(phone, callerCountry: isoCode);
      debugPrint(
        "This Phone number: ${parsedPhone.formatNsn()} isValid: ${parsedPhone.isValid()} -- Code : $isoCode",
      );
      call(parsedPhone.formatNsn());
    } catch (e) {
      call("");
    }
  }

  static void validatePhone(String phone, String code, Function(bool) call) {
    //Find a match for the IsoCode from the country code
    var isoCode = IsoCode.GH;
    for (var iso in IsoCode.values) {
      if (iso.name.toUpperCase() == code.toUpperCase()) {
        isoCode = iso;
        break;
      }
    }
    try {
      final parsedPhone = PhoneNumber.parse(phone, callerCountry: isoCode);
      debugPrint(
        "Phone number: ${parsedPhone.formatNsn()} isValid: ${parsedPhone.isValid()} -- Code : $isoCode",
      );
      call(parsedPhone.isValid());
    } catch (e) {
      call(false);
    }
  }

  static void pickCountryCode(BuildContext c, Function(CountryModel) call) {
    showCountryPicker(
      context: c,
      showPhoneCode: true,
      onSelect: (Country c) {
        call(
          CountryModel(
            name: c.name,
            codeName: c.countryCode,
            codeNumber: c.phoneCode,
          ),
        );
      },
    );
  }

  static String getCurrencyAmount(
    Object amnt, {
    int dec = 0,
    String currency = "GHS",
  }) {
    String amount = amnt is String
        ? amnt
        : amnt is double
        ? amnt.toString()
        : "0";
    return "$currency ${moneyFormat(amount, decPlace: dec)}";
  }

  static String parseString(double val) {
    try {
      return val.toString();
    } catch (e) {
      return "";
    }
  }
}
