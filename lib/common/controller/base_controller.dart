import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class BaseController extends GetxController {
  BuildContext? mContext;

  void setContext(BuildContext context) {
    mContext = context;
  }
}
