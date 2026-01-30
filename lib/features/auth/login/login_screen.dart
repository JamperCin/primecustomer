//import 'package:core_module/core_module.dart';
import 'package:core_module/core_module.dart' show Gap;
import 'package:core_module/core_ui/base_screen/base_screen_dec.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:primecustomer/core/config/colors/app_colors.dart';
import 'package:primecustomer/core/config/theme/app_typography.dart';
import 'package:primecustomer/core/constants/assets_constants.dart';
import 'package:primecustomer/core/def/global_access.dart';
import 'package:primecustomer/core/utils/Utils.dart';
import 'package:primecustomer/features/auth/login/controller/login_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends BaseScreenDecorated {
  final _controller = Get.put(LoginController());

  @override
  String decoPageAsset() {
    return AssetsConstants.icClusterCards;
  }

  LoginScreen() {
    prefUtils.setLogin(false);
    Utils.startTimer(2, () {
      // _controller.checkForAppUpdate();
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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.dp),
          Text('Log In', style: textTheme.bodyLarge),
          Gap(20.dp),
          Text(
            'Log in to Prime App with your phone number and password',
            style: textTheme.labelSmall,
          ),
          SizedBox(height: 40.dp),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text('Phone Number', style: AppTypography.bodyMedium),
          //     SizedBox(height: 5.dp),
          //     TextFieldWidget.withPhoneNumber(
          //       controller: _controller.phoneTxtCtrl,
          //       hintText: 'Phone number Eg. +233245....',
          //     ),
          //     // UiApi.textFormField(
          //     //   keyboardType: TextInputType.phone,
          //     //   controller: _controller.phoneTxtCtrl,
          //     //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          //     //   hintText: 'Phone number Eg. +233245....',
          //     //   prefixIcon: SvgPicture.asset('assets/images/ic_mobile.svg'),
          //     // ),
          //     SizedBox(height: 15.dp),
          //     Text('Password', style: AppTypography.bodyMedium),
          //     SizedBox(height: 5.dp),
          //     TextFieldWidget.withPassword(
          //       controller: _controller.passwordTxtCtrl,
          //       hintText: 'Enter your password',
          //     ),
          //     // UiApi.textFormField(
          //     //   controller: _controller.passwordTxtCtrl,
          //     //   isPasswordField: true,
          //     //   prefixIcon: SvgPicture.asset('assets/images/ic_password.svg'),
          //     //   hintText: 'Enter your password',
          //     //   obscuringCharacter: '*',
          //     // ),
          //     InkWell(
          //       onTap: () {
          //         _controller.onForgotPasswordClicked();
          //       },
          //       child: Align(
          //         alignment: Alignment.centerRight,
          //         child: Padding(
          //           padding: EdgeInsets.only(top: 20.dp, bottom: 10.dp),
          //           child: Text(
          //             'Forgot Password?',
          //             style: AppTypography.labelSmall.copyWith(
          //               color: Theme.of(context).colorScheme.primary,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),

          //     SizedBox(height: 40.dp),
          //     Center(
          //       child: ButtonWidget(
          //         text: "Log In",
          //         onTap: () {
          //           _controller.onLoginOnClick();
          //         },
          //       ),
          //     ),
          //     SizedBox(height: 10.dp),
          //     Center(
          //       child: TextButtonWidget(
          //         onTap: _controller.onSignUpClicked,
          //         child: RichText(
          //           text: TextSpan(
          //             children: [
          //               TextSpan(
          //                 text: 'Don\'t have an Account? ',
          //                 style: textTheme.labelSmall,
          //               ),
          //               TextSpan(
          //                 text: 'Sign Up',
          //                 style: textTheme.labelMedium?.copyWith(
          //                   color: colorScheme.primary,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),

          //     SizedBox(height: 60.dp),
          //     Center(
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           InkWell(
          //             onTap: () {
          //               _controller.onPinBioLogInOnClick();
          //             },
          //             child: Column(
          //               children: [
          //                 AssetImageWidget(
          //                   asset: AssetsConstants.icDial,
          //                   height: 18.dp,
          //                   width: 18.dp,
          //                 ),
          //                 SizedBox(height: 5),
          //                 Text(
          //                   "Pin LogIn",
          //                   style: AppTypography.bodyMedium,
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ],
          //             ),
          //           ),
          //           SizedBox(width: 30.w),
          //           InkWell(
          //             onTap: () {
          //               _controller.onGuestLoginOnClicked();
          //             },
          //             child: Column(
          //               children: [
          //                 AssetImageWidget(
          //                   asset: AssetsConstants.icUser,
          //                   assetColor: AppColors.primary,
          //                   height: 18,
          //                   width: 18,
          //                 ),
          //                 SizedBox(height: 5),
          //                 Text(
          //                   "LogIn as Guest",
          //                   style: AppTypography.bodyMedium.copyWith(
          //                     color: AppColors.secondary,
          //                   ),
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(height: 40),
          //   ],
          // ),
        ],
      ),
    );
  }
}
