import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/ui/base/base_sliver_impl.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';

class BaseSliverStandard extends BaseSliverImpl {
  @override
  Widget flexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
      expandedTitleScale: expandedTitleScale(),
      title: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.dimen10,
          bottom: AppDimens.dimen5,
        ),
        child: flexBarWidget() ??
            Text(
              Utils.capitalizeLetter(
                val: appBarTitle(),
                capAllFirstLetters: true,
              ),
              style:
                  AppTextStyles.titleStyleBold.copyWith(color: AppColors.white),
            ),
      ),
      background: flexImageWidget(),
    );
  }

  @override
  Widget floatingWidget({BuildContext? context}) {
    return const SizedBox.shrink();
  }

  @override
  bool decorateBody() {
    return true;
  }
}
