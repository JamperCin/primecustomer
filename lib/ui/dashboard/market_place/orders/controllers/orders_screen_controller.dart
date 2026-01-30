import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/shop_payment_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/ui/dashboard/market_place/orders/screens/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/display/dictionary_model.dart';
import '../../../../../res/ui_helpers/order_api.dart';

class OrdersScreenController extends BaseController {
  RxList<ShopPaymentModel> ordersList = <ShopPaymentModel>[].obs;
  RxList<ShopPaymentModel> mainOrdersList = <ShopPaymentModel>[].obs;
  RxBool isLoadingMore = false.obs;
  RxBool isDoneLoading = false.obs;
  OrderApi orderApi = OrderApi();
  RxList<Widget> screen = RxList();

  ///Menu list for display
  RxList<DictionaryModel> menuList = [
    DictionaryModel(
      key: 'pending',
      value: 'Pending',
      selected: true.obs,
      icon: Icons.pending,
    ),
    DictionaryModel(
      key: 'in_transit',
      value: 'In Transit',
      selected: false.obs,
      icon: Icons.delivery_dining,
    ),
    DictionaryModel(
      key: 'delivered',
      value: 'Delivered',
      selected: false.obs,
      icon: Icons.done_all,
    ),
  ].obs;

  Rx<DictionaryModel> selectedStatus = DictionaryModel(
    key: 'pending',
    value: 'Pending',
    icon: Icons.pending,
    selected: true.obs,
  ).obs;
  int page = 1;

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  bool hasStartedApiCall = false;

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
          fetchOrderPayments(page: page);
        }
      }
    });
  }

  ///Initialise this method to make the initial Api call
  Future<void> onInitData() async {
    await Future.delayed(const Duration(milliseconds: 180));
    await fetchOrderPayments();
  }

  Future<void> fetchOrderPayments({
    int page = 1,
    bool refresh = false,
    String? status,
  }) async {
    if (!refresh) {
      if (page == 1) {
        isDoneLoading.value = false;
        ordersList.clear();
        mainOrdersList.clear();
      } else {
        isLoadingMore.value = true;
      }
    }
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "20");
    if (status != null) {
      param.putIfAbsent("status", () => status);
    }

    webService?.fetchOrderPayments(param, (resp) {
      handleResponse(resp, page: page, refresh: refresh);
    });
  }

  //Future<void> handlePaymentResponse(BaseResponseModel res, int page) async {}

  // Future<void> fetchOrders({int page = 1, bool refresh = false}) async {
  //   if (!refresh) {
  //     if (page == 1) {
  //       isDoneLoading.value = false;
  //       ordersList.clear();
  //       mainOrdersList.clear();
  //     } else {
  //       isLoadingMore.value = true;
  //     }
  //   }
  //
  //   webService?.fetchOrders(page, (resp) async {
  //     await handleResponse(
  //       resp,
  //       page: page,
  //     );
  //   });
  // }

  Future<void> handleResponse(
    BaseResponseModel resp, {
    int page = 1,
    bool refresh = false,
  }) async {
    if (page == 1) {
      isDoneLoading.value = true;
    } else {
      isLoadingMore.value = false;
    }

    if (refresh && page == 1) {
      ordersList.clear();
      mainOrdersList.clear();
    }

    ordersList.addAll(resp.data?.shopPayments ?? []);
    mainOrdersList.addAll(resp.data?.shopPayments ?? []);
  }

  void onOrderStatusSelected(DictionaryModel dict) {
    selectedStatus.value = dict;
  }

  void onOrderItemClicked(ShopPaymentModel order) {
    order = order.copyWith(orderStats: selectedStatus.value.key);
    NavApi.fireTarget(OrderDetailScreen(), model: order);
  }
}
