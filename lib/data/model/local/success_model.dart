import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/ui/auth/signup/security_pin_screen.dart';
import 'package:primecustomer/ui/base/base_screen_impl.dart';
import 'package:flutter/material.dart';

class SuccessModel extends BaseObject {
  final String asset;
  final String title;
  final String message;
  final String buttonText;
  final Color buttonColor;
  final Function(BuildContext)? onButtonOnClick;
  final Function(BuildContext)? onSkipClick;
  final BaseScreenImpl? screen;
  final Event? event;
  final bool clearMemory;
  final TextAlign textAlign;
  final List<RichTextModel>? richText;
  final int maxLines;

  SuccessModel({
    this.asset = "assets/images/ic_cards_group.png",
    this.title = "Success",
    this.message = "",
    this.richText,
    this.maxLines = 3,
    this.buttonText = "Done",
    this.buttonColor = AppColors.introColor2,
    this.onButtonOnClick,
    this.textAlign = TextAlign.center,
    this.onSkipClick,
    this.screen,
    this.event,

    ///means delete all controllers and clear all route names preceding this current screen
    this.clearMemory = true,
  });

  static SuccessModel signUp({Function(BuildContext)? onSkip}) {
    return SuccessModel(
      title: "Welcome to Prime e-gift",
      message:
          "Hurrah! You’re almost there. Just one step to make your account more secured. You will need this to authenticate all your transactions.",
      buttonText: "Continue",
      onSkipClick: onSkip,
      screen: SecurityPinScreen(),
    );
  }

  static SuccessModel cashOut() {
    return SuccessModel(
      title: "Prime Wallet successfully credited",
      message: "Your prime wallet has been credited successfully.",
      buttonText: "Done",
      clearMemory: true,
    );
  }

  static SuccessModel redemption(Function(BuildContext) onDone) {
    return SuccessModel(
        asset: "assets/images/ic_success_redeem.png",
        title: "Card successfully redeemed",
        message: "Your card has been redeemed successfully.",
        buttonText: "Done",
        onButtonOnClick: onDone);
  }

  static SuccessModel reGift() {
    return SuccessModel(
      asset: "assets/images/ic_request_success.png",
      title: "Card successfully re-gifted",
      message: "Your card has been scheduled for re-gifting.",
      buttonText: "Done",
    );
  }

  static SuccessModel redemptionError() {
    return SuccessModel(
      asset: "assets/images/ic_error.jpg",
      title: "Card Failed To be redeemed",
      textAlign: TextAlign.left,
      message:
          "This card cannot be redeemed at the moment. One of the following may be the reason: "
          "\n\n1. Card does not exist or the 16-digit code of the card is invalid. "
          "\n\n2. Card does not belong to this merchant or any of its branches."
          "\n\n3. Card's purchase could not be completed or card does not exist on prime platform anymore."
          "\n\n4. Card has already been redeemed by customer or merchant is not eligible to redeem card."
          "\n\n5. A genuine unknown error occurred during transaction. Kindly try again later or contact prime support team for immediate attention.",
      buttonText: "Close",
      clearMemory: false,
    );
  }

  static SuccessModel pin(Function(BuildContext) onContinue) {
    return SuccessModel(
      title: "Congratulations!!!",
      asset: "assets/images/ic_success_pin.png",
      message:
          "Your PIN has been added to your account. Now you’re ready to explore your new experience with Prime",
      buttonText: "Let's Get Started",
      onButtonOnClick: onContinue,
    );
  }

  static SuccessModel payment({Event? event}) {
    return SuccessModel(
      title: "Card successfully Purchased",
      asset: "assets/images/ic_cards_group.png",
      message: "Your card has successfully been purchased.",
      buttonText: "Done",
      event: event,
    );
  }

  static SuccessModel eFund(String amount) {
    return SuccessModel(
      title: "Request Sent!",
      asset: "assets/images/ic_request_success.png",
      buttonText: "Done",
      richText: [
        RichTextModel(
          text: "Awesome! We’ve sent request to your friend(s) for ",
        ),
        RichTextModel(text: amount, style: AppTextStyles.h5StyleSemiBold),
        RichTextModel(text: " worth funding.")
      ],
    );
  }
}
