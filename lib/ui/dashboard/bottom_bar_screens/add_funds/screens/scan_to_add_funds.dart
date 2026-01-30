import 'package:primecustomer/ui/dashboard/bottom_bar_screens/add_funds/controllers/ScanToAddFundsController.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/redemption/scan_qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanToAddFunds extends ScanQrCodeScreen {
  final controller = Get.put(ScanToAddFundsController());

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

 @override
  Future<void> onCloseOnClick() async {
   controller.onCloseOnClick();
  }

  @override
  Future<void> onQrScanned(Barcode scanData) async {
    if ((scanData.code ?? '').isNotEmpty && !doneScanning) {
      doneScanning = true;

      controller.onQrScanned(scanData.code ?? '');
      qrController?.dispose();
    }
  }

  /*@override
  Widget textInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen16,
        vertical: AppDimens.dimen10,
      ),
      child: Column(
        children: [
          Text(
            "Place Qr Code properly in frame to scan.",
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleLight, AppColors.white),
          ),
          SizedBox(height: AppDimens.dimen10),
          DividerWidget.withChild(
            child: Text(
              'OR',
              style:
                  AppTextStyles.descStyleLight.copyWith(color: AppColors.white),
            ),
          ),
          SizedBox(height: AppDimens.dimen14),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Enter 16-digit code on card",
              style: AppTextStyles.getStyle(
                  AppTextStyles.smallSubDescStyleLight, AppColors.white),
            ),
          ),
          SizedBox(height: AppDimens.dimen5),
          UiApi.textFormField(
            maxLength: 16,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            focusColor: AppColors.white,
            unFocusColor: AppColors.white,
            textAlign: TextAlign.center,
            hintText: "0000 0000 0000 0000",
            hintStyle: AppTextStyles.titleStyleRegular.copyWith(color: AppColors.white),
            controller: controller.cardNumberTextController,
            style: AppTextStyles.titleStyleRegular.copyWith(color: AppColors.white),
            suffixIcon: const Icon(Icons.add_chart, color: AppColors.white,),
            onChanged: (code) {
              if (code.length == 16) {
                dismissKeyBoard(mContext!);
              }
              controller.onQrScanned( controller.cardNumberTextController.text.trim());
            },
          ),
        ],
      ),
    );
  }*/
}
