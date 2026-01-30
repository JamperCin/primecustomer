import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/controller/market/shops_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/ui/base/base_image_viewer_screen.dart';
import 'package:primecustomer/ui/dashboard/market_place/basket/cart_basket_screen.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/screens/search_product_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/remote/category_model.dart';
import '../../../../../data/model/remote/shop_details_model.dart';

class ShopDetailsController extends BaseController {
  ProductsController productsController = ProductsController();
  ShopsController shopsController = ShopsController();

  ///Shop details model defined here
  Rx<ShopModel> selectedShop = const ShopModel().obs;
  Rx<ShopDetailModel> shopDetailModel = const ShopDetailModel().obs;

  ///Menu categories list here
  RxList<CategoryModel> menuCatList = RxList<CategoryModel>();
  RxList<CategoryModel> mainMenuCatList = RxList<CategoryModel>();

  RxList<String> workingDays = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'].obs;

  ///List Products in a shop
  RxList<ProductModel> productsList = RxList<ProductModel>();

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int initialPosition = 1;
  RxBool isLoadingMore = false.obs;
  RxBool isDoneLoading = false.obs;
  bool hasStartedApiCall = false;

  ///Discounted Products
  RxList<ProductModel> discountedProducts = RxList<ProductModel>();
  RxBool isDoneLoadingDiscountedProducts = false.obs;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    productsController.setContext(context);
    shopsController.setContext(context);
  }

  Future<void> clearData() async {
    selectedShop.value = const ShopModel();
    shopDetailModel.value = const ShopDetailModel();
    mainMenuCatList.clear();
    menuCatList.clear();
    productsList.clear();
    discountedProducts.clear();
  }

  ///Init data
  Future<void> initData({required ShopModel shop}) async {
    selectedShop.value = shop;

    await fetchProductCategories();
    await updateMenuList();
    await fetchShopDetailsAndProducts(selectedShop.value.id);
    await fetchDiscountedProducts();
    discountedProducts.add(discountedProducts.first);
    discountedProducts.add(discountedProducts.first);

    print("Size == ${discountedProducts.length}");
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
      shopId: selectedShop.value.id,
    );
  }

  ///Fetch Categories of Products
  Future<void> fetchProductCategories() async {
    await productsController.fetchProductCategories(
        categoryList: mainMenuCatList);
  }

  ///Fetch the details of a single shop and its associated products
  Future<void> fetchShopDetailsAndProducts(int shopId) async {
    await shopsController.getShopDetails(
      shopId: shopId,
      shopDetailModel: shopDetailModel,
    );
  }

  Future<void> updateMenuList({CategoryModel? cat}) async {
    menuCatList.clear();

    mainMenuCatList.forEach((element) {
      menuCatList.add(element.copyWith(
        isSelected: cat == null
            ? element.id == mainMenuCatList.first.id
            : element.id == cat.id,
      ));
    });

    await fetchProductsByCategory(cat ?? mainMenuCatList.first);
  }

  ///Fetch products by category ID
  Future<void> fetchProductsByCategory(CategoryModel cat) async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("category_id", () => '${cat.id}');
    param.putIfAbsent("merchant_id", () => '${selectedShop.value.id}');

    isDoneLoading.value = false;
    productsList.clear();

    webService?.fetchAllProductsOfAShop(param, (response) {
      isDoneLoading.value = true;
      productsList.addAll(response.data?.shopProducts ?? []);
    });
  }

  ///View shop's more information
  void onViewShopMoreInfo() {}

  ///Onclick of a menu happens for here
  Future<void> onMenuOnClick(CategoryModel cat) async {
    await updateMenuList(cat: cat);
  }

  void onAddRemoveCart(BaseObject baseObject, int count) async {
    ProductModel prod = baseObject as ProductModel;
    await productsController.onAddProductToCart(
      prod,
      count: count,
      canClear: false,
      shouldAddToCart: true,
    );

    int savedIndex = productsList.indexWhere((e) => e.code == prod.code);
    prod = prod.copyWith(count: count);
    if (savedIndex != -1) {
      productsList.removeAt(savedIndex);
      productsList.insert(savedIndex, prod);
    }
    print("index ${savedIndex}");
  }

  void onGoToCheckOut() {
    NavApi.fireTarget(CartBasketScreen());
  }

  void onProductOnTap(BaseObject product) {
    ProductModel prod = product as ProductModel;

    DialogsApi.showBottomSheet(
      containerSize: SizeConfig.screenHeight * 0.8,
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.white,
      mainChild: BaseImageViewerScreen(
        images: prod.images,
        title: prod.name,
      ),
    );
  }

  Future<void> onSearchProduct() async {
    final ProductModel? shop = await showSearch(
      context: mContext!,
      delegate: SearchProductDelegate(),
    );

    if (shop != null && shop.name.isNotEmpty) {
      onProductOnTap(shop);
    }
  }
}
