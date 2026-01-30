import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateTimeUtils {
  static String getCurrentDate({String format = "yyyy-MM-dd"}) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(format).format(now);
    return formattedDate;
  }

  static String formatDate(DateTime date, {String format = "yyyy-MM-dd"}) {
    final f = DateFormat(format);
    return f.format(
        DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch));
  }

  static int getDateTimeDifference(
      {required String date,
      bool min = false,
      bool hours = false,
      bool sec = false}) {
    if (date.isEmpty) {
      return 0;
    }

    DateTime? createdAt = convertDateFromString(date);

    if (createdAt == null) {
      return 0;
    }

    if (min) {
      return DateTime.now().difference(createdAt).inMinutes;
    }

    if (hours) {
      return DateTime.now().difference(createdAt).inHours;
    }

    if (sec) {
      return DateTime.now().difference(createdAt).inSeconds;
    }

    return DateTime.now().difference(createdAt).inDays;
  }

  static String formatDateString(String? date, {String format = "yyyy-MM-dd"}) {
    if (date == null || date.isEmpty) {
      return getCurrentDate(format: format);
    }
    final f = DateFormat(format);
    try {
      return f.format(DateTime.fromMillisecondsSinceEpoch(
          DateTime.parse(date).millisecondsSinceEpoch));
    } catch (e) {
      return date;
    }
  }

  static String timeUntil(String date) {
    DateTime dateTime = convertDateFromString(date);
    return timeago.format(dateTime, allowFromNow: true);
  }

  static String convertSecToTime(int seconds) {
    int min = Duration(seconds: seconds).inMinutes;
    int hours = Duration(seconds: seconds).inHours;
    min = (min % 60) >= 0 ? (min % 60) : min;
    int sec = (seconds % 60) >= 0 ? (seconds % 60) : seconds;

    String hr = hours == 0 ? "" : "$hours hr(s)";
    String mn = min == 0 ? "" : "$min min(s)";

    return "$hr $mn $sec sec(s)".trim();
  }

  /// Examples of accepted strings:
  ///
  /// * `"2012-02-27"`
  /// * `"2012-02-27 13:27:00"`
  /// * `"2012-02-27 13:27:00.123456789z"`
  /// * `"2012-02-27 13:27:00,123456789z"`
  /// * `"20120227 13:27:00"`
  /// * `"20120227T132700"`
  /// * `"20120227"`
  /// * `"+20120227"`
  /// * `"2012-02-27T14Z"`
  /// * `"2012-02-27T14+00:00"`
  /// * `"-123450101 00:00:00 Z"`: in the year -12345.
  /// * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
  static DateTime convertDateFromString(String strDate) {
    return DateTime.parse(strDate);
  }

  /// Examples of accepted strings:
  ///
  /// * `"2012-02-27"`
  /// * `"2012-02-27 13:27:00"`
  /// * `"2012-02-27 13:27:00.123456789z"`
  /// * `"2012-02-27 13:27:00,123456789z"`
  /// * `"20120227 13:27:00"`
  /// * `"20120227T132700"`
  /// * `"20120227"`
  /// * `"+20120227"`
  /// * `"2012-02-27T14Z"`
  /// * `"2012-02-27T14+00:00"`
  /// * `"-123450101 00:00:00 Z"`: in the year -12345.
  /// * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
  static bool isValidDateTime(String date) {
    DateTime currentDate = DateTime.now();
    DateTime comparedDate = convertDateFromString(
        date.replaceAll(" pm", ":00").replaceAll(" am", ":00"));
    bool valid = currentDate.isBefore(comparedDate);
    print("Checking date == $comparedDate  || valid == $valid");
    return valid;
  }

  static String dateTime(String date) {
    DateTime formattedDate = convertDateFromString(
        date.replaceAll(" pm", ":00").replaceAll(" am", ":00"));
    return formatDate(formattedDate, format: "yyyy-MM-dd hh:mm:ss");
  }

  ///Pick DateTime from a dialog
  /* static void pickDateTime(
    BuildContext context, {
    Function(String)? onDatePicked,
    bool maxDateToday = false,
    bool minDateToday = false,
    String dateFormat = "yyyy-MM-dd hh:mm ss",
  }) {
    try {
      DatePicker.showDateTimePicker(context,
          theme: DatePickerTheme(
            doneStyle: AppTextStyles.getStyle(
                AppTextStyles.descStyleBold, AppColors.white),
            cancelStyle: AppTextStyles.getStyle(
                AppTextStyles.descStyleBold, AppColors.white),
            itemStyle: AppTextStyles.descStyleLight,
            containerHeight: AppDimens.dimen200,
            headerColor: AppColors.primaryGreenColor,
            titleHeight: AppDimens.dimen40,
          ),
          showTitleActions: true,
          minTime: minDateToday ? DateTime.now() : null,
          maxTime: maxDateToday ? DateTime.now() : null, onConfirm: (date) {
        if (onDatePicked != null) {
          onDatePicked(formatDate(date, format: dateFormat));
        }
      }, currentTime: DateTime.now(), locale: LocaleType.en);
    } catch (E) {
      print("Error ${E}");
    }
  }*/

  ///Pick Time from a material dialog
  static void pickTime(BuildContext context, {Function(String)? call}) {
    showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    ).then((time) {
      if (call != null && time != null) {
        String hr =
            "${time.hour}".length == 1 ? "0${time.hour}" : "${time.hour}";
        String min =
            "${time.minute}".length == 1 ? "0${time.minute}" : "${time.minute}";
        call("$hr:$min ${time.period.name}");
      }
    });
  }

  ///Pick Date from a material dialog
  static void pickDate(
    BuildContext context, {
    Function(String)? call,
    bool maxDateToday = false,
    bool minDateToday = false,
    String dateFormat = "yyyy-MM-dd",
  }) {
    var now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2, 12, 31),
    ).then((date) {
      if (call != null && date != null) {
        call(formatDate(date, format: dateFormat));
      }
    });
  }
}
