import 'package:primecustomer/controller/view/redeem_controller.dart';
import 'package:primecustomer/data/enum/redemption_type.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_sliver_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/app/app_colors.dart';

class RedemptionOptionsScreen extends BaseSliverStandard {
  final RedeemController controller = Get.put(RedeemController());

  RedemptionOptionsScreen() {
    controller.formatAmount();
  }
  @override
  String heroTag() {
    return "red_favorite";
  }

  @override
  double expandedHeight() {
    return AppDimens.dimen160;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  String appBarTitle() {
    return controller.cardUtils?.getMerchantName() ?? "";
  }

  @override
  Widget? flexImageWidget() {
    return UiApi.imageLoader(
      url: controller.cardUtils?.getCardBackGround(),
      heroTag: "_accounts",
      setOverlay: true,
      border: 0,
    );
  }

  @override
  Widget floatingWidget({BuildContext? context}) {
    return const SizedBox();
  }

  @override
  GestureTapCallback? floatWidgetOnclick() {
    return () {
      debugPrint("fav onclick");
    };
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      padding: EdgeInsets.only(
        top: AppDimens.dimen5,
        left: AppDimens.dimen24,
        right: AppDimens.dimen24,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    ///The Merchant's Name
    list.add(Text(
      Utils.capitalizeLetter(val: appBarTitle(), capAllFirstLetters: true),
      style: AppTextStyles.h4StyleBold,
    ));
    list.add(SizedBox(height: AppDimens.dimen5));

    ///Merchant Location
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                size: AppDimens.dimen16,
                color: AppColors.deactivatedText,
              ),
              SizedBox(width: AppDimens.dimen10),
              Flexible(
                child: Text(
                  controller.cardUtils?.getLocation(
                          defaultVal: "Location not yet specified") ??
                      "",
                  style: AppTextStyles.descStyleRegular,
                ),
              ),
              SizedBox(width: AppDimens.dimen10),
            ],
          ),
        ),
        (controller.cardUtils?.isCoordinated())!
            ? InkWell(
                onTap: () {
                  controller.onMapOnClick(getModel());
                },
                child: Image.asset("assets/images/ic_map.png",
                    height: AppDimens.dimen25),
              )
            : const SizedBox(),
      ],
    ));
    list.add(SizedBox(height: AppDimens.dimen5));

    ///Merchant's Contact
    list.add(Row(
      children: [
        Icon(
          Icons.phone_forwarded_rounded,
          size: AppDimens.dimen16,
          color: AppColors.deactivatedText,
        ),
        SizedBox(width: AppDimens.dimen10),
        Flexible(
          child: InkWell(
            onTap: () {
              controller.callContact(controller.cardUtils?.getClientContact());
            },
            child: Text(
              controller.cardUtils?.getClientContact() ?? "Not specified",
              style: AppTextStyles.descStyleRegular.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryGreenColor),
            ),
          ),
        ),
        SizedBox(width: AppDimens.dimen10),
      ],
    ));
    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(UiApi.cardWidget(
        color: AppColors.kGreyWhite,
        borderColor: AppColors.textGrey,
        elevation: 0,
        margin: EdgeInsets.only(
            left: SizeConfig.screenWidth * 0.1,
            right: SizeConfig.screenWidth * 0.1),
        child: Padding(
          padding: EdgeInsets.all(AppDimens.dimen16),
          child: Column(
            children: [
              Text("Amount to redeem", style: AppTextStyles.descStyleRegular),
              SizedBox(height: AppDimens.dimen20),
              Obx(() => Text(
                    controller.amountDisplayTxt.value,
                    style: AppTextStyles.h3StyleBold,
                  )),
            ],
          ),
        )));

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(UiApi.button(
      child: UiApi.buttonChild(
        asset: "assets/images/ic_scan.png",
        text: "Scan QR Code",
        assetColor: AppColors.white,
      ),
      onPressed: () {
        controller.onAuthRedeem();
      },
    ));

    list.add(SizedBox(height: AppDimens.dimen30));

    list.add(UiApi.button(
      child: UiApi.buttonChild(
        asset: "assets/images/ic_scan.png",
        text: "Generate QR Code",
        assetColor: AppColors.white,
      ),
      backgroundColor: AppColors.black,
      onPressed: () {
        controller.onAuthRedeem(action: RedemptionType.generateQrCode);
      },
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    return list;
  }
}
