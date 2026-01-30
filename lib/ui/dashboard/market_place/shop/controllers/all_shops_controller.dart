import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/controller/market/shops_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/data/model/remote/suggestion.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/places_picker_api.dart';
import 'package:primecustomer/res/ui_helpers/shops_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/ui/dashboard/market_place/basket/cart_basket_screen.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/screens/product_details_screen.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/screens/search_product_delegate.dart';
import 'package:primecustomer/ui/dashboard/market_place/shop/screens/merchant_store_page.dart';
import 'package:primecustomer/ui/dashboard/market_place/shop/screens/search_shop_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/remote/category_model.dart';

class AllShopsController extends BaseController {
  Rx<Suggestion> selectedAddress = prefUtils.getDefaultLocation().obs;

  ///SHOPS
  RxList<ShopModel> listOfShops = RxList<ShopModel>();
  RxList<ShopModel> discountShops = RxList<ShopModel>();
  RxList<ShopModel> shopsWithProducts = RxList<ShopModel>();

  ///PRODUCTS
  RxList<ProductModel> products = RxList<ProductModel>();
  RxList<ProductModel> discountedProducts = RxList<ProductModel>();
  RxList<ProductModel> recommendedProducts = RxList<ProductModel>();

  ShopsController shopsController = ShopsController();
  ProductsController productsController = ProductsController();
  ShopsApi shopsApi = ShopsApi();
  ServiceInjectors serviceInjectors = ServiceInjectors();

  ///Menu categories list here
  RxList<CategoryModel> menuCatList = RxList<CategoryModel>();
  CategoryModel? selectedCategory;

  ///Loaders
  RxBool isLoadingMore = false.obs;
  RxBool isLoadingMoreShopsWithProducts = false.obs;
  RxBool isDoneLoading = false.obs;
  RxBool isLoadingCurrentAddress = false.obs;
  RxBool isDoneLoadingShopsWithProducts = false.obs;

  ///Scroll Controller
  ScrollController scrollController = ScrollController();
  bool hasStartedApiCall = false;
  int page = 1;

  ///Product Loaders
  RxBool isLoadingMoreProducts = false.obs;
  RxBool isDoneLoadingProducts = false.obs;
  RxBool isDoneLoadingDiscountedProducts = false.obs;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    shopsController.setContext(context);
    productsController.setContext(context);
  }

  @override
  void onInit() {
    super.onInit();
    listenToScroll();
  }

  Future<void> initData({bool refresh = false}) async {
    if (!refresh) {
      await Future.delayed(const Duration(milliseconds: 180));
      await _getCurrentLocation();
    }
    await productsController.fetchProductCategories(categoryList: menuCatList);
    await fetchDiscountedProducts(refresh: refresh);
    await fetchAllShops(refresh: refresh);
    await fetchRandomProducts(refresh: refresh);
  }

  ///Re-Fetch all data from api when user searches or picks a new location
  Future<void> reFetchData() async {
    // await productsController.fetchProductCategories(categoryList: menuCatList);
    await fetchDiscountedProducts();
    await fetchAllShops();
    await fetchRandomProducts();
    await fetchShopsWithProducts();
  }

  ///Listener to scrolling the items on the page
  void listenToScroll() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!hasStartedApiCall) {
          page++;

          await fetchRandomProducts(page: page);
        }
      }
    });
  }

  ///Fetch list of Products from all shops
  Future<void> fetchRandomProducts({
    int page = 1,
    bool refresh = false,
  }) async {
    await productsController.fetchProductsFromAllShops(
      page: page,
      products: products,
      isDoneLoading: isDoneLoadingProducts,
      isLoadingMore: isLoadingMore,
      refresh: refresh,
    );
  }

  ///Fetch list of discounted products from all shops
  Future<void> fetchDiscountedProducts({
    int page = 1,
    bool refresh = false,
    bool shuffle = true,
  }) async {
    await productsController.fetchProductsWithDiscount(
      page: page,
      products: discountedProducts,
      isDoneLoading: isDoneLoadingDiscountedProducts,
      refresh: refresh,
      shuffle: shuffle,
    );

    discountShops.clear();

    for (var prod in discountedProducts) {
      addShopWithDiscount(prod);
    }
  }

  ///Fetch list of Shops with their sample products
  Future<void> fetchShopsWithProducts({
    int page = 1,
    bool refresh = false,
  }) async {
    await shopsController.fetchShopsWithSampleProducts(
      page: page,
      shops: shopsWithProducts,
      isDoneLoading: isDoneLoadingShopsWithProducts,
      isLoadingMore: isLoadingMoreShopsWithProducts,
      refresh: refresh,
    );
  }

  Future<void> addShopWithDiscount(ProductModel prod) async {
    int index = discountShops.indexWhere((s) => s.code == prod.shop.code);
    if (index < 0) {
      discountShops.add(prod.shop);
    }
  }

  void onGoToCart() {
    NavApi.fireTarget(CartBasketScreen());
  }

  ///Retrieve the current location of user
  Future<void> _getCurrentLocation() async {
    isLoadingCurrentAddress.value = true;
    selectedAddress.value =
        await ServiceInjectors().geolocationApi.getCurrentLocation();
    isLoadingCurrentAddress.value = false;
  }

  void onPickAddress() {
    PlacesPickerApi.searchLocation((address) async {
      selectedAddress.value = address;
      await reFetchData();
    });
  }

  void onFilterOnClick() {
    DialogsApi.showBottomSheet();
  }

  Future<void> fetchAllShops({
    bool refresh = false,
    int page = 1,
  }) async {
    await shopsController.fetchAllShops(
      page: page,
      shopList: listOfShops,
      isDoneLoading: isDoneLoading,
      latitude: selectedAddress.value.latitude,
      longitude: selectedAddress.value.longitude,
    );
  }

  void onProductOnTap(BaseObject obj) {
    NavApi.fireTarget(ProductDetailsScreen(), model: obj, call: () {
      productsController.updateProductList(products);
    });
  }

  onAddToBasket(BaseObject obj) {
    print("object");
    serviceInjectors.cartService.addProductToBasketPerShop(obj as ProductModel);
  }

  void onShopClicked(ShopModel shop) {
    NavApi.fireTarget(MerchantStorePage(), model: shop);
  }

  Future<void> onSearchShop() async {
    final ShopModel? shop = await showSearch(
      context: mContext!,
      delegate: SearchShopDelegate(),
    );

    if (shop != null && shop.name.isNotEmpty) {
      onShopClicked(shop);
    }
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

  ///Pop up a Love/favorite emoji as feedback to the onClick
  void onFavoriteOnTap(BaseObject p) {
    UiApi.pop(mContext!, "❤", icon: Icons.favorite, done: () async {
      await addProductToWishList(p as ProductModel);
    });
  }

  ///Add a product to a wishlist
  Future<void> addProductToWishList(ProductModel p) async {
    HashMap<String, Object> param = HashMap();

    return webService?.addProductToWishList(param, (resp) {
      productsController.onFavoriteOnTap(p, ProductsController.productsOfAShop);
      productsController.onFavoriteOnTap(p, products);
    });
  }

  void onMenuSelected(CategoryModel model) async {
    menuCatList.value = menuCatList
        .map((e) => e.copyWith(isSelected: e.code == model.code))
        .toList();
    selectedCategory = model;

    await reFetchData();
  }
}
