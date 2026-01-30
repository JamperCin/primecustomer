import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/ui_helpers/product_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_search_standard.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/controller/search_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductDelegate extends BaseSearchStandard<ProductModel> {
  final controller = Get.put(SearchProductController());

  @override
  Future<List<ProductModel>> fetchSuggestions({required String query}) {
    return controller.fetchProducts(query);
  }

  @override
  Widget cardWidget(BuildContext context, ProductModel item) {
    return ProductApi.searchedProductItemWidget(item, onTap: (product) {
      close(context, product);
    });
  }

  @override
  Widget suggestionsHistory(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          cardWidget(context, controller.products[index]),
      itemCount: (controller.products.length),
    );
  }

  @override
  Widget filterWidget() {
    return InkWell(
      onTap: controller.onFilterOnClick,
      child: Padding(
        padding:
            EdgeInsets.only(right: AppDimens.dimen16, left: AppDimens.dimen10),
        child: UiApi.assetImage(
          AssetsConfig.filter2,
          height: AppDimens.dimen16,
          width: AppDimens.dimen16,
        ),
      ),
    );
  }

  @override
  void onClose(BuildContext context) {
    close(context, const ProductModel());
    controller.products.clear();
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  Widget? loadingWidget() {
    return UiApi.loader();
  }
}
