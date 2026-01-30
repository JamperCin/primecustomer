import 'package:primecustomer/controller/view/exhausted_card_controller.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExhaustedCardScreen extends BaseScreenStandard {
  final ExhaustedCardController controller = Get.put(ExhaustedCardController());

  ExhaustedCardScreen() {
    Utils.startTimer(1, () {
      controller.getRedemptionLogs();
    });
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
    getModel();
  }

  @override
  String appBarTitle() {
    return "Card Details";
  }

  @override
  Color appBarBackgroundColor() {
    return backgroundColor();
  }

  @override
  Color backgroundColor() {
    return AppColors.background;
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
        list: listView(),
        padding: EdgeInsets.only(
          left: AppDimens.dimen14,
          right: AppDimens.dimen14,
          top: AppDimens.dimen16,
          bottom: AppDimens.dimen24,
        ));
  }

  @override
  BaseObject getModel() {
    if (baseObject is CardModel) {
      CardModel obj = baseObject as CardModel;
      baseObject = obj.object ?? BaseObject();
      controller.type = obj.type;
    }

    if (baseObject is CardAccount) {
      CardAccount account = baseObject as CardAccount;
      controller.cardUtils = CardUtils(account.card).setObject(baseObject);
      return account;
    }

    if (baseObject is GiftedCard) {
      GiftedCard gift = baseObject as GiftedCard;
      controller.cardUtils = CardUtils(gift.account.card).setObject(baseObject);
      controller.giftedCard = gift;
      return gift;
    }

    return baseObject;
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(giftPersonDetailsWidget());

    ///The Merchant's Details below
    list.add(
      Container(
        decoration: UiApi.deco(borderRadius: 5),
        padding: EdgeInsets.all(AppDimens.dimen10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            merchantName(),
            SizedBox(height: AppDimens.dimen5),
            merchantDescription(),
            merchantLocation(),
            SizedBox(height: AppDimens.dimen5),
            merchantContact(),
            SizedBox(height: AppDimens.dimen5),
          ],
        ),
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen10));

    ///The Card Details
    list.add(
      Container(
        decoration: UiApi.deco(
          applyBorder: false,
          borderSide: Border(
            right: BorderSide(
              color: controller.cardUtils?.accountStatusColor() ??
                  AppColors.redLight,
              width: 3,
            ),
          ),
        ),
        padding: EdgeInsets.all(AppDimens.dimen10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardTitle(),
            SizedBox(height: AppDimens.dimen5),
            cardDescription(),
            SizedBox(height: AppDimens.dimen5),
            cardImage(),
            SizedBox(height: AppDimens.dimen10),
            cardNumber(),
            SizedBox(height: AppDimens.dimen5),
            cardStatus(),
            SizedBox(height: AppDimens.dimen5),
          ],
        ),
      ),
    );

    list.add(Column(
      children: [
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

  Widget giftPersonDetailsWidget() {
    return controller.type == WalletType.GIFTED_IN
        ? Column(
            children: [
              UiApi.circleImageView(
                url: controller.cardUtils?.getRecipientPicture() ?? "",
                radius: AppDimens.dimen55,
                asset: "assets/images/ic_profile_circle.svg",
              ),
              SizedBox(height: AppDimens.dimen20),
              Text(
                controller.cardUtils?.giftPersonName(type: controller.type) ??
                    "",
                style: AppTextStyles.titleStyleBold,
              ),
              SizedBox(height: AppDimens.dimen5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      controller.cardUtils
                              ?.giftPersonPhone(type: controller.type) ??
                          "",
                      style: AppTextStyles.descStyleRegular.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(width: AppDimens.dimen10),
                  Flexible(
                    flex: 0,
                    child: Container(
                      width: 2,
                      height: AppDimens.dimen20,
                      color: AppColors.dimWhite,
                    ),
                  ),
                  SizedBox(width: AppDimens.dimen10),
                  Flexible(flex: 1, child: cardStatusWidget()),
                ],
              ),
              SizedBox(height: AppDimens.dimen40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: AppDimens.dimen20),
                  Flexible(
                    child: UiApi.button(
                      child: UiApi.buttonChild(
                        icon: Icon(Icons.call,
                            color: AppColors.white, size: AppDimens.dimen25),
                        text: "Call",
                        textColor: AppColors.white,
                      ),
                      backgroundColor: AppColors.primaryGreenColor,
                      onPressed: () {
                        controller.callContact(controller.cardUtils
                                ?.giftPersonPhone(type: controller.type) ??
                            "");
                      },
                    ),
                    flex: 1,
                  ),
                  SizedBox(width: AppDimens.dimen20),
                  Flexible(
                    child: UiApi.button(
                      child: UiApi.buttonChild(
                        icon: Icon(Icons.emoji_emotions,
                            color: AppColors.primaryGreenColor,
                            size: AppDimens.dimen25),
                        text: "Comment",
                        textColor: AppColors.primaryGreenColor,
                      ),
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.primaryGreenColor,
                      onPressed: () {
                        controller.onCommentClicked();
                      },
                    ),
                    flex: 1,
                  ),
                  SizedBox(width: AppDimens.dimen20),
                ],
              ),
              SizedBox(height: AppDimens.dimen50),
            ],
          )
        : SizedBox();
  }

  Widget cardStatusWidget() {
    return Text(
      controller.cardUtils?.getAccountStatus() ?? "",
      style: AppTextStyles.smallSubDescStyleBold
          .copyWith(color: controller.cardUtils?.accountStatusColor()),
    );
  }

  ///The merchant Name
  Widget merchantName() {
    return UiApi.richText(
      maxLines: 1,
      mod: [
        RichTextModel(
          text: Utils.capitalizeLetter(
              val: controller.cardUtils?.getMerchantName(),
              capAllFirstLetters: true),
          style: AppTextStyles.titleStyleBold,
        )
      ],
    );
  }

  ///The Merchant's description
  Widget merchantDescription() {
    return (controller.cardUtils?.getClient().description ?? "").isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiApi.richText(maxLines: 8, mod: [
                RichTextModel(
                  text: controller.cardUtils?.getClient().description ?? "",
                  style: AppTextStyles.subDescRegular,
                )
              ]),
              SizedBox(height: AppDimens.dimen5),
            ],
          )
        : const SizedBox();
  }

  ///The Merchant's location
  Widget merchantLocation() {
    return Row(
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
    );
  }

  ///The merchant telephone  number
  Widget merchantContact() {
    return Row(
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
    );
  }

  ///The card Title
  Widget cardTitle() {
    return UiApi.richText(
      mod: [
        RichTextModel(
          text: Utils.capitalizeLetter(
              val: controller.cardUtils?.getCardTitle(),
              capAllFirstLetters: true),
          style: AppTextStyles.titleStyleBold,
        ),
      ],
    );
  }

  ///The Card's description
  Widget cardDescription() {
    return (controller.cardUtils?.getCardDescription() ?? "").isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiApi.richText(maxLines: 4, mod: [
                RichTextModel(
                  text: controller.cardUtils?.getCardDescription() ?? "",
                  style: AppTextStyles.subDescRegular,
                )
              ]),
              SizedBox(height: AppDimens.dimen5),
            ],
          )
        : const SizedBox();
  }

  ///The 16-digit code of a card
  Widget cardNumber() {
    return UiApi.buttonExt(
      asset: "assets/icons/mycard_green.png",
      title: "Card Number",
      assetSize: AppDimens.dimen16,
      padding: EdgeInsets.zero,
      elevation: 0,
      borderColor: AppColors.white,
      subTitle: controller.cardUtils?.getDisplayPurchasedCode() ?? "",
      subTitleStyle: AppTextStyles.smallSubDescStyleBold
          .copyWith(color: AppColors.deactivatedText),
    );
  }

  Widget cardImage() {
    return Row(
      children: [
        Expanded(
          flex: 0,
          child: Container(
            decoration: UiApi.deco(),
            width: SizeConfig.screenWidth * 0.45,
            height: SizeConfig.screenWidth * 0.25,
            child: UiApi.imageLoader(
              url: controller.cardUtils?.card.image,
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenWidth * 0.25,
            ),
          ),
        ),
        SizedBox(width: AppDimens.dimen10),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiApi.richText(
                maxLines: 1,
                mod: [
                  RichTextModel(
                    text: controller.cardUtils
                            ?.getCurrencyCardActualAmount(dec: 2) ??
                        "0.0",
                    style: AppTextStyles.titleStyleBold,
                  ),
                ],
              ),
              SizedBox(height: AppDimens.dimen5),
              Text(
                controller.cardUtils?.accountDate(format: "dd MMM yyy") ?? "",
                style: AppTextStyles.descStyleSemiBold
                    .copyWith(color: AppColors.lightDark),
              ),
              Text(
                controller.cardUtils?.accountDate(format: "hh:mm aa") ?? "",
                style: AppTextStyles.subDescStyleLight
                    .copyWith(color: AppColors.lightDark),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget cardStatus() {
    return UiApi.buttonExt(
      asset: "assets/images/ic_status.png",
      title: "Card Status",
      assetSize: AppDimens.dimen16,
      padding: EdgeInsets.zero,
      elevation: 0,
      borderColor: AppColors.white,
      subTitle: controller.cardUtils?.getAccountStatus() ?? "",
      subTitleStyle: AppTextStyles.smallSubDescStyleBold
          .copyWith(color: controller.cardUtils?.accountStatusColor()),
    );
  }
}
