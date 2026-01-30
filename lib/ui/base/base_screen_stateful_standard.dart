import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_stateful_impl.dart';
import 'package:flutter/material.dart';

import '../../res/app/app_colors.dart';

abstract class BaseScreenStatefulStandard extends BaseScreenStatefulImpl {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  Color appBarBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }
}
