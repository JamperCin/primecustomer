import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:flutter/material.dart';

class SliverController extends SliverPersistentHeaderDelegate {
  double expandedHeight;
  Widget floatingCard;
  Widget background;
  Widget appBarTitle;
  Widget body;
  List<Widget>? actions;

  SliverController({
    this.expandedHeight = 100,
    this.floatingCard = const SizedBox(),
    this.background = const SizedBox(),
    this.appBarTitle = const SizedBox(),
    this.actions,
    this.body = const SizedBox(),
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsCnt) {
    final size = AppDimens.dimen60;
    expandedHeight = AppDimens.dimen220;
    final top = expandedHeight - shrinkOffset - size / 2;
    return Stack(
      // overflow: Overflow.visible,
      // clipBehavior: Clip.antiAlias,
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          child: body,
          top: top + AppDimens.dimen20,
        ),
        Positioned(
          child: Opacity(
            opacity: disappear(shrinkOffset),
            child: floatingCard,
          ),
          top: top,
          left: AppDimens.dimen32,
          right: AppDimens.dimen32,
        ),
      ],
    );
  }

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: AppBar(
          backgroundColor: AppColors.black.withOpacity(0.3),
          iconTheme: const IconThemeData(
            color: AppColors.white,
          ),
          title: appBarTitle,
          actions: actions,
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        alwaysIncludeSemantics: true,
        child: background,
      );

  Widget buildButton(String text, IconData icon) {
    return TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: AppTextStyles.getStyle(
                  AppTextStyles.descStyleRegular, AppColors.black),
            )
          ],
        ));
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;
  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + AppDimens.dimen30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
