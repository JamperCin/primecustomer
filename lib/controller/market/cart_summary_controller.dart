import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/prime_wallet_controller.dart';
import 'package:primecustomer/controller/market/payment/payment_prime_wallet_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/address_model.dart';
import 'package:primecustomer/data/model/remote/payment_options.dart';
import 'package:primecustomer/data/model/remote/product_summary.dart';
import 'package:primecustomer/data/model/remote/shop_cart_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/product_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/screens/more_products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../ui/dashboard/market_place/address/add_address_screen.dart';
import 'address_controller.dart';
import 'payment/payment_gift_card_controller.dart';
import 'payment/payment_momo_controller.dart';

class CartSummaryController extends BaseController {
  ProductsController productsController = ProductsController();
  AddressController addressController = AddressController();
  PaymentWithGiftCardController giftCardPaymentController =
      PaymentWithGiftCardController();
  PaymentWithPrimeWalletController walletController =
      PaymentWithPrimeWalletController();
  PaymentWithMomoController momoController = PaymentWithMomoController();

  ///Address fields

  RxList<ProductSummary> productsList = RxList<ProductSummary>();
  Rx<AddressModel> selectedDeliveryAddress = const AddressModel().obs;

  RxBool isAddressSelected = false.obs;
  TextEditingController addressTextEditCtrl = TextEditingController();

  ///Local Fields
  RxBool isDoneLoadingCart = false.obs;

  Rx<ShopCartModel> shopCart = const ShopCartModel().obs;

  RxList<PaymentOptions> paymentOptionsList = RxList<PaymentOptions>();
  Rx<PaymentOptions> selectedPaymentOption = const PaymentOptions().obs;
  String confirmationCode = "";

  RxList<DictionaryModel> deliveryMethods = [
    DictionaryModel(
      value: "Pick-Up Mode",
      key: "pickUp",
      selected: true.obs,
      asset: AssetsConfig.pickUp,
    ),
    DictionaryModel(
      value: "Delivery Mode",
      key: "doorStep",
      asset: AssetsConfig.delivery,
    ),
  ].obs;

  Rx<DictionaryModel> selectedDeliveryMethod = DictionaryModel(
    value: "Pick-Up",
    key: "pickUp",
    selected: true.obs,
    asset: AssetsConfig.pickUp,
  ).obs;

  PanelController deliveryAddressController = PanelController();

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    productsController.setContext(context);
    addressController.setContext(context);
    giftCardPaymentController.setContext(context);
    walletController.setContext(context);
    momoController.setContext(context);
  }

  Future<void> resetData() async {
    selectedDeliveryMethod.value = DictionaryModel(
      value: "Pick-Up",
      key: "pickUp",
      selected: true.obs,
      asset: AssetsConfig.pickUp,
    );
    productsList.clear();
    isDoneLoadingCart.value = false;
    paymentOptionsList.clear();
    selectedPaymentOption = const PaymentOptions().obs;
    selectedDeliveryAddress.value = const AddressModel();
  }

  ///Initialise all api calls here
  Future<void> onInitData() async {
    await resetData();
    await Future.delayed(const Duration(milliseconds: 180));

    await fetchCart();

    await fetchPaymentOptions();

    PrimeWalletController(webService).getWalletDetails();
  }

  ///Fetch details of your cart of products
  Future<void> fetchCart() async {
    productsList.clear();
    webService?.fetchProductsCart((resp) {
      isDoneLoadingCart.value = true;
      shopCart.value = resp.data?.shopCart ?? const ShopCartModel();
      productsList.addAll(resp.data?.shopCart.items ?? []);
    });
  }

  ///Fetch all payment options available
  Future<void> fetchPaymentOptions() async {
    await webService
        ?.fetchPaymentOptions((response) => paymentOptionsList.addAll(
              response.data?.paymentOptions ?? [],
            ));
  }

  onChangeDeliveryMethod(DictionaryModel method) {
    selectedDeliveryMethod.value = method;
  }

  void onAddDeliveryAddress() {
    addressController.fetchAllDeliveryAddress(
        shopCoordinates: productsList.first.product.shop.location);

    DialogsApi.showBottomSheet(
        title: "Select Address",
        backgroundColor: AppColors.white,
        containerSize: SizeConfig.screenHeight * 0.8,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen16,
          vertical: AppDimens.dimen20,
        ),
        mainChild: Obx(
          () => Column(
            children: [
              Container(
                decoration:
                    UiApi.deco(opacity: 0, borderColor: AppColors.market3),
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.dimen10, vertical: AppDimens.dimen10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Select Address",
                        style: AppTextStyles.titleStyleBold,
                        // trailingTextColor: AppColors.market3,
                      ),
                    ),
                    UiApi.textIconButton(
                      text: "Add",
                      style: AppTextStyles.titleStyleBold
                          .copyWith(color: AppColors.market3),
                      iconColor: AppColors.market3,
                      onTap: _onAddAddressOnClick,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimens.dimen30),
              addressController.deliveryAddressList.isNotEmpty &&
                      addressController.isDoneLoadingAddress.value
                  ? Expanded(
                      child: UiApi.listView(
                        list: [
                          ...addressController.deliveryAddressList
                              .map((e) => UiApi.addressItemWidget(
                                    e,
                                    onTap: _onAddressSelected,
                                  ))
                        ],
                        scrollController: addressController.scrollController,
                        isLoadingMore: addressController.isLoadingMoreAddress,
                        padding:
                            EdgeInsets.symmetric(horizontal: AppDimens.dimen1),
                      ),
                    )
                  : addressController.deliveryAddressList.isEmpty &&
                          addressController.isDoneLoadingAddress.value
                      ? SizedBox()
                      : UiApi.loader(),
            ],
          ),
        ));
  }

  void _onAddAddressOnClick() {
    NavApi.fireTarget(AddAddressScreen(
      call: (address) {
        addressController.fetchAllDeliveryAddress(
            shopCoordinates: productsList.first.product.shop.location);

        // selectedDeliveryAddress.value = address;
        // addressTextEditCtrl.text = address.coordinate.address;
        // print("Address here ===> $address");
      },
    ));
  }

  void _onAddressSelected(AddressModel address) {
    NavApi.fireBack();
    selectedDeliveryAddress.value = address;
    addressTextEditCtrl.text = address.coordinate.address;
  }

  void onPaymentModeSelected(PaymentOptions mode) {
    switch (mode.code) {
      case 'prime_wallet_card_payment':
        walletController.onPaymentModeSelected(mode);
        break;
      case 'mobile_money_or_bank_payment':
        momoController.onPayWithMomo(
          cartId: shopCart.value.cartId,
          paymentOption: mode.code,
          deliveryAddressId: selectedDeliveryAddress.value.id,
        );
        break;
      case 'prime_merchant_card_payment':
        giftCardPaymentController.onPaymentModeSelected(mode);
        break;
      default:
        break;
    }
  }

  ///Prepare To Send OTP to owner of card for verification before card purchase
  Future<void> generateOtpForCardVerification() async {
    // HashMap<String, Object> params = HashMap();
    // params.putIfAbsent("account_code",
    //     () => CardApi.checkTypeOfObject(selectedCard.value).getPurchasedCode());
    //
    // webService?.sendConfirmationOtp(params, (response) {
    //   SnackBarApi.snackBarSuccess(
    //       "An SMS verification has been sent successfully to the owner of card.");
    // });
  }

  ///OnClick Listener to make Payment with your selected purchased gift card.
  void onPayWithGiftCard() {
    giftCardPaymentController.onMakePaymentOnClick(
      shopCart.value.cartId,
      deliveryAddressId: selectedDeliveryAddress.value.id,
    );
  }

  // void onProceedOnAddressSelection() {
  //   if (!isAddressSelected.value) {
  //     return;
  //   }
  //   deliveryAddressController.animatePanelToPosition(0.0);
  //   addressTextEditCtrl.text = selectedDeliveryAddress.value.coordinate.address;
  // }

  void clearProductCart() {
    DialogsApi.alertDialogYesNo(
        title: 'Proceed to clear all items in your cart?',
        mess: 'Are you sure you want to clear all items in your cart?',
        onYesTap: () {
          clearAllProductCart(id: shopCart.value.cartId);
        });
  }

  Future<void> clearAllProductCart({required int id, bool reset = true}) async {
    webService?.clearProductClear(id, (resp) {
      SnackBarApi.snackBarSuccess("Cart successfully cleared.");
      resetCart(reset: reset);
    });
  }

  //Reset cart
  void resetCart({bool reset = true}) {
    shopCart.value = const ShopCartModel();
    isDoneLoadingCart.value = true;
  }

  void onGoToMoreProducts() {
    NavApi.fireTarget(MoreProductsScreen());
  }

  void updateQuantityOfProduct(BaseObject obj) {
    ProductSummary prod = obj as ProductSummary;
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("shop_cart_id", () => shopCart.value.cartId);
    param.putIfAbsent("cartId", () => "${prod.id}");
    param.putIfAbsent("quantity", () => "${prod.quantity}");

    webService?.updateProductsCart(param, (resp) {
      shopCart.value = resp.data?.shopCart ?? const ShopCartModel();
      productsList.clear();
      productsList.addAll(resp.data?.shopCart.items ?? []);
      SnackBarApi.snackBarSuccess(
          "${prod.product.name}'s quantity has been updated successfully.");
    });
  }

  void confirmProductDeletion(BaseObject object) {
    ProductSummary prod = object as ProductSummary;
    DialogsApi.alertDialogYesNo(
        title: 'Delete Selected Product from Cart?',
        mess:
            'Are you sure you want to delete ${prod.product.name} from your cart?',
        onYesTap: () {
          onDeleteProductFromCart(prod);
        });
  }

  void onDeleteProductFromCart(ProductSummary prod) {
    HashMap<String, Object> param = HashMap();

    param.putIfAbsent("shop_cart_id", () => shopCart.value.cartId);
    param.putIfAbsent("cartId", () => "${prod.id}");

    webService?.removeProductCartItem(param, (resp) {
      shopCart.value = resp.data?.shopCart ?? const ShopCartModel();
      productsList.clear();
      productsList.addAll(resp.data?.shopCart.items ?? []);
      SnackBarApi.snackBarSuccess(
          "${prod.product.name} removed successfully from cart");
    });
  }

  void onViewProductDetails(ProductSummary prod) {
    DialogsApi.showBottomSheet(
      showCloseButton: false,
      backgroundColor: AppColors.white,
      topPadding: 0,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen10,
        vertical: AppDimens.dimen10,
      ),
      child: ProductApi.additionalProductDetailsWidget(prod, 0.obs),
      containerSize: SizeConfig.screenHeight * .9,
    );
  }
}
