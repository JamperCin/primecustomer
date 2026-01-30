import 'package:primecustomer/data/enum/shop_type.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/shops_api.dart';
import 'package:primecustomer/ui/base/base_search_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_shop_controller.dart';

class SearchShopDelegate extends BaseSearchStandard<ShopModel> {
  final controller = Get.put(SearchShopController());

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  Widget filterWidget() {
    return IconButton(
      tooltip: 'Clear',
      icon: Icon(Icons.menu_open_outlined, size: AppDimens.dimen18),
      onPressed: () {
        query = '';
      },
    );
  }

  @override
  void onClose(BuildContext context) {
    close(context, const ShopModel());
  }

  @override
  Future<List<ShopModel>> fetchSuggestions({required String query}) {
    return controller.searchForShop(query);
  }

  @override
  Widget listItemWidget(BuildContext context, ShopModel item) {
    return ShopsApi().shopItemWidget(
        shop: item,
        shopType: ShopType.searchedShop,
        onTap: (s) {
          close(context, item);
        });
  }
}
