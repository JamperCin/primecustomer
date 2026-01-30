import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_details_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:get/get.dart';

class ShopsController extends BaseController {
  static RxList<ShopModel> mainShopList = <ShopModel>[].obs;

  ///Fetch all shops on the platform with pagination
  Future<void> fetchAllShops({
    required RxList<ShopModel> shopList,
    int page = 1,
    List<int>? shopIds,
    RxBool? isDoneLoading,
    RxBool? isLoadingMore,
    bool refresh = false,
    double? latitude,
    double? longitude,
  }) async {
    page = refresh ? 1 : page;

    if (!refresh) {
      if (page == 1) {
        shopList.clear();
        mainShopList.clear();
        isDoneLoading?.value = false;
      } else {
        isLoadingMore?.value = true;
      }
    }

    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("limit", () => "30");
    param.putIfAbsent("page", () => "$page");

    if (latitude != null) {
      param.putIfAbsent("latitude", () => "$latitude");
    }

    if (longitude != null) {
      param.putIfAbsent("longitude", () => "$longitude");
    }

    if (shopIds != null) {
      param.putIfAbsent("shop_ids[]", () => shopIds);
    }

    return webService?.fetchAllShops(param, (response) {
      if (refresh) {
        shopList.clear();
        mainShopList.clear();
      }

      if (page == 1) {
        isDoneLoading?.value = true;
      } else {
        isLoadingMore?.value = false;
      }
      shopList.addAll(response.data?.shops ?? <ShopModel>[]);
      mainShopList.addAll(response.data?.shops ?? <ShopModel>[]);
    });
  }

  ///Fetch the details of a single shop and some products in the shop
  Future<void> getShopDetails({
    required int shopId,
    required Rx<ShopDetailModel> shopDetailModel,
  }) async {
    return webService?.fetchSingleShopAndProducts(shopId, (response) {
      shopDetailModel.value = ShopDetailModel(
        shopProducts: response.data?.shopProducts ?? [],
        shopDetails: response.data?.shopDetails ?? const ShopModel(),
      );
    });
  }

  ///Fetch all shops and sample products they sell
  ///This has at least 3 of the latest products of the shop
  Future<void> fetchShopsWithSampleProducts({
    RxList<ShopModel>? shops,
    RxList<ProductModel>? products,
    int page = 1,
    required RxBool isDoneLoading,
    RxBool? isLoadingMore,
    bool refresh = false,
    double? latitude,
    double? longitude,
  }) async {
    if (!refresh) {
      if (page == 1) {
        shops?.clear();
        products?.clear();
        mainShopList.clear();
        isDoneLoading.value = false;
      } else {
        isLoadingMore?.value = true;
      }
    }

    await webService?.fetchShopsWithProducts(page, (response) {
      if (refresh) {
        shops?.clear();
        products?.clear();
        mainShopList.clear();
      }

      if (page == 1) {
        isDoneLoading.value = true;
      } else {
        isLoadingMore?.value = false;
      }

      shops?.addAll(response.data?.shops ?? <ShopModel>[]);
      mainShopList.addAll(response.data?.shops ?? <ShopModel>[]);

      if (products != null) {
        _filterAllProductsFromShops(
          response.data?.shops ?? <ShopModel>[],
          products: products,
        );
      }
    });
  }

  Future<void> _filterAllProductsFromShops(
    List<ShopModel> shops, {
    required RxList<ProductModel> products,
  }) async {
    if (shops.isNotEmpty) {
      shops.forEach((shop) => shop.latestProducts.forEach((prod) {
            prod = prod.copyWith(
              shopId: shop.id,
              shopName: shop.name,
              shopCode: shop.code,
              totalCustomerView:
                  prod.totalCustomerView == 0 ? 1 : prod.totalCustomerView,
            );

            int i = ProductsController.productsOfAShop
                .indexWhere((e) => e.code == prod.code);
            if (i < 0) {
              products.add(prod);
              ProductsController.productsOfAShop.add(prod);
            }
          }));
    }
  }
}
