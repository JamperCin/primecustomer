import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/add_funds/controllers/AddFundsEntryController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryToAddCardNumber extends BaseScreenStandard {
  final _controller = Get.put(AddFundsEntryController());

  @override
  String appBarTitle() {
    return 'Enter Card Number';
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return textTheme.bodyMedium;
  }

  @override
  Color backgroundColor(BuildContext context) {
    return colorScheme.surfaceBright;
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    _controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 24.dp(),
        vertical: 20.dp(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AssetImageWidget(
              asset: "assets/images/ic_card_cluster.png",
              width: 150.dp(),
              height: 150.dp(),
            ),
          ),
          SizedBox(height: 20.dp()),
          Text(
            "Enter your details below to fund your prime e-gift card.",
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 60.dp()),
          TextFieldWidget(
            maxLength: 16,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            hintText: "0000 0000 0000 0000",
            labelText: "Enter card number",
            controller: _controller.cardNumberCtrl,
            prefixIcon: Icon(
              Icons.add_chart,
              color: colorScheme.primary,
            ),
            textAlign: TextAlign.center,
            onChanged: (code) {
              if (code.length == 16) {
                dismissKeyBoard(context);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget bottomNavigationBar(BuildContext context) {
    return Container(
      child: ButtonWidget(
        text: 'Continue',
        onTap: _controller.onContinueAddFunds,
      ),

      padding: EdgeInsets.only(
        right: AppDimens.dimen16,
        left: AppDimens.dimen16,
        top: AppDimens.dimen16,
        bottom: 60.dp(),
      ),
    );
  }
}
