import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends BaseController {
  CardUtils? cardUtils;
  RxString scheduledDate = "".obs;
  RxString scheduledTime = "".obs;

  TextEditingController messageTxt = TextEditingController();

  void onScheduleDate() {
    DateTimeUtils.pickDate(mContext!, call: (val) {
      scheduledDate.value = val;
    });
  }

  void onScheduleTime() {
    DateTimeUtils.pickTime(mContext!, call: (val) {
      scheduledTime.value = val;
    });
  }

  void onBookAppointmentOnClick() {}
}
