import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_deco_ext.dart';
import 'package:core_module/core_ui/base_screen/base_screen_dec.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:primecustomer/controller/view/login_controller.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class LoginScreen extends BaseScreenDecorated {
  final _controller = Get.put(LoginController());

  @override
  String decoPageAsset() {
    return "assets/images/ic_cluster_cards.png";
  }

  LoginScreen() {
    prefUtils.setLogin(false);
    Utils.startTimer(2, () {
      _controller.checkForAppUpdate();
      _controller.checkForUnverifiedAccount();
    });
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    _controller.setContext(context);
  }

  @override
  Widget page(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimens.dimen50),
          Text(
            'Log In',
            style: AppTextStyles.h1StyleMedium.copyWith(color: AppColors.black),
          ),
          SizedBox(height: AppDimens.dimen20),
          Text(
            'Log in to Prime App with your phone number and password',
            style: AppTextStyles.descStyleLight,
          ),
          SizedBox(height: 40.dp()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: AppTextStyles.descStyleMedium
                    .copyWith(color: AppColors.black),
              ),
              SizedBox(height: AppDimens.dimen5),
              UiApi.textFormField(
                keyboardType: TextInputType.phone,
                controller: _controller.phoneTxtCtrl,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                hintText: 'Phone number Eg. +233245....',
                prefixIcon: SvgPicture.asset(
                  'assets/images/ic_mobile.svg',
                ),
              ),
              SizedBox(height: AppDimens.dimen15),
              Text(
                'Password',
                style: AppTextStyles.descStyleMedium
                    .copyWith(color: AppColors.black),
              ),
              SizedBox(height: AppDimens.dimen5),
              UiApi.textFormField(
                controller: _controller.passwordTxtCtrl,
                isPasswordField: true,
                prefixIcon: SvgPicture.asset(
                  'assets/images/ic_password.svg',
                ),
                hintText: 'Enter your password',
                obscuringCharacter: '*',
              ),
              InkWell(
                onTap: () {
                  _controller.onForgotPasswordClicked();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: AppDimens.dimen20,
                      bottom: AppDimens.dimen10,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.smallSubDescStyleRegular
                          .copyWith(color: AppColors.primaryGreenColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimens.dimen40),
              Center(
                child: UiApi.button(
                  // border: 8,
                  text: "Log In",
                  onPressed: () {
                    _controller.onLoginOnClick();
                  },
                ),
              ),
              SizedBox(height: AppDimens.dimen10),
              Center(
                child: TextButtonWidget(
                  onTap: _controller.onSignUpClicked,
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Don\'t have an Account? ',
                          style: textTheme.labelSmall,
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style:
                          textTheme.labelMedium?.copyWith(color: colorScheme.primary),
                        ),
                      ])),
                ),
              ),
              // Center(
              //   child: UiApi.textButton(
              //       leadingText: "Don't have an account?",
              //       trailingText: "Sign Up",
              //       trailingStyle: AppTextStyles.descStyleSemiBold
              //           .copyWith(color: AppColors.primaryGreenColor),
              //       onTap: () {
              //         _controller.onSignUpClicked();
              //       }),
              // ),
              SizedBox(height: AppDimens.dimen60),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.onPinBioLogInOnClick();
                      },
                      child: Column(
                        children: [
                          UiApi.assetImage(
                            "assets/images/ic_dial.png",
                            height: AppDimens.dimen18,
                            width: AppDimens.dimen18,
                          ),
                          SizedBox(height: AppDimens.dimen5),
                          Text(
                            "Pin LogIn",
                            style: AppTextStyles.subDescStyleLight,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.3),
                    InkWell(
                      onTap: () {
                        _controller.onGuestLoginOnClicked();
                      },
                      child: Column(
                        children: [
                          UiApi.assetImage(
                            "assets/images/ic_user.png",
                            assetColor: AppColors.introColor2,
                            height: AppDimens.dimen18,
                            width: AppDimens.dimen18,
                          ),
                          SizedBox(height: AppDimens.dimen5),
                          Text(
                            "LogIn as Guest",
                            style: AppTextStyles.subDescStyleLight.copyWith(
                              color: AppColors.introColor2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimens.dimen40),
            ],
          ),
        ],
      ),
    );
  }
}
