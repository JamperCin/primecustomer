import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/controller/market/shops_controller.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/screens/more_products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/local/base_object.dart';
import '../../data/model/remote/category_model.dart';
import '../../ui/dashboard/market_place/basket/cart_basket_screen.dart';
import '../../ui/dashboard/market_place/products/screens/product_details_screen.dart';
import '../../ui/dashboard/market_place/shop/screens/merchant_store_page.dart';

class MarketPlaceHomeController extends BaseController {
  ProductsController productsController = ProductsController();
  ShopsController shopsController = ShopsController();

  ///Menu categories list here
  RxList<CategoryModel> menuCatList = RxList<CategoryModel>();

  RxList<ShopModel> stores = RxList<ShopModel>();
  RxList<ProductModel> products = RxList<ProductModel>();
  RxBool isDoneLoadingShops = false.obs;

  //Total items picked in terms of Quantity
  RxInt totalQuantity = 0.obs;

  //Menu list for display
  RxList<DictionaryModel> menuList = [
    DictionaryModel(
        key: 'market_place', value: 'Marketplace', selected: true.obs),
    DictionaryModel(key: 'feed', value: 'Feed'),
    DictionaryModel(key: 'live_shop', value: 'Live Shop'),
  ].obs;

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int initialPosition = 1;
  final RxBool isLoadingMore = false.obs;
  bool hasStartedApiCall = false;

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

          await fetchProducts(page: initialPosition);
        }
      }
    });
  }

  @override
  setContext(BuildContext context) {
    super.setContext(context);
    productsController.setContext(context);
    shopsController.setContext(context);
  }

  ///Initialise data for usage by this controller
  Future<void> onInitData() async {
    await Future.delayed(const Duration(milliseconds: 180));

    await productsController.fetchProductCategories(categoryList: menuCatList);

    await shopsController.fetchAllShops(shopList: stores);

    await fetchProducts();
  }

  ///Fetch list of products
  Future<void> fetchProducts({
    int page = 1,
    bool refresh = false,
  }) async {
    initialPosition = page;
    await shopsController.fetchShopsWithSampleProducts(
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

  ///OnClick listener to the top menu items
  void onMenuTapped(DictionaryModel e) {}

  void onProductOnTap(BaseObject obj) {
    NavApi.fireTarget(ProductDetailsScreen(), model: obj, call: () {
      productsController.updateProductList(products);
    });
  }

  void onGoToMoreProducts({BaseObject? obj}) {
    NavApi.fireTarget(MoreProductsScreen(), model: obj);
  }

  void onFilterOnClick() {}

  onAddToBasket(BaseObject obj) {
    productsController.onAddProductToCart(
      obj as ProductModel,
      products: products,
    );
  }

  void onGoToStore(ShopModel store) {
    NavApi.fireTarget(MerchantStorePage(), model: store);
  }
}
