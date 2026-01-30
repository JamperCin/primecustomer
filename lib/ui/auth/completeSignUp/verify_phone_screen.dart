import 'package:primecustomer/controller/view/signup_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerifyPhoneScreen extends BaseScreenStandard {
  final SignUpController controller = Get.put(SignUpController());

  VerifyPhoneScreen() {
    controller.phoneTxt.clear();
    /* Utils.startTimer(1, () {
      controller.prepopulatePhone(getModel().phoneNumber);
    }, duration: const Duration(milliseconds: 180));*/
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) {
      return baseObject as CardModel;
    }

    return CardModel();
  }

  @override
  String appBarTitle() {
    return "Complete Account Verification";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Color backgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        top: AppDimens.dimen16,
        left: AppDimens.dimen24,
        right: AppDimens.dimen24,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      itemCount: listView().length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) => listView()[index],
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Column(
      children: [
        Center(
          child: UiApi.assetImage(
            "assets/images/ic_phone_verify.svg",
            height: AppDimens.dimen170,
          ),
        ),
        SizedBox(height: AppDimens.dimen40),
        Text(
          "Verify your phone number to proceed.",
          style: AppTextStyles.descStyleLight,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimens.dimen100),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Enter your phone Number',
            style:
                AppTextStyles.descStyleRegular.copyWith(color: AppColors.black),
          ),
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
              child: Obx(
                () => UiApi.textFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    hintText: 'Phone Number',
                    controller: controller.phoneTxt,
                    focusColor: controller.isPhoneNumberValid.value
                        ? null
                        : AppColors.red,
                    onChanged: (value) {
                      controller.liveValidatePhoneNum();
                    }),
              ),
              flex: 3,
            ),
          ],
        ),
        SizedBox(height: AppDimens.dimen10),
        Obx(
          () => Align(
            alignment: Alignment.centerRight,
            child: Text(
              controller.validPhoneString.value,
              style: AppTextStyles.style(
                style: AppTextStyles.smallestSubDescStyleRegular,
                color: controller.isPhoneNumberValid.value
                    ? AppColors.primaryGreenColor
                    : AppColors.red,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    ));

    list.add(SizedBox(height: AppDimens.dimen100));

    list.add(
      Obx(
        () => UiApi.button(
            text: "Verify",
            backgroundColor: controller.isPhoneNumberValid.value
                ? AppColors.introColor2
                : AppColors.dimWhite,
            onPressed: () {
              controller.onVerifyPhoneOnClick();
            }),
      ),
    );

    return list;
  }
}
