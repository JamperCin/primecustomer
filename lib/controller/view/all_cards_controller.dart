import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/advert_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/model/remote/advert_image_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/local/card_model.dart';

class AllCardsController extends BaseController {
  CardController? cardController;
  AdvertController? advertController;

  ///Holders of the array of cards
  RxList<PrimeCardModel> cardsList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> mainCardList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> filteringList = RxList<PrimeCardModel>();

  ///List of of adverts will be stored as array here
  RxList<AdvertImageModel> advertList = RxList<AdvertImageModel>();

  Rx<CardModel> selectedCardModel = CardModel().obs;
  RxString appBarTitle = 'More Cards'.obs;

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int initialPosition = 1;

  ///Boolean listener to listen for request being done
  final RxBool isDoneLoadingCards = false.obs;
  final RxBool isLoadingMore = false.obs;
  RxBool isOneCardPerMerchant = false.obs;

  bool hasStartedApiCall = false;
  String? filter;
  int? categoryId;
  int? clientId;

  RxString searchFilter = "".obs;

  TextEditingController searchController = TextEditingController();

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
    advertController = AdvertController(webService!);
  }

  @override
  void onInit() {
    super.onInit();
    listenToScroll();
  }

  Future<void> initData(CardModel model) async {
    selectedCardModel.value = model;
    isOneCardPerMerchant.value = model.filter == "All_Cards";
    appBarTitle.value = model.selectedMenuCategory?.name ?? 'More Cards';

    if (model.advertList != null) {
      advertList.clear();
      advertList.addAll(model.advertList ?? []);
    }

    await initAllRequest(
      filter: model.filter,
      categoryId: model.selectedMenuCategory?.id,
      clientId: model.clientId,
    );
    advertController?.getAdverts(advertList);
  }

  Future<void> initAllRequest({
    int page = 1,
    String? filter,
    int? categoryId,
    int? clientId,
    String? searchFilter,
  }) async {
    this.filter = filter;
    this.categoryId = categoryId;
    this.clientId = clientId;
    hasStartedApiCall = true;
    initialPosition = page;

    if (filter != null && filter == "All_Cards") {
      cardController?.getCardPerMerchant(
        mainCardList,
        isDoneLoadingCards,
        page: page,
        isLoadingMore: isLoadingMore,
        call: () {
          hasStartedApiCall = false;
          cardsList.clear();
          cardsList.addAll(mainCardList);
        },
      );
      return;
    }

    //Request for the cards from API
    /*if (filter != null) {
      cardController?.getCardPerMerchant(
        mainCardList,
        isDoneLoadingCards,
        page: page,
        categoryId: categoryId != 0 ? [categoryId ?? 0] : null,
        isLoadingMore: isLoadingMore,
        filters: ["$filter"],
        clientId: clientId,
        call: () {
          hasStartedApiCall = false;
          cardsList.clear();
          cardsList.addAll(mainCardList);
         debugPrint("AC == ${cardsList.length} == ${mainCardList.length}");
        },
      );
      return;
    }*/

    //Request for the cards from API
    cardController?.getCards(
      mainCardList,
      isDoneLoadingCards,
      page: page,
      categoryId: categoryId != -1 ? [categoryId ?? -1] : null,
      isLoadingMore: isLoadingMore,
      filters: ["$filter"],
      clientId: clientId,
      call: () {
        hasStartedApiCall = false;
        cardsList.clear();
        cardsList.addAll(mainCardList);
        debugPrint("AC == ${cardsList.length} == ${mainCardList.length}");
      },
    );
  }

  void listenToScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!hasStartedApiCall) {
          initialPosition++;
          initAllRequest(
              page: initialPosition, filter: filter, categoryId: categoryId);
        }
      }
    });
  }

  ///Perform search on the list of cards on the home screen
  void onSearchOffline(String val) {
    cardsList.clear();
    if (val.isEmpty) {
      cardsList.addAll(mainCardList);
    } else {
      for (PrimeCardModel card in mainCardList) {
        CardUtils cardUtils = CardUtils(card);
        if (cardUtils.getMerchantName().toLowerCase().contains(val) ||
            card.amount.contains(val) ||
            cardUtils.getLocation().toLowerCase().contains(val) ||
            cardUtils.getAmountRange().toLowerCase().contains(val)) {
          cardsList.add(card);
        }
      }
    }
  }

  ///Perform An Online Search
  void onSearchOnline(String val) async {
    HashMap<String, Object> params = HashMap();

    if (val.isNotEmpty) {
      params.putIfAbsent("search_string", () => val);
    } else {
      isDoneLoadingCards.value = true;
      cardsList.clear();
      filteringList.clear();
    }

    isDoneLoadingCards.value = false;
    filteringList.clear();
    await cardController?.getCardPerMerchant(filteringList, isDoneLoadingCards,
        params: params, call: () {
      isDoneLoadingCards.value = true;
      cardsList.clear();
      cardsList.addAll(filteringList);
    });
  }
}
