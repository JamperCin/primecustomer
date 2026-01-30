import 'package:primecustomer/controller/view/claim_code_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClaimCodeScreen extends BaseScreenStandard {
  final ClaimCodeController controller = Get.put(ClaimCodeController());

  ClaimCodeScreen() {
    controller.codeTxt.clear();
    controller.pinCode.value = "";
    controller.selectedCodeType.value = controller.codeTypeList[0];
  }

  @override
  String appBarTitle() {
    return "Claim Code";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];
    list.add(SizedBox(height: AppDimens.dimen30));

    list.add(UiApi.assetImage("assets/images/ic_phone_verify.svg"));

    list.add(SizedBox(height: AppDimens.dimen30));

    list.add(Obx(
      () => Text(
        controller.isPromoCode.value ? "Claim Promo Code" : "Claim Gift Card",
        style: AppTextStyles.h5StyleBold,
        textAlign: TextAlign.center,
      ),
    ));
    list.add(SizedBox(height: AppDimens.dimen10));

    list.add(Text(
      "Enter your 16-digit code below to claim your gift card. If you have a referral code, "
      "kindly enter the referral code below to redeem your reward.",
      style: AppTextStyles.descStyleLight,
      textAlign: TextAlign.center,
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(Obx(
      () => UiApi.textFormField(
          maxLength: controller.isPromoCode.value ? null : 16,
          controller: controller.codeTxt,
          hintText: controller.isPromoCode.value
              ? "Enter Promo Code"
              : "Enter 16-digit",
          labelText: controller.isPromoCode.value
              ? "Enter Promo Code"
              : "Enter 16-digit",
          keyboardType: controller.isPromoCode.value
              ? TextInputType.text
              : TextInputType.number,
          onChanged: controller.onTextChanged),
    ));

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(Obx(
      () => UiApi.radioWidget(
        dict: controller.codeTypeList,
        defaultValue: controller.selectedCodeType,
        dirIsVertical: false,
        onTap: (dic) {
          dismissKeyBoard(mContext!);
          controller.onChangeCodeType(dic);
        },
      ),
    ));
    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(Obx(
      () => UiApi.button(
          text: "Submit",
          backgroundColor: controller.isValidEntry.value
              ? AppColors.introColor2
              : AppColors.dimWhite,
          onPressed: () {
            setContext(mContext!);
            controller.onConfirmSubmission();
          }),
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    return list;
  }
}
