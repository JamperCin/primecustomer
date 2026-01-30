import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/add_funds/controllers/add_funds_controller.dart';
import 'package:flutter/material.dart';

class AddFundsScreen extends BaseScreenStandard {
  final _controller = Get.put(AddFundsController());

  @override
  String appBarTitle() {
    return "Add Funds";
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget? appBarLeadingIcon(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Color backgroundColor(BuildContext context) {
    return colorScheme.surfaceBright;
  }

  // @override
  // TextStyle? appBarTitleStyle(BuildContext context) {
  //   return textTheme.bodyMedium;
  // }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.dp(), vertical: 20.dp()),
      child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: AssetImageWidget(
            asset: "assets/images/ic_cards_group.png",
            height: 150.dp(),
            width: 150.dp(),
          )),
          SizedBox(height: 20.dp()),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "This new feature enables users to purchase",
                  style: textTheme.labelSmall,
                ),
                TextSpan(
                  text: " physical gift cards ",
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.primary),
                ),
                TextSpan(
                  text: "from a variety of merchants and load "
                      "them with any desired amount.",
                  style: textTheme.labelSmall,
                ),
                TextSpan(
                  text: "\n\n",
                  style: textTheme.labelSmall,
                ),
                TextSpan(
                  text:
                      "You can load your prime gift card using any of the below options.",
                  style: textTheme.labelSmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 70.dp()),
          ButtonWidget(
            onTap: () {
              _controller.onScanQrCode();
            },
            text: "Scan QR Code",
            asset: "assets/images/scan.png",
          ),
          SizedBox(height: 30.dp()),
          ButtonWidget(
            onTap: () {
              _controller.onEnterCardDigit();
            },
            text: "Enter 16-Digit Of Card",
            asset: "assets/images/input_card.png",
            backgroundColor: colorScheme.inverseSurface,
          ),
          /*UiApi.button(
            child: UiApi.buttonChild(
              asset: "assets/images/input_card.png",
              text: "Enter 16-Digit Of Card",
              assetColor: AppColors.white,
            ),
            backgroundColor: AppColors.black,
            onPressed: () {
              _controller.onEnterCardDigit();
            },
          )*/
        ],
      ),
    );
  }
}
