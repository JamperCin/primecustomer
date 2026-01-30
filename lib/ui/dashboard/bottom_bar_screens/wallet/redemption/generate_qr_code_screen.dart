import 'dart:io';
import 'dart:ui' as ui;

import 'package:primecustomer/controller/view/redeem_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCodeScreen extends BaseScreenStandard {
  final RedeemController controller = Get.put(RedeemController());
  final GlobalKey globalKey = GlobalKey();

  GenerateQrCodeScreen() {
    controller.startedGeneratingQrCode.value = false;
  }

  @override
  ui.Color backgroundColor() {
    return AppColors.background;
  }

  @override
  String appBarTitle() {
    return "Redeem Card";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView(), context: context);
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen60));

    list.add(
      Center(
          child: Container(
        decoration: UiApi.deco(),
        child: RepaintBoundary(
            child: qrImage(controller.qrCodeAmount()), key: globalKey),
      )),
    );

    list.add(SizedBox(height: AppDimens.dimen60));

    list.add(UiApi.infoText(
      "Let your merchant scan this QR-Code to redeem the specified amount",
    ));

    list.add(SizedBox(height: AppDimens.dimen100));

    list.add(
      UiApi.button(
        animate: controller.startedGeneratingQrCode,
        child: UiApi.buttonChild(
          asset: "assets/images/ic_send.png",
          text: "Share my code",
          assetColor: AppColors.white,
          textColor: AppColors.white,
        ),
        animateColor: AppColors.white,
        backgroundColor: AppColors.primaryGreenColor,
        onPressed: () {
          if (controller.startedGeneratingQrCode.value) {
            controller.delayButtonClick();
            return;
          }
          controller.startedGeneratingQrCode.value = true;
          captureAndSharePng().then((value) {
            controller.startedGeneratingQrCode.value = false;
          });
        },
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen50));

    return list;
  }

  static Widget qrImage(String url) {
    return QrImageView(
      data: url,
      version: QrVersions.auto,
      size: AppDimens.dimen300,
      gapless: false,
      embeddedImage: const AssetImage('assets/images/prime_logo_new.png'),
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: Size(AppDimens.dimen30, AppDimens.dimen30),
      ),
    );
    // return QrImage(
    //   data: url,
    //   version: QrVersions.auto,
    //   embeddedImage: const AssetImage('assets/images/prime_logo_new.png'),
    //   embeddedImageStyle: QrEmbeddedImageStyle(
    //     size: Size(AppDimens.dimen30, AppDimens.dimen30),
    //   ),
    //   size: AppDimens.dimen250,
    // );
  }

  ///Invoke native methods
  ///[@link https://stackoverflow.com/questions/44181343/how-do-i-share-an-image-on-ios-and-android-using-flutter/50007287#50007287]
  ///See how its implemented
  Future<void> captureAndSharePng() async {
    try {
      final RenderRepaintBoundary boundary = globalKey.currentContext!
          .findRenderObject()! as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage();
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();
      Directory tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      if (Platform.isIOS) {
        const channel = MethodChannel('channel:me.prime.share/share');
        channel.invokeMethod('shareFile', 'image.png').then((value) {
          debugPrint("Done here ISO $value");
        });
      } else {
        share(file).then((value) {
          debugPrint("Done here $value");
        });
      }

      debugPrint("save to directory ${file.path} == $image");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> share(File file) async {
    //TODO await FlutterShare.shareFile(
    //   title: 'Prime E-Gift',
    //   text: 'Share your qrCode to friends and loved ones.',
    //   chooserTitle: "Share image",
    //   filePath: file.path,
    // );
  }

  // void saveImage() {
  //   final channel = const MethodChannel('channel:me.prime.share/share');
  //   channel.invokeMethod('showPrint', 'hello bros prints me');
  // }
}
