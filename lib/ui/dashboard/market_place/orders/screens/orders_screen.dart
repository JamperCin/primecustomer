import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/ui/dashboard/market_place/orders/screens/tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/orders_screen_controller.dart';

class OrdersScreen extends BaseScreenStandard {
  final controller = Get.put(OrdersScreenController());

  OrdersScreen() {
    controller.onInitData();
  }

  @override
  String appBarTitle() {
    return 'Orders';
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    //return ScrollAnimationWidget();
    return Column(
      children: [
        Obx(() => UiApi.topMenuWidget(
                menu: controller.menuList,
                mod: controller.selectedStatus,
                onTap: (e) {
                  controller.onOrderStatusSelected(e);
                })
            // () => UiApi.horizontalListView(
            //   aspectRatio: 5.4,
            //   list: [
            //     ...controller.menuList.map((e) => UiApi.scrollingMenuItem(
            //           e,
            //           controller.selectedStatus,
            //           activeColor: AppColors.primaryGreenColor,
            //           disabledColor: AppColors.lightGreen,
            //           disabledTextColor: AppColors.black,
            //           onTap: () {
            //             controller.onOrderStatusSelected(e);
            //           },
            //         ))
            //   ],
            // ),
            ),
        Expanded(
          child: Obx(() => screenView()),
        ),
      ],
    );
  }

  Widget screenView() {
    switch (controller.selectedStatus.value.key) {
      case 'pending':
        return controller.orderApi.ordersListWidget(
          orders: controller.ordersList,
          isDoneLoading: controller.isDoneLoading,
          onRefresh: controller.fetchOrderPayments(refresh: true),
          scrollController: controller.scrollController,
          onTap: controller.onOrderItemClicked,
        );
      case 'in_transit':
        return Example6Vertical();
      case 'delivered':
        return SizedBox();
      default:
        return const SizedBox.shrink();
    }
  }
}
