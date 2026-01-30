import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:get/get.dart';

class SearchShopController extends BaseController {
  RxBool isDoneLoading = true.obs;

  Future<List<ShopModel>> searchForShop(
    String query, {
    double? latitude,
    double? longitude,
  }) async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("search_string", () => query);
    if (latitude != null) {
      param.putIfAbsent("latitude", () => "$latitude");
    }
    if (longitude != null) {
      param.putIfAbsent("longitude", () => "$longitude");
    }

    List<ShopModel> results = [];
    await webService?.fetchAllShops(param, (response) {
      results.addAll(response.data?.shops ?? []);
    });

    // await webService?.fetchData<ShopModel>(url: 'url');

    return results;
  }
}
