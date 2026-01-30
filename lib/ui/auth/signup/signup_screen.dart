import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/app_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controller/view/signup_controller.dart';

class SignUpScreen extends BaseScreenStandard {
  final SignUpController controller = Get.put(SignUpController());

  SignUpScreen() {
    controller.isImageUploading.value = false;
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  String appBarTitle() {
    return "Sign Up";
  }

  @override
  List<Widget> actions() {
    return [
      UiApi.textButton(
          trailingText: "Next",
          trailingTextColor: AppColors.primaryGreenColor,
          onTap: () {
            controller.onNextOnClick();
          })
    ];
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: AppDimens.dimen16,
            left: AppDimens.dimen16,
            right: AppDimens.dimen16,
            bottom: AppDimens.dimen10),
        child: Obx(
          () => Column(
            children: [
              Center(
                child: controller.isImageUploading.value
                    ? UiApi.circularProgressBar(radius: AppDimens.dimen50)
                    : UiApi.circleImageView(
                        url: controller.profilePicURl.value,
                        onTap: () {
                          controller.onProfileImageOnClick();
                        },
                      ),
              ),
              SizedBox(height: AppDimens.dimen10),
              Text(
                "Upload profile picture",
                style: AppTextStyles.subDescRegular,
              ),
              SizedBox(height: AppDimens.dimen20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: AppDimens.dimen8),
                  child: Text(
                    "Personal Information",
                    style: AppTextStyles.titleStyleMedium
                        .copyWith(color: AppColors.black),
                  ),
                ),
              ),
              SizedBox(height: AppDimens.dimen5),
              Card(
                color: AppColors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.all(AppDimens.dimen2),
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.dimen16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First name',
                        style: AppTextStyles.subDescRegular
                            .copyWith(color: AppColors.black),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      UiApi.textFormField(
                        hintText: 'Enter your first name',
                        controller: controller.firstNameTxt,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(height: AppDimens.dimen15),
                      Text(
                        'Last name',
                        style: AppTextStyles.subDescRegular
                            .copyWith(color: AppColors.black),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      UiApi.textFormField(
                        hintText: 'Enter your last name',
                        controller: controller.lastNameTxt,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      Text(
                        'Phone Number',
                        style: AppTextStyles.subDescRegular
                            .copyWith(color: AppColors.black),
                      ),
                      SizedBox(height: AppDimens.dimen5),
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
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  hintText: 'Enter your phone number',
                                  controller: controller.phoneTxt,
                                  focusColor:
                                      controller.isPhoneNumberValid.value
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
                              style: AppTextStyles.smallerSubDescStyleRegular,
                              color: controller.isPhoneNumberValid.value
                                  ? AppColors.primaryGreenColor
                                  : AppColors.red,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      Text(
                        'Password',
                        style: AppTextStyles.subDescRegular
                            .copyWith(color: AppColors.black),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      UiApi.textFormField(
                        isPasswordField: true,
                        hintText: 'Enter your password',
                        obscuringCharacter: '*',
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        controller: controller.passwordTxt,
                      ),
                      SizedBox(height: AppDimens.dimen15),
                      Text(
                        'Confirm Password',
                        style: AppTextStyles.subDescRegular
                            .copyWith(color: AppColors.black),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      UiApi.textFormField(
                        isPasswordField: true,
                        hintText: 'Confirm your password',
                        obscuringCharacter: '*',
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        controller: controller.confPasswordTxt,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppDimens.dimen10,
              ),
              Padding(
                padding: EdgeInsets.only(right: AppDimens.dimen12),
                child: Row(
                  children: [
                    Flexible(
                      child: UiApi.checkBox(
                        controller.onAgreeCheck,
                        onTextClick: () {
                          controller.onTermsOnClick(AppConfig.PRIME_TERMS);
                        },
                        checkValue: controller.isTermsAndConditionsChecked,
                        style: AppTextStyles.descStyleLight,
                        textWidget: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Agree to ",
                                style: AppTextStyles.subDescStyleLight
                                    .copyWith(color: AppColors.black),
                              ),
                              TextSpan(
                                text: "Prime's Terms And Conditions",
                                style: AppTextStyles.style(
                                  style: AppTextStyles.smallSubDescStyleRegular,
                                  color: AppColors.skyBlueColor,
                                ),
                              ),
                              TextSpan(
                                text: " before signing up.",
                                style: AppTextStyles.subDescStyleLight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppDimens.dimen10,
              ),
              GestureDetector(
                onTap: () {
                  controller.onTermsOnClick(AppConfig.PRIVACY_POLICY);
                },
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.dimen10),
                  child: RichText(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Read on the ",
                          style: AppTextStyles.subDescStyleLight,
                        ),
                        TextSpan(
                          text: "Prime's Privacy Policy",
                          style: AppTextStyles.style(
                            style: AppTextStyles.smallSubDescStyleRegular,
                            color: AppColors.skyBlueColor,
                          ),
                        ),
                        TextSpan(
                          text: " to know how your data is stored and used.",
                          style: AppTextStyles.subDescStyleLight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimens.dimen70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
