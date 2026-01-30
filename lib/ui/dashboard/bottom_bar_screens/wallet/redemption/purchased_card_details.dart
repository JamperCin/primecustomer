import 'package:primecustomer/controller/view/redeem_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_sliver_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchasedCardDetails extends BaseSliverStandard {
  final RedeemController controller = Get.put(RedeemController());
  CardUtils? cardUtils;

  PurchasedCardDetails() {
    controller.maskedCode.value = "";
    controller.clickCodeText = "Click to view code".obs;
    Utils.startTimer(1, () {
      controller.maskedCode.value = cardUtils?.getMaskedPurchasedCode() ?? "";
      controller.getRedemptionLogs();
    }, duration: const Duration(milliseconds: 120));
  }

  @override
  String heroTag() {
    return "purchased_favorite";
  }

  @override
  double expandedHeight() {
    return AppDimens.dimen160;
  }

  @override
  BaseObject getModel() {
    if (baseObject is CardAccount) {
      CardAccount account = baseObject as CardAccount;
      controller.cardAccount = account;
      cardUtils = CardUtils(account.card).setObject(baseObject);
      controller.cardUtils = cardUtils;
      return account;
    }

    if (baseObject is GiftedCard) {
      GiftedCard gift = baseObject as GiftedCard;
      controller.giftedCard = gift;
      cardUtils = CardUtils(gift.account.card).setObject(baseObject);
      controller.cardUtils = cardUtils;
      return gift;
    }

    return baseObject;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
    getModel();
  }

  @override
  String appBarTitle() {
    return cardUtils?.getMerchantName() ?? "";
  }

  @override
  Widget? flexImageWidget() {
    return UiApi.imageLoader(
      url: cardUtils?.getCardBackGround(),
      heroTag: "_accounts",
      setOverlay: true,
      border: 0,
    );
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
                  cardUtils?.getLocation(
                          defaultVal: "Location not yet specified") ??
                      "",
                  style: AppTextStyles.descStyleRegular,
                ),
              ),
              SizedBox(width: AppDimens.dimen10),
            ],
          ),
        ),
        (cardUtils?.isCoordinated())!
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
              controller.callContact(cardUtils?.getClientContact());
            },
            child: Text(
              cardUtils?.getClientContact() ?? "Not specified",
              style: AppTextStyles.descStyleRegular.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryGreenColor),
            ),
          ),
        ),
        SizedBox(width: AppDimens.dimen10),
      ],
    ));
    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(
        Text("Reveal Card 16-digit Code", style: AppTextStyles.titleStyleBold));
    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(Obx(
      () => UiApi.buttonExt(
        asset: "assets/icons/mycard_green.png",
        title: "Card Number",
        assetSize: AppDimens.dimen20,
        padding: EdgeInsets.only(
          left: AppDimens.dimen5,
          right: AppDimens.dimen5,
          top: AppDimens.dimen8,
          bottom: AppDimens.dimen8,
        ),
        bottomChild: Text(
          controller.clickCodeText.value,
          style: AppTextStyles.smallSubDescStyleRegular.copyWith(
            color: AppColors.primaryGreenColor,
          ),
        ),
        subTitle: controller.maskedCode.value,
        subTitleStyle: AppTextStyles.descStyleBold,
        onTap: () {
          controller.displayPurchaseCode();
        },
        onLongTap: () {
          controller.onCopyPurchaseCode();
        },
      ),
    ));
    list.add(SizedBox(height: AppDimens.dimen5));
    /*list.add(Center(
      child: Obx(
        () => Text(
          controller.clickCodeText.value,
          style: AppTextStyles.smallSubDescStyleRegular.copyWith(
            color: AppColors.primaryGreenColor,
          ),
        ),
      ),
    ));*/
    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(Text(
      cardUtils?.getFormattedCardAccountBalance(dec: 2) ?? "",
      textAlign: TextAlign.center,
      style: AppTextStyles.h3StyleBold,
    ));
    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(Text(
      "Card Balance",
      textAlign: TextAlign.center,
      style: AppTextStyles.subDescStyleLight,
    ));
    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(Text(
      "Enter amount to redeem (GHS)",
      style: AppTextStyles.subDescRegular,
    ));
    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(UiApi.textFormField(
      hintText: "Amount",
      keyboardType: TextInputType.number,
      controller: controller.amountTxt,
      style: AppTextStyles.titleStyleRegular,
      /* suffixIcon: UiApi.assetImage(
        "assets/images/ic_send.png",
        height: AppDimens.dimen10,
        width: AppDimens.dimen10,
      ),*/
    ));
    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(UiApi.button(
      text: "Redeem Card",
      onPressed: () {
        controller.onRedeemCardOnClick();
      },
    ));
    /* todo hide till Market place
   list.add(SizedBox(height: AppDimens.dimen20));
    list.add(UiApi.button(
      child: UiApi.buttonChild(
        asset: "assets/images/ic_market.svg",
        text: "Shop With Card",
        assetColor: AppColors.kYellowDeepColor,
        textColor: AppColors.kYellowDeepColor,
      ),
      backgroundColor: AppColors.market.withOpacity(0.2),
      onPressed: () {
        controller.onShopWithCardOnClick();
      },
    ));*/

    list.add(SizedBox(height: AppDimens.dimen20));
    list.add(Text(
      "-- OR --",
      textAlign: TextAlign.center,
      style: AppTextStyles.subDescRegular,
    ));

    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /* UiApi.textButton(
              leadingText: "Book Appointment",
              leadingStyle: AppTextStyles.descStyleMedium
                  .copyWith(color: AppColors.black),
              onTap: () {
                controller.onBookAppointmentOnClick(getModel());
              }),*/
          (cardUtils?.isGiftedCard() ?? false)
              ? const SizedBox()
              : UiApi.textButton(
                  leadingText: "Re-Gift Card",
                  leadingStyle: AppTextStyles.descStyleMedium
                      .copyWith(color: AppColors.black),
                  onTap: () {
                    controller.onReGiftOnClick(getModel());
                  }),
          SizedBox(width: AppDimens.dimen10),
          UiApi.textButton(
              leadingText: "Push To Prime Wallet",
              leadingStyle: AppTextStyles.descStyleMedium
                  .copyWith(color: AppColors.black),
              onTap: () {
                controller.onCashOutCardOnClick(getModel());
              }),
        ],
      ),
    );
    /*list.add(
      (cardUtils?.isGiftedCard() ?? false)
          ? const SizedBox()
          : UiApi.textButton(
              leadingText: "Re-Gift Card",
              leadingStyle: AppTextStyles.descStyleMedium
                  .copyWith(color: AppColors.black),
              onTap: () {
                controller.onReGiftOnClick(getModel());
              }),
    );*/
    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(Column(
      children: [
        const Divider(
          color: AppColors.dimWhiteExt,
          height: 2,
        ),
        SizedBox(height: AppDimens.dimen20),
        UiApi.decText(
          padding: EdgeInsets.zero,
          icon: Icons.history,
          text: "Redemption History",
          style: AppTextStyles.descStyleSemiBold,
        ),
        SizedBox(height: AppDimens.dimen10),
      ],
    ));

    list.add(UiApi.redemptionLogWidget(
      controller.isDoneLoading,
      controller.redemptionLogs,
      padding: EdgeInsets.zero,
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    return list;
  }
}
