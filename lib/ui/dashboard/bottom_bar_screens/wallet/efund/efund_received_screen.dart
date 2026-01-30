import 'package:badges/badges.dart' as badge;
import 'package:primecustomer/controller/view/efund_cards_controller.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/eFund_card_model.dart';
import 'package:primecustomer/data/model/remote/e_fund_request_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_sliver_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EfundReceivedScreen extends BaseSliverStandard {
  final EFundCardsController controller = Get.put(EFundCardsController());

  EfundReceivedScreen() {
    controller.clear();
    Utils.startTimer(1, () {
      controller.eFund.value = getModel();
    }, duration: const Duration(milliseconds: 180));
  }

  @override
  bool decorateBody() {
    return false;
  }

  @override
  Widget? flexImageWidget() {
    return UiApi.imageLoader(
      url:
          "https://primeegiftfiles.s3.us-east-2.amazonaws.com/mobile/ic_fund_me.jpg",
      setOverlay: true,
      border: 0,
    );
  }

  @override
  double? floatWidgetPaddingRight() {
    return SizeConfig.screenWidth * 0.05;
  }

  @override
  double? floatWidgetPaddingLeft() {
    return floatWidgetPaddingRight();
  }

  @override
  Widget floatingWidget({BuildContext? context}) {
    return Container(
      decoration: UiApi.deco(),
      padding: EdgeInsets.all(AppDimens.dimen10),
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          UiApi.iconOnClick(
              title: "Comment",
              onTap: () {
                controller.onCommentOnClick();
              }),
          UiApi.iconOnClick(
              title: "Emoji",
              icon: Icons.emoji_emotions,
              color: AppColors.yellowColor,
              onTap: () {
                controller.onEmojiOnClick();
              }),
          UiApi.iconOnClick(
              title: "Call",
              icon: Icons.call,
              color: AppColors.primaryGreenColor,
              onTap: () {
                controller.onCallOnClick();
              }),
          UiApi.iconOnClick(
              title: "Reject",
              icon: Icons.cancel_rounded,
              color: AppColors.red,
              onTap: () {
                controller.onRejectFunding();
              }),
        ],
      ),
    );
  }

  @override
  EfundRequestModel getModel() {
    return baseObject as EfundRequestModel;
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView(), padding: EdgeInsets.zero);
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(Padding(
      padding: EdgeInsets.only(
        top: AppDimens.dimen16,
        left: AppDimens.dimen16,
        right: AppDimens.dimen16,
        bottom: AppDimens.dimen10,
      ),
      child: Text("Select cards to fund", style: AppTextStyles.title),
    ));

    list.add(Obx(() => cardsForFunding()));
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(primeWalletWidget());

    return list;
  }

  Widget cardsForFunding() {
    List<Widget> list = [];

    for (EfundCardModel card in controller.eFund.value.items) {
      list.add(UiApi.eFundCardItem(card, onChecked: controller.onCardSelected));
    }
    return Column(children: list);
  }

  Widget primeWalletWidget() {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen16),
      child: Column(children: [
        SizedBox(height: AppDimens.dimen30),
        UiApi.infoText(
          "Make payment using your Prime Wallet or proceed to use other payment channels.",
        ),
        SizedBox(height: AppDimens.dimen10),
        UiApi.primeWallet(
            amount: controller.subTotal.value,
            onTap: () {
              controller.confirmPayment(payFromWallet: true);
            }),
        SizedBox(height: AppDimens.dimen20),
        Text("OR", style: AppTextStyles.h5StyleSemiBold),
      ]),
    );
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: UiApi.deco(),
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.only(
            left: AppDimens.dimen10,
            top: AppDimens.dimen20,
            right: AppDimens.dimen10,
            bottom: AppDimens.dimen30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Obx(
                  () => Row(
                    children: [
                      badge.Badge(
                        badgeStyle: badge.BadgeStyle(badgeColor: AppColors.red),
                        child: UiApi.assetImage(
                          "assets/images/ic_basket.svg",
                          assetColor: AppColors.primaryGreenColor,
                          height: AppDimens.dimen25,
                          width: AppDimens.dimen25,
                        ),
                        badgeContent: Text(
                            "${controller.selectedCardsList.length}",
                            style: AppTextStyles.smallSubDescStyleSemiBold
                                .copyWith(color: AppColors.white)),
                      ),
                      SizedBox(width: AppDimens.dimen13),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiApi.richText(
                            mod: [
                              RichTextModel(
                                text: "GHS",
                                style: AppTextStyles.subDescStyleBold,
                              ),
                              RichTextModel(
                                text: " ",
                                style: AppTextStyles.subDescRegular,
                              ),
                              RichTextModel(
                                  text: NumberUtils.moneyFormatDouble(
                                      controller.subTotal.value,
                                      decPlace: 2),
                                  style: AppTextStyles.h4StyleBold),
                            ],
                          ),
                          Text(
                            "Sub Total",
                            style: AppTextStyles.descStyleRegular,
                            // textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              UiApi.decoratedButton(
                  width: SizeConfig.screenWidth * 0.4,
                  // height: SizeConfig.screenWidth * 0.11,
                  text: "Make Payment",
                  style: AppTextStyles.subDescStyleBold
                      .copyWith(color: AppColors.white),
                  icon: const SizedBox(),
                  padding: EdgeInsets.only(
                    // left: AppDimens.dimen5,
                    right: AppDimens.dimen5,
                  ),
                  backgroundColor: AppColors.introColor2,
                  onTap: () {
                    controller.confirmPayment();
                  })
            ],
          ),
        ),
      ],
    );
  }
}
