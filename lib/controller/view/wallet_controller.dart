import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/basic/emoji_feedback_controller.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/e_fund_request_model.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/efund/efund_received_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/efund/efund_sent_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/gifted_cards/gifted_out_screen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/redemption/purchased_card_details.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/used_card/exhaustedCardScreen.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/walllet_tabs/e_fund_tab.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/walllet_tabs/gifted_in_tab.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/walllet_tabs/gifted_out_tab.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/walllet_tabs/purchased_tab.dart';
import 'package:primecustomer/ui/dashboard/card/all_cards.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends BaseController {
  CardController? cardController;
  EmojiFeedbackController? emojiFeedbackController;

  RxInt tabIndex = 0.obs;
  RxList<Widget> screenView = RxList<Widget>();

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int initialPage = 1;
  final RxBool isLoadingMore = false.obs;
  bool hasStartedApiCall = false;

  WalletType purchasedCardType = WalletType.PURCHASED;
  RxList<BaseObject> cardAccountList = RxList<BaseObject>();
  RxList<BaseObject> mainCardList = RxList<BaseObject>();
  RxBool isDoneLoading = false.obs;
  bool isCardExhausted = false;

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
          initialPage++;
          isLoadingMore.value = true;
          fetchWallet(type: purchasedCardType);
        }
      }
    });
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
    emojiFeedbackController = EmojiFeedbackController(webService, context);
  }

  ///Fetch all Gifted cards that belongs to this current user
  void fetchWallet({required WalletType type}) {
    purchasedCardType = type;
    hasStartedApiCall = true;
    cardController?.getWalletCards(
      cardAccountList,
      isDoneLoading,
      type: type,
      page: initialPage,
      isLoadingMore: isLoadingMore,
      call: (list) {
        mainCardList.addAll(list);
        hasStartedApiCall = false;
        isLoadingMore.value = false;
      },
    );
  }

  // void refreshListAfterFeedBack() {
  //   cardController?.page = initialPage;
  //   isDoneLoading.value = false;
  //   cardController?.getWalletCards(cardAccountList, isDoneLoading,
  //       type: purchasedCardType,
  //       clear: false,
  //       showProgress: false, call: (list) {
  //     cardAccountList.clear();
  //     cardAccountList.addAll(list);
  //   });
  // }

  ///This method checks if the card is fully used or not and shows appropriate screen
  onAccountSelected(BaseObject object, bool isCardExhausted, bool isEmoji) {
    this.isCardExhausted = isCardExhausted;
    CardModel model = CardModel(object: object, type: purchasedCardType);

    //if Emoji is selected then apply emoji on the card
    if (isEmoji) {
      emojiFeedbackController?.handleEmojis(object as GiftedCard, call: (data) {
        // todo refreshListAfterFeedBack();
      });
      return;
    }

    switch (purchasedCardType) {
      case WalletType.PURCHASED:
      case WalletType.GIFTED_IN:
        //If a card is exhausted, take them to this screen
        if (isCardExhausted) {
          NavApi.fireTarget(ExhaustedCardScreen(), model: model);
          return;
        }
        //If a card is not exhausted, take them to this screen
        NavApi.fireTarget(PurchasedCardDetails(), model: object);
        break;
      case WalletType.GIFTED_OUT:
        if (object is GiftedCard) {
          NavApi.fireTarget(GiftedOutScreen(), model: model);
        } else {
          purchasedCardType = WalletType.PURCHASED;
          onAccountSelected(object, isCardExhausted, isEmoji);
        }
        break;
      case WalletType.E_FUND:
        EfundRequestModel mod = object as EfundRequestModel;
        bool isYou = prefUtils.isYou(phone: mod.requester.eFundPhone);
        NavApi.fireTarget(isYou ? EfundSentScreen() : EfundReceivedScreen(), model: mod);
        break;
    }
  }

  void onTabOnClick(int index) {
    tabIndex.value = index;
    switch (index) {
      case 0:
        addScreen(PurchasedTab());
        break;
      case 1:
        addScreen(GiftedInTab());
        break;
      case 2:
        addScreen(GiftedOutTab());
        break;
      case 3:
        addScreen(EfundTab());
        break;
    }
  }

  void addScreen(Widget widget) {
    screenView.clear();
    screenView.add(widget);
  }

  void clearList() {
    cardAccountList.clear();
    mainCardList.clear();
    isDoneLoading.value = false;
    initialPage = 1;
  }

  void viewAllTypesOfCard() {
    NavApi.fireTarget(AllCardsScreen(), model: CardModel());
  }

  ///Perform search on the list of card accounts
  void onSearchOffline(String val) {
    cardAccountList.clear();
    if (val.isEmpty) {
      cardAccountList.addAll(mainCardList);
    } else if (purchasedCardType == WalletType.E_FUND) {
      for (BaseObject obj in mainCardList) {
        EfundRequestModel fund = obj as EfundRequestModel;
        if (fund.status.toLowerCase().contains(val) ||
            fund.requester.eFundPhone.contains(val)) {
          cardAccountList.add(obj);
        }
      }
    } else {
      for (BaseObject obj in mainCardList) {
        CardUtils cardUtils = CardUtils(const PrimeCardModel());
        if (obj is CardAccount) {
          cardUtils = CardUtils(obj.card).setObject(obj);
        } else if (obj is GiftedCard) {
          cardUtils = CardUtils(obj.account.card).setObject(obj);
        }

        if (cardUtils.getMerchantName().toLowerCase().contains(val) ||
            cardUtils.card.amount.contains(val) ||
            cardUtils.getLocation().toLowerCase().contains(val) ||
            cardUtils.getAmountRange().toLowerCase().contains(val) ||
            cardUtils.getAccountStatus().toLowerCase().contains(val) ||
            cardUtils
                .giftPersonName(type: purchasedCardType)
                .toLowerCase()
                .contains(val) ||
            cardUtils.getPurchasedCode().toLowerCase().contains(val) ||
            cardUtils.accountDate().toLowerCase().contains(val)) {
          cardAccountList.add(obj);
        }
      }
    }
  }

  void onFilterOnClick() {
    UiApi.popUpContainer(
      context: mContext!,
    );
  }
}
