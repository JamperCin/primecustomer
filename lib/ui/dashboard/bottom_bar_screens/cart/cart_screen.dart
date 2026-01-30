import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/view/cart_controller.dart';
import 'package:primecustomer/data/enum/card_owner.dart';
import 'package:primecustomer/data/enum/display_type.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends BaseScreenStandard {
  final CartController controller = Get.put(CartController());

  CartScreen() {
    controller.resetCart();
    controller.cardController?.resetCart();

    Utils.startTimer(1, () {
      controller.initAllRequest();
    }, duration: const Duration(milliseconds: 120));
  }

  @override
  String appBarTitle() {
    return "Cart";
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
  double appBarElevation() {
    return 0;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  List<Widget> actions() {
    return [
      Padding(
        padding: EdgeInsets.only(right: AppDimens.dimen25),
        child: InkWell(
          onTap: () {
            controller.onShopGiftCardsOnClick();
          },
          child: UiApi.assetImage(
            "assets/images/ic_shopping.png",
            width: AppDimens.dimen30,
            height: AppDimens.dimen25,
          ),
        ),
      ),
    ];
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => controller.isDoneLoadingCart.value && controller.cartList.isEmpty
          ? Center(
              child: UiApi.noDataWidget(
                padding: EdgeInsets.all(AppDimens.dimen24),
                button: Column(
                  children: [
                    SizedBox(
                      height: AppDimens.dimen50,
                    ),
                    UiApi.button(
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.primaryGreenColor,
                      text: "Shop Gift Cards",
                      child: UiApi.buttonChild(
                        text: "Shop Gift Cards",
                        textColor: AppColors.primaryGreenColor,
                        asset: "assets/images/ic_onboarding_three.svg",
                      ),
                      onPressed: () {
                        controller.onShopGiftCardsOnClick();
                      },
                    ),
                  ],
                ),
              ),
            )
          : UiApi.listView(
              list: listView(),
              padding: EdgeInsets.only(
                top: AppDimens.dimen16,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
            ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(UiApi.securityQuestionsWarning());

    list.add(CardApi.renderCard(
      list: controller.cartList,
      showSubText: false,
      titleWidget: const SizedBox(),
      cardType: DisplayType.LINEAR_HORIZONTAL,
      showDeleteIcon: true,
      loader: UiApi.loader(),
      aspectRatio: 1.8,
      childAspectRatio: .65,
      showAmount: true,
      showMerchantName: true,
      onDelete: controller.onDeleteCartItem,
    ));

    list.add(
      Padding(
        padding:
            EdgeInsets.only(right: AppDimens.dimen24, left: AppDimens.dimen24),
        child: controller.isDoneLoadingCart.value &&
                controller.cartList.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Billing Information",
                    style: AppTextStyles.titleStyleSemiBold,
                  ),
                  Container(
                    decoration: UiApi.deco(borderRadius: 10),
                    margin: EdgeInsets.only(top: AppDimens.dimen10),
                    padding: EdgeInsets.only(top: AppDimens.dimen5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UiApi.billWidget("Card's Amount",
                            "${CardController.cartNetAmount.value}"),
                        UiApi.billWidget(
                            "Prime Fees", "${CardController.cartFees.value}"),
                        UiApi.billWidget("Total Amount",
                            "${CardController.cartTotalAmount.value}",
                            showBorder: false),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen30),
                  isGuestUser.value
                      ? const SizedBox()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Who are you buying these cards for?",
                              style: AppTextStyles.titleStyleSemiBold,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: AppDimens.dimen10),
                            UiApi.radioWidget(
                              dict: CartController.cardOwnerList,
                              defaultValue: CartController.cardOwner,
                              onTap: controller.onChangeCardOwner,
                            ),
                           // Row(children: [...CartController.cardOwnerList.map((e)=> Flexible(child: CheckboxWidget(onChange: (v){}, text: e.key,)))],),
                            primeWalletWidget(),
                          ],
                        ),
                  SizedBox(height: AppDimens.dimen50),
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppDimens.dimen20,
                      right: AppDimens.dimen20,
                    ),
                    child: Center(
                      child: UiApi.button(
                        text: controller.buttonText.value,
                        onPressed: () {
                          controller.onConfirmPayment();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen50),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        controller.clearCart();
                      },
                      child: Text(
                        "Clear Cart",
                        style: AppTextStyles.h5StyleMedium
                            .copyWith(color: AppColors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen50),
                ],
              )
            : const SizedBox(),
      ),
    );

    return list;
  }

  Widget primeWalletWidget() {
    return Obx(
      () => CartController.cardOwner.value.cardOwner == CardOwner.SELF
          ? Column(children: [
              SizedBox(height: AppDimens.dimen30),
              UiApi.infoText(
                "Make payment using your Prime Wallet or proceed to use other payment channels.",
              ),
              SizedBox(height: AppDimens.dimen10),
              UiApi.primeWallet(
                  amount: CardController.cartTotalAmount.value,
                  onTap: () {
                    controller.onConfirmPayment(payFromWallet: true);
                  }),
              SizedBox(height: AppDimens.dimen20),
              Text("OR", style: AppTextStyles.h5StyleSemiBold),
            ])
          : const SizedBox(),
    );
  }
}
