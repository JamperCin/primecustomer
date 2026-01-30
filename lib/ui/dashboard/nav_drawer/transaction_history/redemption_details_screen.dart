import 'package:primecustomer/controller/view/trans_detaills_controller.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/payments.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedemptionDetailsScreen extends BaseScreenStandard {
  final TransDetailsController controller = Get.put(TransDetailsController());

  RedemptionDetailsScreen() {
    controller.resetDetails();
    Utils.startTimer(1, () {
      getModel();
    }, duration: const Duration(milliseconds: 120));
  }

  @override
  Payments getModel() {
    Payments pay = baseObject as Payments;
    controller.pay = pay;
    controller.setTransactionType();
    controller.addTransactionCards();
    controller.getRedemptionLogs();
    return pay;
  }

  @override
  String appBarTitle() {
    return "Redemption Details";
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(child: Column(children: listView()));
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Obx(
      () => controller.cardsList.isNotEmpty
          ? transactionSummary()
          : const SizedBox(),
    ));

    list.add(Obx(
      () => controller.cardsList.isNotEmpty ? merchantInfo() : const SizedBox(),
    ));

    list.add(SizedBox(height: AppDimens.dimen20));
    list.add(const Divider(color: AppColors.dimWhiteExt, height: 2));
    list.add(
      Padding(
        padding: EdgeInsets.only(
          left: AppDimens.dimen16,
          right: AppDimens.dimen16,
          top: AppDimens.dimen16,
        ),
        child: UiApi.decText(
          padding: EdgeInsets.zero,
          icon: Icons.history,
          text: "Other redemptions with this card",
          style: AppTextStyles.descStyleSemiBold,
        ),
      ),
    );

    list.add(Padding(
      padding: EdgeInsets.all(AppDimens.dimen16),
      child: UiApi.redemptionLogWidget(
        controller.isDoneLoading,
        controller.redemptionLogs,
        padding: EdgeInsets.zero,
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    return list;
  }

  ///Redemption Summary
  Widget transactionSummary() {
    List<Widget> cartList = [];

    for (PrimeCardModel card in controller.cardsList) {
      cartList.add(CardApi.redemptionSummaryItem(card,
          opacity: 0, borderColor: AppColors.white));
      if (card != controller.cardsList.last) {
        cartList.add(UiApi.divider(
            height: 1, width: SizeConfig.screenWidth, color: AppColors.line));
      }
    }

    return Container(
      decoration: UiApi.deco(),
      margin: EdgeInsets.only(
        left: AppDimens.dimen16,
        right: AppDimens.dimen16,
        top: AppDimens.dimen16,
      ),
      padding: EdgeInsets.only(top: AppDimens.dimen5, bottom: AppDimens.dimen5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppDimens.dimen8),
            child: Text(
              "Redemption Summary",
              style: AppTextStyles.titleStyleBold,
            ),
          ),
          const Divider(color: AppColors.deactivatedText),
          Column(
            children: cartList,
          ),
          const Divider(color: AppColors.deactivatedText),
          Padding(
            padding: EdgeInsets.all(AppDimens.dimen10),
            child: Column(
              children: [
                UiApi.rowText(
                  title: "Amount Redeemed",
                  subTitle: NumberUtils.moneyCurrencyFormat(
                    controller.pay.amount,
                    dec: 2,
                  ),
                  subTitleStyle: AppTextStyles.descStyleBold
                      .copyWith(color: AppColors.redLight),
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                  title: "Redeemed At",
                  subTitle: Utils.capitalizeLetter(
                    val: controller.pay.merchant,
                    capOnlyFirstLetter: true,
                  ),
                  subTitleStyle: AppTextStyles.descStyleRegular,
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                  title: "Status",
                  subTitle: controller.pay.status.toUpperCase(),
                  subTitleStyle: AppTextStyles.subDescStyleBold,
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                  title: "DateTime",
                  subTitle: DateTimeUtils.formatDateString(
                      controller.pay.createdAt,
                      format: "dd MMM yyyy hh:mm aa"),
                  subTitleStyle: AppTextStyles.subDescStyleBold,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///Merchant Information for one merchant
  Widget merchantInfo() {
    List<Widget> merchList = [];

    for (MerchantDetails mer in controller.merchantsList) {
      merchList.add(UiApi.merchantInfo(
        mer,
        rateOnTap: () {
          controller.onViewRatings(mer);
        },
        callOnTap: () {
          controller.callContact(mer.telephone);
        },
        mapOnTap: () {
          controller.onMapOnClick(mer);
        },
        width: controller.merchantsList.length == 1
            ? SizeConfig.screenWidth * 0.92
            : null,
      ));
    }

    return SizedBox(
      height: SizeConfig.screenWidth * .7,
      child: ListView(
        children: merchList,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
