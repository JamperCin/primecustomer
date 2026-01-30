import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/data/model/remote/rating_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/cart/cart_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/merchant_rating/merchant_rating_list.dart';
import 'package:primecustomer/ui/dashboard/market_place/shop/screens/merchant_store_page.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailsController extends BaseController {
  ///Card controller to make request for cards
  CardController? cardController;
  CardModel cardModel = CardModel();
  ScrollController scrollController = ScrollController();

  ///Ratings list
  RxList<RatingModel> ratingsList = RxList<RatingModel>();

  ///Holders of the array of cards
  RxList<PrimeCardModel> cardsOfMerchantList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> tempCardsList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> selectedCardsList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> otherMerchantsCardsList = RxList<PrimeCardModel>();

  Rx<PrimeCardModel> selectedCard = const PrimeCardModel().obs;

  ///Boolean listener to listen for request being done
  final RxBool isDoneLoadingOtherCards = false.obs;
  final RxBool isDoneLoadingOtherMerchantsCards = false.obs;
  final RxBool showMerchantAbout = false.obs;
  final RxBool showCardAbout = false.obs;

  ///Sub Total of amount to be added to the cart
  RxDouble subTotal = 0.0.obs;
  RxDouble discountTotal = 0.0.obs;
  RxDouble actualTotal = 0.0.obs;

  ///CardBackGround shown at the top of screen
  // RxString cardBackground = "".obs;

  Function? doneCall;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  void clear() {
    isDoneLoadingOtherCards.value = false;
    showCardAbout.value = false;
    showMerchantAbout.value = false;
    cardsOfMerchantList.clear();
    selectedCardsList.clear();
    subTotal.value = 0.0;
    actualTotal.value = 0.0;
    discountTotal.value = 0.0;
    ratingsList.clear();
  }

  void initAllRequest(CardModel card) async {
    await cardController?.getCards(
      tempCardsList,
      isDoneLoadingOtherCards,
      clientId: card.card?.client_id,
      sortByAmount: true,
      call: () {
        cardsOfMerchantList.addAll(tempCardsList);
        //todo preSelectCard();
      },
    );

    ///Get one card each from a merchant
    await cardController?.getCardPerMerchant(
      otherMerchantsCardsList,
      isDoneLoadingOtherMerchantsCards,
    );
  }

  ///You can Preselect the Card that was selected from previous
  ///screen and add it to the cart
  ///By default, it will be the first selected card
  void preSelectCard() {
    for (PrimeCardModel p in tempCardsList) {
      if (p.id == selectedCard.value.id) {
        PrimeCardModel pod = p.copyWith(isAlreadySelected: true);
        cardsOfMerchantList.add(pod);
        continue;
      }
      cardsOfMerchantList.add(p);
    }
  }

  ///Get merchants ratings or reviews by other customers
  void getMerchantRatings(int merchantId) {
    webService?.getMerchantRatings(merchantId, (response) {
      ratingsList.addAll(response.data?.ratings ?? []);
    });
  }

  void _scrollToLast() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  void _animateScrollToLast() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
          scrollController.position.maxScrollExtent +
              (SizeConfig.isTablet
                  ? SizeConfig.screenWidth * .5
                  : (SizeConfig.screenWidth * .75)),
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn);
      debugPrint("Scroll ${scrollController.position.maxScrollExtent}");
    }
  }

  onDeleteSelectedCard(PrimeCardModel card) {
    PrimeCardModel cardFiltered =
        CardUtils(card).filterCard(cardsOfMerchantList, card);
    int index = cardsOfMerchantList.indexOf(cardFiltered);

    debugPrint("Index $index");
    card = card.copyWith(isAlreadySelected: false);

    if (index != -1) {
      cardsOfMerchantList.removeAt(index);
      cardsOfMerchantList.insert(index, card);
    }

    operateOnCard(card);
  }

  void addSelectedCard(PrimeCardModel card) {
    CardUtils cardUtils = CardUtils(card);

    subTotal.value =
        subTotal.value + NumberUtils.parseDouble(cardUtils.getDueAmount());
    actualTotal.value = actualTotal.value + cardUtils.getCardActualAmount();
    selectedCardsList.add(card);

    discountTotal.value = actualTotal.value - subTotal.value;
  }

  void operateOnCard(PrimeCardModel card) {
    CardUtils cardUtils = CardUtils(card);

    if (card.isAlreadySelected) {
      subTotal.value =
          subTotal.value + NumberUtils.parseDouble(cardUtils.getDueAmount());
      actualTotal.value = actualTotal.value + cardUtils.getCardActualAmount();
      selectedCardsList.add(card);
      _animateScrollToLast();
    } else {
      subTotal.value =
          subTotal.value - NumberUtils.parseDouble(cardUtils.getDueAmount());
      actualTotal.value = actualTotal.value - cardUtils.getCardActualAmount();
      selectedCardsList.remove(card);

      subTotal.value = subTotal.value < 0.0 ? 0.00 : subTotal.value;
      actualTotal.value = actualTotal.value < 0.0 ? 0.00 : actualTotal.value;
    }
    discountTotal.value = actualTotal.value - subTotal.value;
  }

  ///@Deprecated
  ///use [operateOnCard]
  onCardSelected(CardUtils cardUtils) {
    PrimeCardModel card = cardUtils.filterCard(tempCardsList, cardUtils.card);
    if (cardUtils.card.isAlreadySelected) {
      subTotal.value =
          subTotal.value + NumberUtils.parseDouble(cardUtils.getDueAmount());
      actualTotal.value = actualTotal.value + cardUtils.getCardActualAmount();
      selectedCardsList.add(card);
      _animateScrollToLast();
    } else {
      subTotal.value =
          subTotal.value - NumberUtils.parseDouble(cardUtils.getDueAmount());
      actualTotal.value = actualTotal.value - cardUtils.getCardActualAmount();
      selectedCardsList.remove(card);

      if (subTotal.value < 0.0) {
        subTotal.value = 0.00;
      }

      if (actualTotal.value < 0.00) {
        actualTotal.value = 0.00;
      }
    }
    discountTotal.value = actualTotal.value - subTotal.value;
  }

  ///Confirm to save selected cards to your CART,
  ///After that  show the cart screen
  void onProceedToCart() {
    if (subTotal.value == 0.0) {
      SnackBarApi.snackBarError("Please select at least one card");
      return;
    }

    UiApi.showConfirmDialog(
      imageAsset: "assets/images/ic_cart_file.png",
      title: "Confirm To Save To Cart",
      message: "Are you sure you want to save selected cards to your cart",
      buttonTitle: "Save To Cart",
      callBack: () {
        initSaveToCartRequest();
      },
    );
  }

  ///Init the request to save selected cards to cart
  void initSaveToCartRequest() {
    HashMap<String, Object> params = HashMap<String, Object>();

    List<Object> cards = [];
    for (PrimeCardModel p in selectedCardsList) {
      HashMap<String, Object> c = HashMap<String, Object>();
      c.putIfAbsent("card_id", () => p.id);
      c.putIfAbsent("quantity", () => "1");
      cards.add(c);
    }
    params.putIfAbsent("items", () => cards);

    webService?.addCardsToCart(params, (response) {
      goToCart();
      // cardController?.getCart();
      /*DialogsApi.popUpSuccessDialog(mContext!,
          time: 8,
          asset: "assets/images/ic_onboarding_three.svg",
          mess:
              "Card(s) successfully added to your cart. You can keep on shopping or go to your cart to check out.",
          call: () {
        goToCart();
      });*/
    });
  }

  void goToCart() {
    NavApi.fireTarget(CartScreen());
  }

  viewAllReviewOnClick(CardModel model) {
    // NavApi.fireEvent(Event(target: MerchantReviewScreen(), model: model));
    NavApi.fireTarget(MerchantRatingList(),
        model: CardModel(
          clientId: model.card?.client.id,
          clientName: Utils.capitalizeLetter(
              val: model.card?.client.name, capAllFirstLetters: true),
        ));
  }

  void onFavoriteOnClick(PrimeCardModel card) {
    UiApi.pop(mContext!, "❤", icon: Icons.favorite, done: () {
      cardController?.favouriteMerchant(card, call: () {});
    });
  }

  void onViewRatings(MerchantDetails mer) {
    NavApi.fireTarget(MerchantRatingList(),
        model: CardModel(
          clientId: mer.id,
          clientName:
              Utils.capitalizeLetter(val: mer.name, capAllFirstLetters: true),
        ));
  }

  void onMapOnClick(MerchantDetails mer) {
    ServiceInjectors().geolocationApi.openMap(
          lat: mer.coordinates?.latitude,
          lng: mer.coordinates?.longitude,
        );
  }

  void onOtherMerchantCardOnClick(PrimeCardModel card) {
    cardsOfMerchantList.clear();
    cardsOfMerchantList.clear();
    tempCardsList.clear();
    selectedCard.value = card;

    cardController?.getCards(
      cardsOfMerchantList,
      isDoneLoadingOtherCards,
      clientId: card.client_id,
      sortByAmount: true,
      call: () {
        tempCardsList.addAll(cardsOfMerchantList);
      },
    );
  }

  void goToMerchantShop(CardModel cardModel) {
    ShopModel shop = ShopModel(
      id: cardModel.card?.client.id ?? 0,
      name: cardModel.card?.client.name ?? '',
      code: cardModel.card?.client.code ?? '',
      description: cardModel.card?.client.description ?? '',
      location: cardModel.card?.client.coordinates,
      logo: cardModel.card?.client.logoUrl ?? '',
      verified: cardModel.card?.client.verified ?? true,
      website: cardModel.card?.client.webSiteUrl ?? '',
    );

    print("PRINT >> ${shop.toJson().toString()}");

    NavApi.fireTarget(MerchantStorePage(), model: shop);
  }
}
