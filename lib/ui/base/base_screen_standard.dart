import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';

import '../../res/app/app_colors.dart';
import 'base_screen_impl.dart';

abstract class BaseScreenStandard extends BaseScreenImpl {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  Color appBarBackgroundColor() {
    return backgroundColor();
  }

  @override
  IconThemeData iconThemeData() {
    return IconThemeData(color: Colors.black);
  }

  @override
  Color backgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }
}
