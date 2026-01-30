import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/ui/base/base_impl.dart';
import 'package:primecustomer/ui/base/base_sliver_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BaseSliverImpl extends BaseSliverScreen implements BaseImpl {
  BaseObject baseObject = BaseObject();
  BuildContext? mContext;

  @override
  void setContext(BuildContext context) {
    mContext = context;
  }

  @override
  Widget? flexBarWidget() {
    return null;
  }

  @override
  double expandedTitleScale() {
    return 1.5;
  }

  @override
  String heroTag() {
    return "_fav_rite";
  }

  @override
  Widget floatingActionButton(BuildContext context) {
    return const SizedBox();
  }

  @override
  FloatingActionButtonLocation actionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }

  @override
  Color appBarBackgroundColor() {
    return AppColors.primaryGreenColor;
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
  Widget bodyDeco(BuildContext context) {
    return Container();
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  List<Widget> actions() {
    return [];
  }

  @override
  double appBarElevation() {
    return 10;
  }

  @override
  String appBarTitle() {
    return "";
  }

  @override
  IconThemeData iconThemeData() {
    return const IconThemeData(color: AppColors.white);
  }

  @override
  RxInt counter() {
    return 0.obs;
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
  BaseObject getModel() {
    return baseObject;
  }

  @override
  void setModel(BaseObject baseObject) {
    this.baseObject = baseObject;
  }

  @override
  double expandedHeight() {
    return AppDimens.dimen200;
  }

  @override
  double? collapsedHeight() {
    return null;
  }

  @override
  double decoTopHeight() {
    return expandedHeight() * 0.9;
  }

  @override
  Widget flexibleSpace(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget floatingWidget({BuildContext? context}) {
    return const SizedBox();
  }

  @override
  SliverAppBar? appBar() {
    return null;
  }

  @override
  List<Widget> listView() {
    return [];
  }

  @override
  Widget? flexImageWidget() {
    return null;
  }

  @override
  Widget? flexImageWidgetIcon() {
    return Icon(Icons.favorite, color: AppColors.red, size: AppDimens.dimen18);
  }

  @override
  double? floatWidgetPaddingLeft() {
    return null;
  }

  @override
  double? floatWidgetPaddingRight() {
    return AppDimens.dimen20;
  }

  @override
  GestureTapCallback? floatWidgetOnclick() {
    return null;
  }

  @override
  bool decorateBody() {
    return false;
  }
}
