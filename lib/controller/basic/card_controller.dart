import 'dart:collection';

import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/http/web_service.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/web_model.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/prime_cart_model.dart';
import 'package:primecustomer/data/model/remote/redemption_logs.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/delegate/CardDelegate.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/base/base_web.dart';
import 'package:primecustomer/ui/dashboard/card/merchants_cards/merchant_and_cards.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/transaction_history/main_screen_trans.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/remote/prime_card_model.dart';

class CardController {
  WebService webService;
  int limit = 20;

  ///Holder of the Details of the cart
  static RxInt cartTotalItems = 0.obs; //Total cards in a cart
  static RxDouble cartNetAmount = 0.0.obs; //Without the prime convinience fee
  static RxDouble cartFees = 0.0.obs; //Prime convenience fee
  static RxDouble cartTotalAmount = 0.0.obs; //Total = net + fee

  CardController(this.webService);

  ///A listener to a selected card from any screen where there is a list of cards
  ///or even if it's an individual card
  void onCardSelected(PrimeCardModel card, String hero, {String? filter}) {
    NavApi.fireTarget(MerchantAndCards(),
        model: CardModel(
          card: card,
          heroTag: CardUtils(card).getHeroTag(alias: hero),
          filter: filter,
        ));
  }

  ///Get Redemption logs details of a single purchased card whether
  ///- Purchased card,
  ///- Gifted In card
  ///- Gifted Out card
  void getDetailsOfPurchasedCard({
    required RxList<RedemptionLogs> logs,
    required RxBool isDone,
    int? accountId,
    String? purchasedCode,
  }) {
    isDone.value = false;
    String id = "${accountId ?? purchasedCode}";

    webService.getDetailsOfCardAccount(id, (response) {
      isDone.value = true;
      logs.clear();
      logs.addAll(response.data?.accountLogs.redemptionLogs ?? []);
    });
  }

  ///Get a list of all published cards from all merchants.
  ///You can filter by a key
  Future<void> getCards(
    RxList<PrimeCardModel> list,
    RxBool isDone, {
    String key = "",
    String value = "true",
    String? searchFilter,
    bool loadAllCards = false,
    bool sortByAmount = false,
    RxBool? isLoadingMore,
    int? clientId,
    int page = 1,
    int limit = 50,
    List<int>? categoryId,
    List<String>? filters,
    Function? call,
    Map<String, Object>? params,
  }) async {
    this.limit = limit;
    Map<String, Object> param = {};
    if (key.isNotEmpty) {
      param.putIfAbsent(key, () => value);
    }

    if (filters != null) {
      for (String key in filters) {
        if (key == "null") {
          continue;
        }
        param.putIfAbsent(key, () => "true");
      }
    }

    if (categoryId != null) {
      for (int id in categoryId) {
        if (id == -1) {
          continue;
        }

        param.putIfAbsent("category_ids[]", () => ["$id"]);
      }
    }

    if (clientId != null && clientId >= 0) {
      //todo check if Merchant ID is not zero
      param.putIfAbsent("merchant_ids[]", () => ["$clientId"]);
    }

    if (searchFilter != null) {
      param.putIfAbsent("search_string", () => searchFilter);
    }

    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "$limit");

    if (page == 1) {
      list.clear();
      isDone.value = false;
    }

    if (page > 1) {
      isLoadingMore = isLoadingMore ?? true.obs;
      isLoadingMore.value = true;
    }

    webService.getListOfCards(params ?? param, (response) {
      list.addAll((response.data?.cards)!);

      if (sortByAmount) {
        list.sort((b, a) => a.compareTo(b));
      }

      if (page == 1 && !sortByAmount) {
        list.shuffle();
      } else if (isLoadingMore != null) {
        isLoadingMore.value = false;
      }

      if (loadAllCards && (response.data?.cards)!.isNotEmpty) {
        page++;
        getCards(
          list,
          isDone,
          loadAllCards: loadAllCards,
          call: call,
          categoryId: categoryId,
          key: key,
          filters: filters,
          clientId: clientId,
          value: value,
          searchFilter: searchFilter,
        );
      } else if (!loadAllCards || (response.data?.cards)!.isEmpty) {
        isDone.value = true;
        if (call != null) call();
      }
    });
  }

  ///Get list of published cards from all merchants
  ///This gets one card each from a merchant
  ///This makes use of the price range.
  ///So one card represents a merchant
  Future<void> getCardPerMerchant(
    RxList<PrimeCardModel> list,
    RxBool isDone, {
    RxBool? isLoadingMore,
    String key = "",
    String value = "",
    Map<String, Object>? params,
    List<int>? categoryId,
    List<String>? filters,
    int? clientId,
    Function? call,
    int page = 1,
    int limit = 20,
  }) async {
    this.limit = limit;
    Map<String, Object> param = {};

    if (key.isNotEmpty) {
      param.putIfAbsent(key, () => value);
    }

    if (filters != null) {
      for (String key in filters) {
        if (key == "null") {
          continue;
        }
        param.putIfAbsent(key, () => "true");
      }
    }

    if (categoryId != null) {
      for (int id in categoryId) {
        if (id == 0) {
          continue;
        }

        param.putIfAbsent("category_ids[]", () => ["$id"]);
      }
    }

    if (clientId != null && clientId >= 0) {
      //todo check if Merchant ID is not zero
      param.putIfAbsent("merchant_ids[]", () => ["$clientId"]);
    }

    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "$limit");

    if (page == 1) {
      list.clear();
      isDone.value = false;
    }

    if (page > 1) {
      isLoadingMore = isLoadingMore ?? true.obs;
      isLoadingMore.value = true;
    }

    webService.getPublishedCardsOnePerMerchant(params ?? param, (response) {
      list.addAll((response.data?.cards ?? []));

      if (page == 1) {
        list.shuffle();
        isDone.value = true;
      } else if (isLoadingMore != null) {
        isLoadingMore.value = false;
      }

      if (call != null) call();
    });
  }

  ///Get list of published cards from all merchants
  ///This gets one card each from a merchant
  ///This makes use of the price range.
  ///So one card represents a merchant
  Future<void> getFavoriteCards(
    RxList<PrimeCardModel> list,
    RxBool isDone, {
    RxBool? isLoadingMore,
    String key = "",
    String value = "",
    Map<String, Object>? params,
    Function? call,
    int page = 1,
    int limit = 20,
  }) async {
    this.limit = limit;
    Map<String, Object> param = {};

    if (key.isNotEmpty) {
      param.putIfAbsent(key, () => value);
    }

    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "$limit");

    if (page == 1) {
      list.clear();
      isDone.value = false;
    }

    if (page > 1) {
      isLoadingMore = isLoadingMore ?? true.obs;
      isLoadingMore.value = true;
    }

    webService.getFavoriteCards(params ?? param, (response) {
      list.addAll(response.data?.favourites ?? []);

      if (page == 1) {
        list.shuffle();
        isDone.value = true;
      } else if (isLoadingMore != null) {
        isLoadingMore.value = false;
      }

      if (call != null) call();
    });
  }

  ///Reset the cart details
  void resetCart() {
    cartTotalItems.value = 0;
    cartNetAmount.value = 0.0;
    cartFees.value = 0.0;
    cartTotalAmount.value = 0.0;
  }

  ///Make a request to the api for cards already saved to the cart
  Future<void> getCart({
    Rx<PrimeCartModel>? cart,
    RxBool? isDone,
    RxList<PrimeCardModel>? cartList,
  }) async {
    isDone?.value = false;

    webService.getCardsInCart((response) {
      cart?.value = response.data?.cart ?? const PrimeCartModel();
      cartList?.value = (response.data?.cart.cards)!;
      cartTotalItems.value = (response.data?.cart.cards.length)!;
      isDone?.value = true;

      cartNetAmount.value = (response.data?.cart.netAmount)!;
      cartFees.value = (response.data?.cart.fees)!;
      cartTotalAmount.value = (response.data?.cart.totalAmount)!;
    });
  }

  Future<void> getWalletCards(
    RxList<BaseObject> list,
    RxBool isDone, {
    int page = 1,
    bool showProgress = true,
    WalletType? type,
    RxBool? isLoadingMore,
    Function(List<BaseObject>)? call,
  }) async {
    HashMap<String, Object> param = HashMap();

    switch (type) {
      case WalletType.PURCHASED:
        param.putIfAbsent("account_to[]", () => "SELF");
        break;
      case WalletType.GIFTED_IN:
        param.putIfAbsent("types[]", () => "received");
        break;
      case WalletType.GIFTED_OUT:
        param.putIfAbsent("types[]", () => "sent");
        break;
      case WalletType.E_FUND:
        param.putIfAbsent("types[]", () => ["sent", "received"]);
        break;
      default:
        param.putIfAbsent("account_to[]", () => "SELF");
        break;
    }

    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "$limit");

    if (page == 1) {
      isDone.value = false;
      list.clear();
    } else {
      isLoadingMore?.value = true;
    }

    await webService.getBoughtCards(
        param, type ?? WalletType.PURCHASED, page == 1 && showProgress,
        (response) {
      _handleResponse(type, response, call: (items) {
        list.addAll(items);
        if (page == 1) {
          isDone.value = true;
        } else {
          isLoadingMore?.value = false;
        }

        if (call != null) call(items);
      });
    });
  }

  Future<void> fetchPurchasedAndGiftedCards(
    RxList<BaseObject> list,
    RxBool isDone, {
    int page = 1,
    bool refresh = false,
    List<String>? type,
    RxBool? isLoadingMore,
  }) async {
    HashMap<String, Object> param = HashMap();
    if (type != null) {}

    // switch (type) {
    //   case WalletType.PURCHASED:
    //     param.putIfAbsent("account_to[]", () => "SELF");
    //     break;
    //   case WalletType.GIFTED_IN:
    //     param.putIfAbsent("types[]", () => "received");
    //     break;
    //   case WalletType.GIFTED_OUT:
    //     param.putIfAbsent("types[]", () => "sent");
    //     break;
    //   case WalletType.E_FUND:
    //     param.putIfAbsent("types[]", () => ["sent", "received"]);
    //     break;
    //   default:
    //     param.putIfAbsent("account_to[]", () => "SELF");
    //     break;
    // }

    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "$limit");

    if (page == 1) {
      list.clear();
      isDone.value = false;
    } else {
      isLoadingMore?.value = true;
    }

    await webService.fetchPurchasedAndGiftedCards(param, (response) {
      list.addAll(response.data?.cardAccounts ?? []);
      if (page == 1) {
        isDone.value = true;
      } else {
        isLoadingMore?.value = false;
      }
    });
  }

  ///Delete a card from the cart list and deduct equivalent amount
  ///of card with the total counter of same card from the [totalAmountToPay] value
  ///@params [card] which is an instance of [PrimeCardModel]
  void deleteCartItem(
    int cardId,
    int cartId, {
    Rx<PrimeCartModel>? cart,
    RxList<PrimeCardModel>? cartList,
    Function(bool isEmpty)? call,
  }) {
    webService.removeItemFromCart(cardId, cartId, (response) {
      if (response.success) {
        resetCart();
        cart?.value = (response.data?.cart)!;
        cartList?.value = (response.data?.cart.cards)!;
        cartTotalItems.value = (response.data?.cart.cards.length)!;

        cartNetAmount.value = (response.data?.cart.netAmount)!;
        cartFees.value = (response.data?.cart.fees)!;
        cartTotalAmount.value = (response.data?.cart.totalAmount)!;

        if (call != null) call(response.data?.cart.cards.isEmpty ?? false);
      } else {
        handleError(
          mess: response.error,
          optMess: "Item cannot be removed",
          cartID: cartId,
        );
      }
    });
  }

  void clearCart({int cartId = 0, Function? call}) {
    HashMap<String, Object> params = HashMap<String, Object>();
    params.putIfAbsent("cart_id", () => "$cartId");

    webService.clearCart(params, (response) {
      if (response.success) {
        SnackBarApi.snackBarSuccess("Cart successfully cleared.");
        resetCart();
        if (call != null) call();
      } else {
        handleError(
          mess: response.error,
          optMess: "Item cannot be removed",
          cartID: cartId,
        );
      }
    });
  }

  void cashOutCardToPrimeWallet({int accountId = 0, Function()? call}) {
    webService.fundPrimeWallet(accountId, (response) {
      if (call != null) call();
    });
  }

  ///============================= Handle Other stuff ===================

  void handleError({
    String? mess,
    String optMess = "A payment is already being processed",
    int cartID = 0,
  }) {
    if (mess != null && mess.contains(optMess) && Get.context != null) {
      DialogsApi.popUpSuccessDialog(
        Get.context!,
        title: "Attention!!!",
        mess: mess +
            "\n\nYou have uncompleted transaction(s) in your history.\nYou will be automatically redirected to your transactions history "
                "to continue or cancel your previous uncompleted transaction.",
        time: 8,
        asset: "assets/images/ic_warn.png",
        call: () {
          NavApi.fireTarget(
            MainScreenTransaction(),
            model: CardModel(cartId: cartID, shouldPopBack: true),
          );
        },
      );
    } else {
      SnackBarApi.snackBarInfo(mess ?? "A payment is already being processed",
          title: "Attention");
      if (mess != null && mess.contains(optMess)) {
        Utils.startTimer(5, () {
          NavApi.fireTarget(
            MainScreenTransaction(),
            model: CardModel(cartId: cartID, shouldPopBack: true),
          );
        });
      }
    }
  }

  void _handleResponse(WalletType? type, BaseResponseModel response,
      {Function(List<BaseObject>)? call}) {
    List<BaseObject> list = [];
    switch (type) {
      case WalletType.PURCHASED:
        list.addAll(response.data?.cardAccounts ?? []);
        break;
      case WalletType.GIFTED_IN:
        list.addAll(response.data?.giftCardsList ?? []);
        // for (GiftedCard gift in (response.data?.giftCardsList ?? [])) {
        //   list.add(gift);
        // }
        break;
      case WalletType.GIFTED_OUT:
        list.addAll(response.data?.giftCardsList ?? []);
        // for (GiftedCard gift in (response.data?.giftCardsList ?? [])) {
        //   list.add(gift);
        // }
        break;
      case WalletType.E_FUND:
        list.addAll(response.data?.eFundRequests ?? []);
        // for (EfundRequestModel efund in (response.data?.eFundRequests ?? [])) {
        //   list.add(efund);
        // }
        print("EDDER ===> ${list.length}");
        break;
      case null:
        list.addAll(response.data?.cardAccounts ?? []);
        break;
    }

    if (call != null) call(list);
  }

  void cancelTransaction(String tranId,
      {bool showSnack = true, Function? call}) {
    webService.cancelTransactions(tranId, (response) {
      if (showSnack) {
        SnackBarApi.snackBarSuccess("Transaction successfully cancelled");
      }

      if (call != null) {
        call();
      }
    });
  }

  void reGiftCard({
    required int accountId,
    required String telephone,
    String? message,
    String? dateTime,
    Function? call,
  }) {
    HashMap<String, Object> params = HashMap();

    if (message != null && message.isNotEmpty) {
      params.putIfAbsent("message", () => message);
    }
    if (dateTime != null && dateTime.isNotEmpty) {
      params.putIfAbsent("scheduled_date", () => dateTime);
    }

    params.putIfAbsent("account_id", () => accountId);
    params.putIfAbsent("telephone", () => telephone);
    webService.reGiftCard(params, (response) {
      if (call != null) {
        call();
      }
    });
  }

  void favouriteMerchant(PrimeCardModel card, {Function? call}) {
    HashMap<String, Object> params = HashMap();

    params.putIfAbsent("card_id", () => "${card.id}");

    params.putIfAbsent("client_id", () => "${card.client_id}");

    webService.addCardsToFavorite(params, (resp) {
      SnackBarApi.snackBarSuccess(
          "Card successfully added to your favorite list");
      if (call != null) {
        call();
      }
    });
  }

  void searchCard(BuildContext context) async {
    final PrimeCardModel? card = await showSearch(
        context: context, delegate: CardDelegate(controller: this));

    if (card != null && card.amount.isNotEmpty) {
      onCardSelected(card, "_filter_cards");
    }
  }

  Future<RxList<PrimeCardModel>> getSearchResults(
      String filter, RxBool isDoneLoading) async {
    isDoneLoading.value = false;
    RxList<PrimeCardModel> cardsList = RxList<PrimeCardModel>();
    List<PrimeCardModel> list = await webService.searchCardsAndMerchant(filter);

    cardsList.clear();
    cardsList.addAll(list);
    isDoneLoading.value = true;
    return cardsList;
  }

  void goToWebPayment({String? paymentUrl, Function? call}) {
   if(paymentUrl == null || paymentUrl.isEmpty){
     SnackBarApi.snackBarToast("Payment url missing", title: "Error");
     return;
   }

    NavApi.fireTarget(BaseWebView(),
        model: WebModel(
          controlPage: true,
          url: paymentUrl,
          title: "Payment",
          onDoneOnclick: () {
            if (call != null) {
              call();
            } else {
              NavApi.fireAction(EventAction.NAV_HOME);
            }
          },
        ));
  }
}
