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
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseDetailScreen extends BaseScreenStandard {
  final TransDetailsController controller = Get.put(TransDetailsController());
  Function? reLoad;

  PurchaseDetailScreen({this.reLoad}) {
    controller.resetDetails();

    Utils.startTimer(1, () {
      getModel();
    }, duration: const Duration(milliseconds: 120));
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Payments getModel() {
    Payments pay = baseObject as Payments;
    controller.pay = pay;
    controller.setTransactionType();
    controller.addTransactionCards();
    controller.checkButtonVisibility();
    return pay;
  }

  @override
  String appBarTitle() {
    return "Purchase Details";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView(), padding: EdgeInsets.zero);
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Obx(
      () => controller.cardsList.isNotEmpty ? merchantInfo() : const SizedBox(),
    ));

    list.add(Obx(
      () => controller.cardsList.isNotEmpty
          ? transactionSummary()
          : const SizedBox(),
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    //Can continue Transaction
    list.add(continueButton());

    //Can Cancel Transaction
    list.add(cancelButton());

    list.add(SizedBox(height: AppDimens.dimen70));

    return list;
  }

  ///Continue Transaction Button
  Widget continueButton() {
    return Obx(
      () => controller.continueTransaction.value
          ? Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.dimen30, right: AppDimens.dimen30),
              child: UiApi.button(
                backgroundColor: AppColors.primaryGreenColor,
                text: "Continue Transaction",
                onPressed: () {
                  controller.onContinueTransaction();
                },
              ),
            )
          : const SizedBox(),
    );
  }

  ///Cancel Transaction Button
  Widget cancelButton() {
    return Obx(
      () => controller.cancelTransaction.value
          ? Padding(
              padding: EdgeInsets.all(AppDimens.dimen30),
              child: UiApi.button(
                borderColor: AppColors.redLight,
                backgroundColor: AppColors.white,
                textColor: AppColors.redLight,
                text: "Cancel Transaction",
                onPressed: () {
                  controller.onCancelTransaction(reload: reLoad);
                },
              ),
            )
          : const SizedBox(),
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

  ///Cart Summary
  Widget transactionSummary() {
    List<Widget> cartList = [];

    for (PrimeCardModel card in controller.cardsList) {
      cartList.add(CardApi.cardSummaryItem(card,
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
              "Cart Summary",
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
                  title: "Total Card's Amount",
                  subTitle: NumberUtils.moneyCurrencyFormat(
                    controller.pay.cart.netAmount,
                    dec: 2,
                  ),
                  subTitleStyle: AppTextStyles.descStyleBold,
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                  title: "Prime Fees",
                  subTitle: NumberUtils.moneyCurrencyFormat(
                    controller.pay.cart.fees,
                    dec: 2,
                  ),
                  subTitleStyle: AppTextStyles.descStyleBold,
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                  title: "Total Net Amount",
                  subTitle: NumberUtils.moneyCurrencyFormat(
                    controller.pay.cart.totalAmount,
                    dec: 2,
                  ),
                  subTitleStyle: AppTextStyles.descStyleBold,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
