import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/advert_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/model/remote/advert_image_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteCardsController extends BaseController {
  RxList<PrimeCardModel> cardsList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> mainCardsList = RxList<PrimeCardModel>();
  RxBool isDoneLoadingFavorite = false.obs;
  CardController? cardController;
  AdvertController? advertController;

  ///List of of adverts will be stored as array here
  RxList<AdvertImageModel> advertList = RxList<AdvertImageModel>();
  RxString searchFilter = "".obs;
  TextEditingController searchController = TextEditingController();

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int initialPosition = 1;

  final RxBool isLoadingMore = false.obs;
  bool hasStartedApiCall = false;

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

  void listenToScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!hasStartedApiCall) {
          initialPosition++;
          getFavoriteCards(page: initialPosition);
        }
      }
    });
  }

  ///Get the favorite cards on the platform
  void getFavoriteCards({int page = 1}) {
    initialPosition = page;
    hasStartedApiCall = true;

    cardController?.getFavoriteCards(
      mainCardsList,
      isDoneLoadingFavorite,
      page: page,
      isLoadingMore: isLoadingMore,
      call: () {
        hasStartedApiCall = false;
        cardsList.clear();
        cardsList.addAll(mainCardsList);
      },
    );
  }

  void getAdverts() {
    advertController?.getAdverts(advertList);
  }

  ///Perform search on the list of cards on the home screen
  void onSearchOffline(String val) {
    cardsList.clear();
    if (val.isEmpty) {
      cardsList.addAll(mainCardsList);
    } else {
      for (PrimeCardModel card in mainCardsList) {
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
}
