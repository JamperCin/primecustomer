import 'package:primecustomer/controller/market/cart_summary_controller.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/product_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class CartSummaryScreen extends BaseScreenStandard {
  final controller = Get.put(CartSummaryController());

  CartSummaryScreen() {
    controller.onInitData();
  }

  @override
  String appBarTitle() {
    return "Products Cart Summary";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
        list: listView(),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen10,
          vertical: AppDimens.dimen10,
        ));
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen10));

    list.add(Obx(
      () => controller.productsList.isNotEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${controller.productsList.length} Product(s)",
                  style: AppTextStyles.title,
                ),
                UiApi.containerRoundCorners(
                    backgroundColor: AppColors.primaryGreenColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimens.dimen20,
                      vertical: AppDimens.dimen5,
                    ),
                    child: Column(
                      children: [
                        Text(
                          NumberUtils.moneyCurrencyFormat(
                            controller.shopCart.value.totalAmount,
                            dec: 2,
                          ),
                          style: AppTextStyles.title
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          "Total Amount",
                          style: AppTextStyles.smallerSubDescStyleMedium
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    )),
              ],
            )
          : const SizedBox.shrink(),
    ));

    // list.add(SizedBox(height: AppDimens.dimen20));

    list.add(Obx(
      () => controller.productsList.isNotEmpty &&
              controller.isDoneLoadingCart.value
          ? Column(
              children: [
                UiApi.billWidget(
                  "Prime Fees",
                  "${controller.shopCart.value.fees}",
                  asset: AssetsConfig.primeEGift,
                ),
                SizedBox(height: AppDimens.dimen20),
                ...controller.productsList
                    .map((prod) => ProductApi.productCartItemWidget(
                          prod,
                          onTap: controller.onViewProductDetails,
                          onProdUpdate: controller.updateQuantityOfProduct,
                          onDeleteProduct: controller.confirmProductDeletion,
                        )),
              ],
            )
          : controller.productsList.isEmpty &&
                  controller.isDoneLoadingCart.value
              ? const SizedBox.shrink()
              : UiApi.loader(),
    ));

    list.add(SizedBox(height: AppDimens.dimen20));

    ///Delivery Options
    list.add(Obx(
      () => controller.productsList.isNotEmpty &&
              controller.isDoneLoadingCart.value
          ? Column(
              children: [
                UiApi.titleView(
                  title: "Select your preferred option",
                  backgroundColor: AppColors.white,
                  padding: EdgeInsets.only(left: AppDimens.dimen10),
                ),
                UiApi.topMenuWidget(
                  menu: controller.deliveryMethods,
                  mod: controller.selectedDeliveryMethod,
                  isRectangular: true,
                  onTap: controller.onChangeDeliveryMethod,
                ),
              ],
            )
          : const SizedBox.shrink(),
    ));

    list.add(Obx(
      () => controller.selectedDeliveryMethod.value.key == 'doorStep'
          ? _deliveryInfoWidget()
          : const SizedBox.shrink(),
    ));

    return list;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Obx(
      () => controller.shopCart.value.items.isNotEmpty
          ? Container(
              decoration: UiApi.deco(borderRadius: 0),
              padding: EdgeInsets.only(
                bottom: AppDimens.dimen16,
                top: AppDimens.dimen8,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: AppDimens.dimen14,
                  left: AppDimens.dimen14,
                ),
                child: UiApi.buttonFilled(
                  fillPercent: 0.56,
                  //  onTap: controller.onCheckOutOnClick,
                  valueText: 'CHECK OUT',
                  leftColor: AppColors.black,
                  rightColor: AppColors.black,
                  buttonText: 'GHS ${controller.shopCart.value.totalAmount}',
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  /*Widget deliveryMethodWidget() {
    return Column(
      children: [
        SizedBox(height: AppDimens.dimen40),
        UiApi.titleView(
          title: "Choose Delivery Method",
          backgroundColor: AppColors.white,
          padding: EdgeInsetsDirectional.zero,
        ),
        SizedBox(height: AppDimens.dimen5),
        UiApi.radioWidget(
          dict: controller.deliveryMethods,
          defaultValue: controller.selectedDeliveryMethod,
          caps: false,
          dirIsVertical: false,
          onTap: controller.onChangeDeliveryMethod,
        ),
      ],
    );
  }*/

  Widget billingInfoWidget() {
    return controller.isDoneLoadingCart.value
        ? Column(
            children: [
              SizedBox(height: AppDimens.dimen10),
              UiApi.titleView(
                title: "Billing Information",
                backgroundColor: AppColors.white,
                padding: EdgeInsetsDirectional.zero,
              ),
              Container(
                decoration: UiApi.deco(borderRadius: 10, opacity: 0.2),
                margin: EdgeInsets.only(top: AppDimens.dimen10),
                padding: EdgeInsets.only(top: AppDimens.dimen5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UiApi.billWidget(
                      "Total Items",
                      "${controller.shopCart.value.netAmount}",
                      icon: Icons.shopping_cart,
                    ),
                    UiApi.billWidget(
                      "Prime Fees",
                      "${controller.shopCart.value.fees}",
                      asset: AssetsConfig.primeEGift,
                    ),
                    UiApi.billWidget(
                      "Total Amount",
                      "${controller.shopCart.value.totalAmount}",
                      showBorder: false,
                      bolder: true,
                    ),
                  ],
                ),
              ),
            ],
          )
        : UiApi.loader(size: 1);
  }

  Widget _deliveryInfoWidget() {
    return InkWell(
      onTap: controller.onAddDeliveryAddress,
      child: Padding(
        padding: EdgeInsets.only(left: AppDimens.dimen10),
        child: Column(
          children: [
            SizedBox(height: AppDimens.dimen10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Select Address",
                    style: AppTextStyles.titleStyleBold
                        .copyWith(color: AppColors.market3),
                    // trailingTextColor: AppColors.market3,
                  ),
                ),
                UiApi.textIconButton(
                  text: "Add",
                  style: AppTextStyles.titleStyleBold
                      .copyWith(color: AppColors.market3),
                  iconColor: AppColors.market3,
                ),
              ],
            ),
            UiApi.addressItemWidget(controller.selectedDeliveryAddress.value,
                onTap: (add) {
              controller.onAddDeliveryAddress();
            }),
          ],
        ),
      ),
    );
  }

  Widget paymentMethodWidget() {
    return controller.paymentOptionsList.isNotEmpty
        ? Column(
            children: [
              SizedBox(height: AppDimens.dimen40),
              UiApi.titleView(
                title: "Payment Information",
                backgroundColor: AppColors.white,
                padding: EdgeInsetsDirectional.zero,
              ),
              UiApi.paymentRadioButtonWidget(
                list: controller.paymentOptionsList,
                defaultValue: controller.selectedPaymentOption,
                onTap: controller.onPaymentModeSelected,
              ),
            ],
          )
        : UiApi.loader(size: 1);
  }

  ///Show your Prime Wallet account for payment
  Widget primeWalletPaySlider() {
    bool isEnabled = prefUtils.isWalletBalanceEnough(
        amount: controller.shopCart.value.totalAmount);
    return UiApi.bottomSlider(
      panelController: controller.walletController.primePayController,
      minHeight: 0.0,
      child: UiApi.listView(list: [
        UiApi.primeWalletExt(),
        SizedBox(height: AppDimens.dimen40),
        UiApi.button(
          text: 'Pay With Prime Wallet',
          onPressed: () {
            controller.walletController.onPayWithPrimeWallet(
              controller.shopCart.value.cartId,
              deliveryAddressId: controller.selectedDeliveryAddress.value.id,
            );
          },
          backgroundColor: isEnabled ? AppColors.visa : AppColors.lineExt,
        ),
        SizedBox(height: AppDimens.dimen10),
        if (!isEnabled)
          UiApi.infoText("Insufficient funds to make purchase of items."),
        if (!isEnabled)
          UiApi.infoText(
              "\n\nYou will need to top up your prime wallet account before you can proceed with this payment."),
      ]),
    );
  }

  ///Show Gift cards from your Purchased and Gifted In ones
  Widget giftCardSlider() {
    return UiApi.bottomSlider(
      panelController: controller.giftCardPaymentController.giftCardController,
      minHeight: 0.0,
      title: 'Select Gift Card',
      //  actionButton: TextButton(onPressed: () {}, child: Icon(Icons.menu)),
      child: Obx(
        () => controller.giftCardPaymentController.isDoneLoadingCards.value &&
                controller.giftCardPaymentController.cardAccountList.isNotEmpty
            ? UiApi.listView(
                list: [
                  ...controller.giftCardPaymentController.cardAccountList.map(
                      (card) => CardApi.cardWidget(
                          card,
                          controller
                              .giftCardPaymentController.selectedCard.value,
                          onTap: controller
                              .giftCardPaymentController.onGiftCardSelected)),
                  SizedBox(height: AppDimens.dimen40),
                ],
                padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen10),
              )
            : controller.giftCardPaymentController.isDoneLoadingCards.value &&
                    controller.giftCardPaymentController.cardAccountList.isEmpty
                ? UiApi.noDataWidget(
                    title: "Empty List",
                    message: "You have no gift cards in your wallet",
                  )
                : UiApi.circularProgressIndicator(),
      ),
      bottomWidget: Obx(
        () => UiApi.button(
          text: 'Pay With Gift Card',
          onPressed: controller.onPayWithGiftCard,
          backgroundColor:
              controller.giftCardPaymentController.isGiftCardSelected.value
                  ? AppColors.market3
                  : AppColors.lineExt,
        ),
      ),
    );
  }

  Widget clearCartWidget() {
    return Column(
      children: [
        SizedBox(height: AppDimens.dimen50),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              controller.clearProductCart();
            },
            child: Text(
              "Clear Cart",
              style: AppTextStyles.h5StyleMedium.copyWith(color: AppColors.red),
            ),
          ),
        ),
        SizedBox(height: AppDimens.dimen50),
      ],
    );
  }
}
