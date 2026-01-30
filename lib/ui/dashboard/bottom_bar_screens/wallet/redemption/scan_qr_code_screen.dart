import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanQrCodeScreen extends BaseScreenStandard {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrController;


  final Function(String)? call;
  bool doneScanning = false;

  ScanQrCodeScreen({this.call});

  @override
  CardAccount getModel() {
    return baseObject as CardAccount;
  }

  @override
  bool showAppBar() {
    // TODO: implement showAppBar
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(flex: 1, child: buildQrView(context)),
      ],
    );
  }

  Widget buildQrView(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: AppColors.primaryGreenColor,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 5,
            cutOutSize: AppDimens.dimen300,
          ),
        ),
        Align(
          child: Padding(
              padding: EdgeInsets.only(bottom: AppDimens.dimen50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textInfo(),
                  FloatingActionButton(
                    backgroundColor: AppColors.white,
                    mini: true,
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.red,
                    ),
                    onPressed: onCloseOnClick,
                  ),
                ],
              )),
          alignment: Alignment.bottomCenter,
        ),
        Align(
          child: Padding(
            padding: EdgeInsets.only(top: 100.dp(), right: 20.dp()),
            child: AssetImageWidget(
              asset: "assets/images/ic_scan.png",
              height: 30.dp(),
              width: 30.dp(),
              onTap: () async{
                await qrController?.flipCamera();
              },
            ),
          ),
          alignment: Alignment.topRight,
        )
      ],
    );
  }


  Widget textInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen16,
        vertical: AppDimens.dimen10,
      ),
      child: Text(
        "Place Qr Code properly in frame to scan.",
        style: AppTextStyles.getStyle(
            AppTextStyles.descStyleLight, AppColors.white),
      ),
    );
  }

  Future<void> onCloseOnClick() async {
    qrController?.dispose();
    NavApi.fireBack();
  }

  void onQRViewCreated(QRViewController qrController) {
    this.qrController = qrController;
    qrController.scannedDataStream.listen((scanData) {
      onQrScanned(scanData);
    });

    qrController.pauseCamera();
    qrController.resumeCamera();
  }

  Future<void> onQrScanned(Barcode scanData) async {
    if (call != null && (scanData.code ?? '').isNotEmpty && !doneScanning) {
      doneScanning = true;
      NavApi.fireBack();

      if (call != null) {
        call!(scanData.code ?? "");
      }
      qrController?.dispose();
      debugPrint("CODE HERE == ${scanData.code}");
    }
  }

/*void _handleBarcode(BarcodeCapture barcodes) {
    _barcode = barcodes.barcodes.firstOrNull;
    debugPrint("CODE HERE == ${barcodes.barcodes.first.rawValue}");
  }

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }
    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }
*/
}
