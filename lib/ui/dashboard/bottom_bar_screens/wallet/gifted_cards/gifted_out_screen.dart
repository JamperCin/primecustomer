import 'package:primecustomer/controller/view/gifted_out_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/ui/dashboard/notification/notification_screen.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftedOutScreen extends BaseScreenStandard {
  final GiftedOutController controller = Get.put(GiftedOutController());

  GiftedOutScreen() {
    Utils.startTimer(1, () {
      controller.getRedemptionLogs();
    });
  }

  @override
  String appBarTitle() {
    return "Gifted Out";
  }

  @override
  List<Widget> actions() {
    return [
      Padding(
        padding:
            EdgeInsets.only(right: AppDimens.dimen20, top: AppDimens.dimen20),
        child: UiApi.appBarNotification(controller.notificationCounter,
            iconColor: AppColors.dimWhiteExt, onTap: () {
          NavApi.fireTarget(NotificationScreen());
        }),
      ),
    ];
  }

  @override
  BaseObject getModel() {
    if (baseObject is CardModel) {
      CardModel cardModel = baseObject as CardModel;
      if (cardModel.object is GiftedCard) {
        controller.giftedCard = cardModel.object as GiftedCard;
        controller.card = controller.giftedCard?.account.card;
        controller.cardUtils =
            CardUtils(controller.card ?? const PrimeCardModel())
                .setObject(controller.giftedCard!);
      }
    }

    return baseObject;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
    getModel();
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(child: Column(children: listView()));
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Column(
      children: [
        UiApi.circleImageView(
          url: controller.cardUtils?.getRecipientPicture() ?? "",
          radius: AppDimens.dimen55,
          asset: "assets/images/ic_profile_circle.svg",
        ),
        SizedBox(height: AppDimens.dimen20),
        Text(
          controller.cardUtils?.giftPersonName(type: controller.type) ?? "",
          style: AppTextStyles.titleStyleBold,
        ),
        SizedBox(height: AppDimens.dimen5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                controller.cardUtils?.giftPersonPhone(type: controller.type) ??
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
        UiApi.decText(
          text: Utils.capitalizeLetter(
              val: controller.cardUtils?.getCardTitle(),
              capAllFirstLetters: true),
          style: AppTextStyles.titleStyleBold,
        ),
        SizedBox(height: AppDimens.dimen10),
        CardApi.elevatedCard(
          card: controller.card ?? PrimeCardModel(),
          width: SizeConfig.screenWidth * 0.8,
          height: SizeConfig.screenWidth * 0.47,
          showNewTag: true,
          showAmount: true,
          showMerchantName: true,
        ),
        SizedBox(height: AppDimens.dimen20),
        UiApi.decText(
          icon: Icons.date_range,
          maxLines: 1,
          text: DateTimeUtils.formatDateString(controller.giftedCard?.createdAt,
              format: "dd MMM yyyy, hh:mm aa"),
          style: AppTextStyles.descStyleRegular,
        ),
        SizedBox(height: AppDimens.dimen10),
        UiApi.decText(
          text: controller.cardUtils?.getClient().description ?? "",
          style: AppTextStyles.descStyleRegular,
        ),
        SizedBox(height: AppDimens.dimen20),
        UiApi.decText(
          text: controller.cardUtils?.getCardDescription() ?? "",
          style: AppTextStyles.subDescRegular,
          maxLines: 5,
        ),
        SizedBox(height: AppDimens.dimen20),
        UiApi.decText(
          icon: Icons.location_on,
          style: AppTextStyles.subDescRegular,
          maxLines: 2,
          child: merchantLocation(),
        ),
        SizedBox(height: AppDimens.dimen50),
        // UiApi.decText(
        //   icon: Icons.history,
        //   text: "Redemption History",
        //   style: AppTextStyles.descStyleSemiBold,
        // ),
        // SizedBox(height: AppDimens.dimen20),
      ],
    ));

    // list.add(UiApi.redemptionLogWidget(
    //     controller.isDoneLoading, controller.redemptionLogs));

    // list.add(SizedBox(height: AppDimens.dimen70));

    return list;
  }

  ///The Merchant's location
  Widget merchantLocation() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              controller.cardUtils
                      ?.getLocation(defaultVal: "Location not yet specified") ??
                  "",
              style: AppTextStyles.descStyleRegular,
            ),
          ),
          SizedBox(width: AppDimens.dimen10),
          (controller.cardUtils?.isCoordinated() ?? false)
              ? InkWell(
                  onTap: () {
                    // controller.onMapOnClick(getModel());
                  },
                  child: Image.asset("assets/images/ic_map.png",
                      height: AppDimens.dimen25),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  ///Card status
  Widget cardStatusWidget() {
    return Text(
      controller.cardUtils?.getAccountStatus() ?? "",
      style: AppTextStyles.smallSubDescStyleBold
          .copyWith(color: controller.cardUtils?.accountStatusColor()),
    );
  }
}
