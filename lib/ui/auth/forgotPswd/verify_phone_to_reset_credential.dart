import 'package:primecustomer/controller/view/forgot_password_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/ui/base/base_screen_stateful_dec.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../res/ui_helpers/ui_api.dart';

class VerifyPhoneToResetCred extends BaseScreenStatefulDecorated {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());

  VerifyPhoneToResetCred() {
    controller.clear();
    Utils.startTimer(1, () {
      controller.selectedAuthType.value = controller.authTypeList[0];
      controller.shouldResetPin.value = getModel().shouldResetPin;
      controller.populatePhone();
    }, duration: const Duration(milliseconds: 180));
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) {
      return baseObject as CardModel;
    }

    return CardModel();
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  double decoPageTopPadding() {
    return AppDimens.dimen5;
  }

  @override
  Widget page(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                NavApi.fireBack();
              },
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: AppDimens.dimen20,
              ),
            ),
          ),
          Expanded(
            child: UiApi.listView(list: listView(), padding: EdgeInsets.zero),
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(
      Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppDimens.dimen70),
            Text(
              'Forgot ${controller.shouldResetPin.value ? "Pin?" : "Password?"}',
              style:
                  AppTextStyles.h1StyleMedium.copyWith(color: AppColors.black),
            ),
            SizedBox(height: AppDimens.dimen20),
            Text(
              'Recover your ${controller.shouldResetPin.value ? "Pin" : "Password"} by entering your phone number and choosing your convenient medium of verification.',
              style: AppTextStyles.descStyleLight.copyWith(
                height: 1.5,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: AppDimens.dimen50),
            Text(
              'How do you you want to get verified?',
              style: AppTextStyles.descStyleBold,
            ),
            SizedBox(height: AppDimens.dimen20),
            UiApi.radioWidget(
              dict: controller.authTypeList,
              defaultValue: controller.selectedAuthType,
              caps: false,
              style: AppTextStyles.descStyleRegular,
              dirIsVertical: true,
              onTap: (dic) {
                controller.onChangeAuthType(dic);
              },
            ),
            SizedBox(height: AppDimens.dimen40),
            Text(
              'Phone Number',
              style: AppTextStyles.descStyleMedium
                  .copyWith(color: AppColors.black),
            ),
            SizedBox(height: AppDimens.dimen10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: UiApi.textFormField(
                    enabled: false,
                    hintText: '+233',
                    controller: controller.countryCodeTxt,
                    onTap: () {
                      controller.onPickCountryCode();
                    },
                  ),
                  flex: 1,
                ),
                SizedBox(width: AppDimens.dimen10),
                Flexible(
                  child: UiApi.textFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      hintText: 'Enter your phone number',
                      prefixIcon: UiApi.assetImage(
                        'assets/images/ic_mobile.svg',
                        height: AppDimens.dimen20,
                        width: AppDimens.dimen20,
                      ),
                      //enabled: !controller.shouldResetPin.value,
                      controller: controller.phoneTxt,
                      focusColor: controller.isPhoneNumberValid.value
                          ? null
                          : AppColors.red,
                      onChanged: (value) {
                        controller.liveValidatePhoneNum();
                      }),
                  flex: 3,
                ),
              ],
            ),
            SizedBox(height: AppDimens.dimen10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                controller.validPhoneString.value,
                style: AppTextStyles.style(
                  style: AppTextStyles.smallerSubDescStyleRegular,
                  color: controller.isPhoneNumberValid.value
                      ? AppColors.primaryGreenColor
                      : AppColors.red,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: AppDimens.dimen100),
            Center(
                child: controller.isVerifyingPhone.value
                    ? UiApi.circularProgressBar()
                    : UiApi.button(
                        backgroundColor: controller.isPhoneNumberValid.value
                            ? AppColors.introColor2
                            : AppColors.dimWhite,
                        text: "Continue",
                        onPressed: () {
                          controller.setContext(mContext!);
                          controller.onVerifyPhone();
                        })),
          ],
        ),
      ),
    );

    return list;
  }
}
