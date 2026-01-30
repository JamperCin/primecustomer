import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/double_extension.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/basic/page_anim_controller.dart';
import 'package:primecustomer/controller/basic/prime_wallet_controller.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/advert_image_model.dart';
import 'package:primecustomer/data/model/remote/poster_cards_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/home/all_menu_categories.dart';
import 'package:primecustomer/ui/dashboard/card/all_cards.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/remote/category_model.dart';
import '../basic/advert_controller.dart';

class HomeController extends PageAnimationController {
  ///CardController
  CardController? cardController;
  AdvertController? advertController;

  ///Holders of the array of cards
  RxList<PrimeCardModel> trendingCardsList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> featuredCardsList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> newCardsList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> moreCardsList = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> promoCardsList = RxList<PrimeCardModel>();

  ///Boolean to listen to changes when api request is done loading
  final RxBool isDoneLoadingNewCards = false.obs;
  final RxBool isDoneLoadingTrendingCards = false.obs;
  final RxBool isDoneLoadingFeaturedCards = false.obs;
  final RxBool isDoneLoadingMoreCards = false.obs;
  final RxBool isDoneLoadingAdverts = false.obs;
  final RxBool isDoneLoadingFilterList = false.obs;
  final RxBool isDoneLoadingPromoList = false.obs;

  final RxBool isFilteringCards = false.obs;

  final List<DictionaryModel> filterMenuList = [
    DictionaryModel(key: 'Trending', value: "is_trending", selected: false.obs),
    DictionaryModel(key: 'New Cards', value: "is_new", selected: false.obs),
    DictionaryModel(
        key: 'Promotions', value: "is_promotion", selected: false.obs),
    DictionaryModel(key: 'Featured', value: "is_feature", selected: false.obs),
    DictionaryModel(
        key: 'Universal Cards', value: "prime_only", selected: false.obs),
  ];

  ///List of of adverts will be stored as array here
  RxList<AdvertImageModel> advertList = RxList<AdvertImageModel>();

  ///Filter cards
  RxList<PrimeCardModel> filteredCards = RxList<PrimeCardModel>();
  RxList<PrimeCardModel> mainFilteredCards = RxList<PrimeCardModel>();
  final RxBool isDoneLoadFilteredCards = false.obs;

  ///Menu categories list here
  RxList<CategoryModel> menuCatList = RxList<CategoryModel>();
  List<CategoryModel> tempMenuCatList = [];

  RxList<PosterCardsModel> posterCardsList = RxList<PosterCardsModel>();

  RxString location = "".obs;

  TextEditingController searchCtrl = TextEditingController();

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
    advertController = AdvertController(webService!);
  }

  // @override
  // void onInit() {
  //   clear();
  //   Utils.startTimer(1, () {
  //     initAllRequest();
  //   });
  //
  //   super.onInit();
  // }

  RxBool doneLoadingAllCards() {
    RxBool valid = false.obs;
    valid.value = isDoneLoadingNewCards.value &&
        isDoneLoadingTrendingCards.value &&
        isDoneLoadingFeaturedCards.value &&
        isDoneLoadingMoreCards.value;
    return valid;
  }

  RxBool allCardsEmpty() {
    RxBool valid = false.obs;

    valid.value = newCardsList.isEmpty &&
        featuredCardsList.isEmpty &&
        newCardsList.isEmpty &&
        moreCardsList.isEmpty;

    return valid;
  }

  void clear() {
    trendingCardsList.clear();
    featuredCardsList.clear();
    newCardsList.clear();
    moreCardsList.clear();
    filteredCards.clear();
    promoCardsList.clear();

    isDoneLoadingNewCards.value = false;
    isDoneLoadingTrendingCards.value = false;
    isDoneLoadingFeaturedCards.value = false;
    isDoneLoadingMoreCards.value = false;
    isDoneLoadingFilterList.value = false;
    isDoneLoadingPromoList.value = false;
  }

  ///Init the request to get the details of the current user who logged in
  ///This doesn't apply to Guest Login User
  /// check if Guest User, then dont query for user details
  void initGetUserDetailsRequest() async {
    if (isGuestUser.value) {
      return;
    }

    ///Get Cart details
    await cardController?.getCart();

    webService?.getUserDetails((response) {
      prefUtils.saveDetails(response);
      if (response.data != null && response.data?.userDetails.id != 0) {
        checkIfSecurityQuestionsAdded(response.data?.userDetails.id ?? 0);
      }
    });

    final account = await PrimeWalletController(webService).getWalletDetails();
    if (account != null) {
      posterCardsList.value.add(
        PosterCardsModel(
          title: "Prime Wallet",
          description: "${account.availableBalance.toDecimalPlaces()}",
        ),
      );
    }
  }

  ///Check if Security Questions Not Added to User's account, then request them to set up
  void checkIfSecurityQuestionsAdded(int userId) {
    //If Questions already added then ignore
    if (prefUtils.getBool(PrefConstants.SECURITY_QUESTIONS)) {
      return;
    }
    Utils.startTimer(3, () {
      initGetUsersSavedQuestions(userId);
    });
  }

  void initGetUsersSavedQuestions(int userId) {
    webService?.getUsersSavedQuestions(userId, (response) {
      bool questionsAdded = (response.data?.questions ?? []).isNotEmpty;
      BaseController.isSecurityQuestionsAdded.value = questionsAdded;
      prefUtils.setBool(PrefConstants.SECURITY_QUESTIONS, questionsAdded);
    });
  }

  Future<List<CategoryModel>> getMenuCategories() async {
    menuCatList.clear();
    tempMenuCatList.clear();

    //Add from DB
    menuCatList.addAll(prefUtils.getListOfMenu());
    tempMenuCatList.addAll(prefUtils.getListOfMenu());

    await webService?.getMenuCategories((response) {
      menuCatList.clear();
      tempMenuCatList.clear();

      menuCatList.addAll((response.data?.categories)!);
      tempMenuCatList.addAll((response.data?.categories)!);
    });
    return menuCatList;
  }

  ///Initialise all important Request in the app and refresh all pages and counters accordingly
  ///1. Get all menus for the categories
  ///2. Get all published cards from Merchants
  ///3. Get cards in your wallet
  ///4. Get cards in your cart
  ///5. Get list of adverts on the platform
  ///6. Get promotional cards for Guest users
  Future<void> initAllRequest() async {
    await Future.delayed(const Duration(seconds: 1));
    await getMenuCategories();
    await cardController?.getCards(
        featuredCardsList, isDoneLoadingFeaturedCards,
        key: "is_featured");
    await cardController?.getCards(
        trendingCardsList, isDoneLoadingTrendingCards,
        key: "is_trending");
    await advertController?.getAdverts(advertList);
    await cardController?.getCards(newCardsList, isDoneLoadingNewCards,
        key: "is_new");
    await cardController?.getCardPerMerchant(
        moreCardsList, isDoneLoadingMoreCards,
        key: "", value: "");

    if (isGuestUser.value) {
      cardController?.getCards(promoCardsList, isDoneLoadingPromoList,
          key: "promotions_only");
    }

    initGetUserDetailsRequest();
  }

  void viewAllTypesOfCardOnClick({String? filter, CategoryModel? menu}) {
    NavApi.fireTarget(
      AllCardsScreen(),
      //trans: Transition.downToUp,
      model: CardModel(
        filter: filter,
        advertList: advertList,
        selectedMenuCategory: menu,
      ),
    );
  }

  void onSearchMenu(String val) {
    menuCatList.clear();
    for (CategoryModel mod in tempMenuCatList) {
      if (mod.name.toLowerCase().contains(val)) {
        menuCatList.add(mod);
      }
    }
    if (val.isEmpty) {
      menuCatList.addAll(tempMenuCatList);
    }
  }

  void onSearchOnline(String val) async {
    cardController?.searchCard(mContext!);
    /* HashMap<String, Object> params = HashMap();

    if (val.isNotEmpty) {
      params.putIfAbsent("search_string", () => val);
    } else {
      isFilteringCards.value = true;
      filteredCards.clear();
      mainFilteredCards.clear();
    }

    isFilteringCards.value = true;
    await cardController?.getCards(mainFilteredCards, isDoneLoadingFilterList,
        params: params, call: () {
      isFilteringCards.value = false;
      filteredCards.clear();
      filteredCards.addAll(mainFilteredCards);
    });*/
  }

  void viewAllMenuCategories() {
    NavApi.fireTarget(
      AllMenuCategoriesScreen(),
      model: CardModel(menuCategoryList: menuCatList, advertList: advertList),
    );
  }

  void clearAllFilters() {
    for (DictionaryModel mod in filterMenuList) {
      mod.selected?.value = false;
    }
    filteredCards.clear();
    NavApi.fireBack();
  }

  ///This will handle the Filter
  void onFilterOnClick() {
    // getNearByMerchants();
    // return;
    DialogsApi.showBottomSheet(
      containerSize: SizeConfig.screenHeight * 0.5,
      child: UiApi.filterWidget(filterMenuList, searchCtrl: searchCtrl,
          onFilter: () {
        NavApi.fireBack();
        initFilteringCards();
      }),
      title: "Filter Cards",
      padding: EdgeInsets.only(
        top: AppDimens.dimen5,
        left: AppDimens.dimen10,
        right: AppDimens.dimen10,
        bottom: AppDimens.dimen20,
      ),
      leadingTitle: InkWell(
        onTap: () {
          clearAllFilters();
        },
        child: Text(
          "Clear",
          style: AppTextStyles.subDescRegular,
        ),
      ),
    );
  }

  void initFilteringCards() async {
    List<String> value = [];
    for (DictionaryModel dic in filterMenuList) {
      if (dic.selected?.value ?? false) {
        value.add(dic.value);
      }
    }

    if (value.isEmpty && getStringData(searchCtrl).isEmpty) {
      SnackBarApi.snackBarInfo("No filter selected");
      return;
    }

    HashMap<String, Object> params = HashMap();
    for (String key in value) {
      params.putIfAbsent(key, () => "true");
    }

    if (getStringData(searchCtrl).isNotEmpty) {
      params.putIfAbsent("search_string", () => getStringData(searchCtrl));
    }

    isFilteringCards.value = true;
    await cardController?.getCards(filteredCards, isDoneLoadingFilterList,
        params: params, call: () {
      isFilteringCards.value = false;
    });
  }
}
