import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/enum/filter_type.dart';
import 'package:primecustomer/data/model/remote/payments.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/transaction_history/purchase_details_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/transaction_history/purchase_tab.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/transaction_history/redemption_details_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/transaction_history/redemption_tab.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends BaseController {
  RxInt tabIndex = 0.obs;
  final RxList<Payments> redemptionHistory = RxList<Payments>();
  final RxList<Payments> purchaseHistory = RxList<Payments>();
  RxBool isDoneLoadingPurchase = false.obs;
  RxBool isDoneLoadingRedemption = false.obs;
  RxBool shouldPopBack = false.obs;
  RxInt selectedCartId = 0.obs;
  int selectedCartIndex = 0;

  TransactionType transactionType = TransactionType.PURCHASE;

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int page = 1;
  final RxBool isLoadingMore = false.obs;
  bool hasStartedApiCall = false;

  RxList<Widget> screenView = RxList<Widget>();

  @override
  void onInit() {
    super.onInit();
    listenToScroll();
  }

  ///Listen to scrolling of listview
  void listenToScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!hasStartedApiCall) {
          page++;
          initRequestForHistory();
        }
      }
    });
  }

  ///Listen to onclick from the tab
  void onTabOnClick(int index) {
    tabIndex.value = index;

    addScreen(index == 0 ? PurchaseTab() : RedemptionTab());

    transactionType =
        index == 0 ? TransactionType.PURCHASE : TransactionType.REDEMPTION;
    page = 1;
    initRequestForHistory();
  }

  void clearData() {
    purchaseHistory.clear();
    isDoneLoadingPurchase.value = false;
  }

  ///Request for transaction History for customer
  Future<void> initRequestForHistory() async {
    if (page == 1) {
      if (transactionType == TransactionType.PURCHASE) {
        isDoneLoadingPurchase.value = false;
        purchaseHistory.clear();
      } else {
        isDoneLoadingRedemption.value = false;
        redemptionHistory.clear();
      }
    } else {
      isLoadingMore.value = true;
    }

    webService?.getRedemptionTransactions(page, (response) {
      isLoadingMore.value = false;
      //If transaction type is PURCHASE
      if (transactionType == TransactionType.PURCHASE) {
        purchaseHistory.addAll(response.data?.payments ?? []);
        isDoneLoadingPurchase.value = true;
      } else {
        redemptionHistory.addAll(response.data?.payments ?? []);
        isDoneLoadingRedemption.value = true;
      }
    }, type: transactionType, showProgress: page == 1);
  }

  void onPurchaseItemOnClick(Payments pay) {
    NavApi.fireTarget(
      PurchaseDetailScreen(
        reLoad: () async {
          selectedCartId.value = -1;
          page = 1;
          await initRequestForHistory();
          CardController(webService!).getCart();
        },
      ),
      model: pay,
    );
  }

  void onRedemptionItemOnClick(Payments pay) {
    NavApi.fireTarget(RedemptionDetailsScreen(), model: pay);
  }

  void addScreen(Widget widget) {
    screenView.clear();
    screenView.add(widget);
  }

  void scrollToIndex() {
    Utils.startTimer(2, () {
      //scrollController.animateTo(offset, duration: duration, curve: curve);
      // scrollController.jumpTo(selectedCartIndex);
    });
  }
}
