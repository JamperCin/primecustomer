import 'dart:math';

import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_stateful_impl.dart';
import 'package:flutter/material.dart';

import '../../res/app/app_colors.dart';
import '../../res/app/app_dimens.dart';

abstract class BaseScreenStatefulDecorated extends BaseScreenStatefulImpl {
  ///This is the main page that is rendered on top of this main page
  ///Use this as the main design to the page
  Widget page(BuildContext context);

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            right: -AppDimens.dimen80,
            top: -AppDimens.dimen70,
            child: Transform.rotate(
              angle: rotateAsset() ? (pi / 90 * 13) : 0,
              child: UiApi.assetImage(
                decoPageAsset(),
                height: AppDimens.dimen300,
                width: AppDimens.dimen300,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: AppColors.white.withOpacity(0.8),
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.dimen20,
                  right: AppDimens.dimen20,
                  top: decoPageTopPadding(),
                  bottom: AppDimens.dimen20,
                ),
                child: page(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
