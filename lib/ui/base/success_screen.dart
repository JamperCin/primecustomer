import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';

import '../../res/api/navigation_api.dart';
import '../../res/app/app_colors.dart';
import '../../res/app/app_dimens.dart';
import '../../res/app/app_text_styles.dart';
import '../../res/ui_helpers/ui_api.dart';

class SuccessScreen extends BaseScreenStandard {
  @override
  SuccessModel getModel() {
    return baseObject as SuccessModel;
  }

  @override
  String appBarTitle() {
    return "";
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  List<Widget> actions() {
    return getModel().onSkipClick == null
        ? []
        : [
            UiApi.textButton(
              trailingText: "SKIP",
              trailingTextColor: AppColors.primaryGreenColor,
              onTap: () {
                getModel().onSkipClick!(mContext!);
              },
            )
          ];
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppDimens.dimen32,
          left: AppDimens.dimen24,
          right: AppDimens.dimen24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: UiApi.assetImage(
                getModel().asset,
                height: AppDimens.dimen200,
                width: AppDimens.dimen200,
              ),
            ),
            SizedBox(height: AppDimens.dimen40),
            Text(
              getModel().title,
              style: AppTextStyles.h3StyleBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.dimen30),
            getModel().richText == null
                ? Text(
                    getModel().message,
                    style: AppTextStyles.descStyleLight,
                    textAlign: getModel().textAlign,
                  )
                : UiApi.richText(
                    mod: getModel().richText!,
                    maxLines: getModel().maxLines,
                    textAlign: getModel().textAlign,
                  ),
            SizedBox(height: AppDimens.dimen70),
            UiApi.button(
              text: getModel().buttonText,
              onPressed: () {
                if (getModel().onButtonOnClick != null) {
                  getModel().onButtonOnClick!(context);
                  return;
                }

                if (getModel().event != null) {
                  NavApi.fireEvent(getModel().event!);
                  return;
                }

                if (getModel().screen != null) {
                  NavApi.fireEvent(Event(target: getModel().screen));
                  return;
                }

                if (getModel().onButtonOnClick == null &&
                    getModel().event == null &&
                    getModel().screen == null) {
                  NavApi.fireAction(EventAction.NAV_HOME);
                }
              },
            ),
            SizedBox(height: AppDimens.dimen50),
          ],
        ),
      ),
    );
  }
}
