import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/app_bar_api.dart';
import 'package:primecustomer/ui/base/base_impl.dart';
import 'package:primecustomer/ui/base/base_screen_stateful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseScreenStatefulImpl extends BaseScreenStateful
    implements BaseImpl {
  BaseObject baseObject = BaseObject();
  BuildContext? mContext;

  @override
  void initState(SingleTickerProviderStateMixin<StatefulWidget> vsync) {
    // TODO: implement initState
  }

  @override
  void dispose(SingleTickerProviderStateMixin<StatefulWidget> vsync) {
    // TODO: implement dispose
  }

  @override
  void setContext(BuildContext context) {
    mContext = context;
  }

  @override
  double decoPageTopPadding() {
    return AppDimens.dimen70;
  }

  @override
  double appBarHeight() {
    return AppDimens.dimen50;
  }

  @override
  String decoPageAsset() {
    return "assets/images/ic_cluster_cards.png";
  }

  @override
  bool rotateAsset() {
    return true;
  }

  @override
  Widget bottomSheet(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget floatingActionButton(BuildContext context) {
    return SizedBox();
  }

  @override
  List<Widget> listView() {
    return [];
  }

  @override
  FloatingActionButtonLocation actionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }

  @override
  Color appBarBackgroundColor() {
    return AppColors.white;
  }

  @override
  Color appBarTitleColor() {
    return AppColors.black;
  }

  @override
  Widget? appBarTitleWidget() {
    return null;
  }

  @override
  bool shouldDismissKeyboard() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return Container();
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  List<Widget> actions() {
    return [];
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  String appBarTitle() {
    return "";
  }

  @override
  IconThemeData iconThemeData() {
    return IconThemeData();
  }

  @override
  RxInt counter() {
    return 0.obs;
  }

  @override
  IconData icon() {
    return Icons.notification_important_sharp;
  }

  @override
  void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Color backgroundColor() {
    return AppColors.white;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return const SizedBox.shrink();
  }

  @override
  PreferredSizeWidget appBar() {
    return AppBarApi.appBarLight(
      title: appBarTitle(),
      elevation: appBarElevation(),
      appBarHeight: appBarHeight(),
      titleWidget: appBarTitleWidget(),
      iconTheme: iconThemeData(),
      actions: actions(),
      titleColor: appBarTitleColor(),
      backgroundColor: appBarBackgroundColor(),
    );
  }

  @override
  BaseObject getModel() {
    return baseObject;
  }

  @override
  void setModel(BaseObject baseObject) {
    this.baseObject = baseObject;
  }
}
