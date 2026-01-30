import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductController extends BaseController {
  ProductsController productsController = ProductsController();
  List<ProductModel> products = [];

  RxList<DictionaryModel> filterKeys = [
    DictionaryModel(key: 'new_products', value: 'New Products'),
    DictionaryModel(key: 'new_products', value: 'New Products'),
  ].obs;

  RxList<DictionaryModel> searchType = [
    DictionaryModel(
      key: 'search_by_shop',
      value: 'Product',
      selected: true.obs,
      icon: Icons.shopping_cart,
    ),
    DictionaryModel(
      key: 'search_by_product',
      value: 'Shop',
      icon: Icons.store,
    ),
  ].obs;

  Rx<DictionaryModel> selectedSearchType = DictionaryModel(
    key: 'search_by_shop',
    value: 'Product',
    selected: true.obs,
    icon: Icons.shopping_cart,
  ).obs;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    productsController.setContext(context);
  }

  ///Fetch for all products when user searches for any product
  Future<List<ProductModel>> fetchProducts(String query) async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("search_string", () => query);
    products.clear();
    await webService?.fetchProductsFromAllShops(param, (res) {
      products.addAll(res.data?.products ?? []);
    });
    return products;
  }

  void onFilterOnClick() {
    DialogsApi.showBottomSheet(
        mainChild: Column(
      children: [
        Text("Search for", style: AppTextStyles.title),
        Obx(
          () => UiApi.topMenuWidget(
              menu: searchType,
              mod: selectedSearchType,
              onTap: (e) {
                selectedSearchType.value = e;
              }),
        ),
        // Text("Select Filter", style: AppTextStyles.title),
        // SizedBox(height: AppDimens.dimen10),
        UiApi.divider(
          width: SizeConfig.screenWidth,
          height: 2,
          color: AppColors.black,
        ),
        SizedBox(height: AppDimens.dimen10),
        Expanded(
            child: ListView(
          children: [],
        ))
      ],
    ));
  }
}
