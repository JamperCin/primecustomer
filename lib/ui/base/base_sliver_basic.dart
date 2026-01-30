import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/app/app_colors.dart';
import '../../res/config/size_config.dart';

class BaseSliverBasic extends BaseScreenStandard {
  final ScrollController scrollController = ScrollController();
  final RxBool isExpanded = true.obs;

  double expandedHeight() {
    return AppDimens.dimen200;
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Color appBarBackgroundColor() {
    return AppColors.market;
  }

  Widget flexBackGroundWidget() {
    return const SizedBox.shrink();
  }

  Widget flexBackGroundSubWidget() {
    return const SizedBox.shrink();
  }

  Widget page(BuildContext context) {
    return const SizedBox();
  }

  Widget titleWidget(BuildContext context) {
    return const SizedBox();
  }

  @override
  Color appBarTitleColor() {
    return AppColors.white;
  }

  TextStyle appBarTitleStyle() {
    return AppTextStyles.title.copyWith(
      color: appBarTitleColor(),
    );
  }

  bool setOverlay() {
    return true;
  }

  Future<void> listenToOffset() async {}

  @override
  IconThemeData iconThemeData() {
    return const IconThemeData(color: AppColors.white);
  }

  bool get _isAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (200 - appBarHeight());
  }

  void _initScrollListener() {
    scrollController.addListener(() {
      isExpanded.value = !_isAppBarExpanded;
    });
  }

  @override
  Widget body(BuildContext context) {
    _initScrollListener();
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: expandedHeight(),
          backgroundColor: appBarBackgroundColor(),
          actions: actions(),
          iconTheme: iconThemeData(),
          stretch: true,
          toolbarHeight: appBarHeight(),
          centerTitle: true,
          title: titleWidget(context),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: appBarTitleWidget() ??
                Text(
                  appBarTitle(),
                  style: appBarTitleStyle(),
                ),
            background: setOverlay()
                ? Stack(
                    children: [
                      flexBackGroundWidget(),
                      Container(
                        height: SizeConfig.screenWidth,
                        width: SizeConfig.screenWidth,
                        color: AppColors.blackOpacity,
                      ),
                      flexBackGroundSubWidget(),
                    ],
                  )
                : flexBackGroundWidget(),
          ),
        ),
        SliverToBoxAdapter(
          child: page(context),
        )
      ],
    );
  }
}
