import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/basic/prime_wallet_controller.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/enum/card_owner.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/data/model/remote/prime_cart_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/cart/efund/e_fund_Intro.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/cart/others/personalise_gift.dart';
import 'package:primecustomer/ui/dashboard/card/all_cards.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  CardController? cardController;

  ///This has the current cart
  ///The nex
  Rx<PrimeCartModel> cartModel = const PrimeCartModel().obs;
  RxList<PrimeCardModel> cartList = RxList<PrimeCardModel>();
  RxBool isDoneLoadingCart = false.obs;

  static Rx<DictionaryModel> cardOwner = cardOwnerList[0].obs;

  static List<DictionaryModel> cardOwnerList = [
    DictionaryModel(key: "Self", value: "SELF", cardOwner: CardOwner.SELF),
    DictionaryModel(
        key: "Others", value: "OTHERS", cardOwner: CardOwner.OTHERS),
   // DictionaryModel(key: "E-fund", value: "EFUND", cardOwner: CardOwner.E_FUND),
  ];

  RxString buttonText = "Proceed To Make Payment".obs;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  ///Init all the request in this model
  ///Request for the cart for  this user
  void initAllRequest() {
    cardController?.getCart(
      cart: cartModel,
      cartList: cartList,
      isDone: isDoneLoadingCart,
    );

    PrimeWalletController(webService).getWalletDetails();
  }

  void onDeleteCartItem(CardUtils cardUtils) {
    UiApi.showConfirmDialog(
      imageAsset: "assets/images/ic_cart_file.png",
      title: "Confirm Item Deletion",
      message: "Are you sure you want to delete this card from your cart?",
      buttonTitle: "Delete Card",
      callBack: () {
        initDeleteCartItemRequest(cardUtils);
      },
    );
  }

  void initDeleteCartItemRequest(CardUtils cardUtils) {
    int cardId = cardUtils.card.itemId;
    int cartId = cartModel.value.cartId;
    cardController?.deleteCartItem(
      cardId,
      cartId,
      cart: cartModel,
      cartList: cartList,
      call: (isEmptyCart) {
        SnackBarApi.snackBarSuccess("Card successfully deleted from cart");
        if (isEmptyCart) resetCart();
      },
    );
  }

  void onConfirmPayment({bool payFromWallet = false}) {
    if (isGuestUser.value || cardOwner.value.cardOwner == CardOwner.OTHERS) {
      NavApi.fireTarget(
        PersonaliseGift(),
        model: CardModel(cart: cartModel.value, dic: cardOwnerList[1]),
      );
      return;
    }

    if (cardOwner.value.cardOwner == CardOwner.E_FUND) {
      NavApi.fireTarget(
        EfundIntroScreen(),
        model: CardModel(cart: cartModel.value, dic: cardOwnerList[1]),
      );
      return;
    }

    UiApi.showConfirmDialog(
      imageAsset: "assets/images/ic_cart_file.png",
      title: "Confirm Payment",
      message: "Do you want to proceed to make payment?",
      titleStyle: AppTextStyles.h5StyleSemiBold,
      messageStyle: AppTextStyles.descStyleLight,
      buttonTitle: "Proceed",
      callBack: () {
        initPaymentForSelfRequest(payFromWallet: payFromWallet);
      },
    );
  }

  void onFavouriteOnClick(PrimeCardModel primeModel) {
    HashMap<String, Object> params = HashMap<String, Object>();
    params.putIfAbsent("card_id", () => primeModel.id);

    webService?.addCardsToFavorite(params, (response) {
      // primeModel.isFavourited.value = !primeModel.isFavourited.value;
      //widgetUtils.showSuccessSnackBar("Card successfully added to your favorite.");
    });
  }

  ///Get a redirect URL form Hubtel to continue with payment
  void initPaymentForSelfRequest({bool payFromWallet = false}) {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("cart_id", () => cartModel.value.cartId);
    params.putIfAbsent("use_prime_wallet", () => payFromWallet);
    params.putIfAbsent("payment_to", () => cardOwner.value.value);

    webService?.makePaymentOfCard(params, (response) {
      if (response.success) {
        if (payFromWallet) {
          ///Request for new balance of prime wallet
          PrimeWalletController(webService).getWalletDetails();
          NavApi.fireSuccess(
            SuccessModel.payment(event: Event(action: EventAction.NAV_HOME)),
          );
        } else {
          cardController?.goToWebPayment(paymentUrl: response.data?.paymentUrl);
        }
      } else {
        cardController?.handleError(
            mess: response.error, cartID: cartModel.value.cartId);
      }
    });
  }

  void resetCart() {
    try {
      cartModel = const PrimeCartModel().obs;
      if (cartList.isNotEmpty) {
        cartList.clear();
      }

      cardOwner = cardOwnerList[0].obs;
    } catch (e) {
      debugPrint('Error $e');
    }
    buttonText.value = "Proceed To Make Payment";
  }

  void clearCart() {
    UiApi.showConfirmDialog(
      imageAsset: "assets/images/ic_leave.svg",
      title: "Clear Cart",
      message: "Do you want to clear all cards from your cart?",
      titleStyle: AppTextStyles.h5StyleSemiBold,
      messageStyle: AppTextStyles.descStyleLight,
      buttonTitle: "Proceed",
      callBack: () {
        cardController?.clearCart(
            cartId: cartModel.value.cartId,
            call: () {
              resetCart();
            });
      },
    );
  }

  onChangeCardOwner(DictionaryModel dic) {
    switch (dic.cardOwner ?? CardOwner.SELF) {
      case CardOwner.SELF:
        buttonText.value = "Proceed To Make Payment";
        break;
      case CardOwner.OTHERS:
        buttonText.value = "Add Person's Info";
        break;
      case CardOwner.E_FUND:
        buttonText.value = "Request For Funds";
        break;
    }
  }

  void onShopGiftCardsOnClick() {
    NavApi.fireTarget(AllCardsScreen(), model: CardModel());
  }
}
