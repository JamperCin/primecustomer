import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/ui/dashboard/market_place/basket/cart_basket_screen.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/screens/product_details_screen.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/screens/search_product_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shops_controller.dart';

class MoreProductsController extends BaseController {
  ProductsController productsController = ProductsController();
  RxList<ProductModel> products = RxList<ProductModel>();
  RxList<ShopModel> stores = RxList<ShopModel>();
  RxBool isDoneLoadingShops = false.obs;
  ShopsController shopsController = ShopsController();
  ServiceInjectors serviceInjectors = ServiceInjectors();

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int initialPosition = 1;
  RxBool isLoadingMore = false.obs;
  bool hasStartedApiCall = false;

  @override
  setContext(BuildContext context) {
    super.setContext(context);
    productsController.setContext(context);
    shopsController.setContext(context);
  }

  @override
  void onInit() {
    super.onInit();
    listenToScroll();
  }

  void listenToScroll() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!hasStartedApiCall) {
          initialPosition++;

          fetchProductsFromAllShops(page: initialPosition);
        }
      }
    });
  }

  ///Initialise data for usage by this controller
  Future<void> onInitData() async {
    initialPosition = 1;
    isDoneLoadingShops.value = false;
    products.clear();
    await Future.delayed(const Duration(milliseconds: 180));

    await fetchProductsFromAllShops();
  }

  ///Fetch list of products from various shops
  Future<void> fetchProductsFromAllShops({
    int page = 1,
    bool refresh = false,
  }) async {
    initialPosition = page;
    await productsController.fetchProductsFromAllShops(
      page: initialPosition,
      products: products,
      isDoneLoading: isDoneLoadingShops,
      isLoadingMore: isLoadingMore,
      refresh: refresh,
    );
  }

  void onGoToCart() {
    NavApi.fireTarget(CartBasketScreen());
  }

  void onProductOnTap(BaseObject obj) {
    NavApi.fireTarget(ProductDetailsScreen(), model: obj);
  }

  Future<void> onSearchProduct() async {
    final ProductModel? product = await showSearch(
      context: mContext!,
      delegate: SearchProductDelegate(),
    );

    if (product != null && product.code.isNotEmpty) {
      onProductOnTap(product);
    }
  }

  onAddProductToBasket(BaseObject prod) {
    serviceInjectors.cartService
        .addProductToBasketPerShop(prod as ProductModel);
  }

  void onViewItemsInBasket() {
    NavApi.fireTarget(CartBasketScreen());
  }
}
