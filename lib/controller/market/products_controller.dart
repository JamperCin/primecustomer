import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:get/get.dart';

import '../../data/model/remote/category_model.dart';
import '../../data/model/remote/shop_model.dart';
import '../../utils/number_utils.dart';

class ProductsController extends BaseController {
  //Total Quantity of products selected to be added to the cart
  static RxInt totalQuantity = 0.obs;
  static RxString totalCartAmount = "0.00".obs;
  static RxList<ProductModel> productsOfAShop = <ProductModel>[].obs;
  static RxList<ProductModel> cartList = <ProductModel>[].obs;

  ///--------------- A P I s ----------------------------------

  ///Fetch all products which have discounts from all shops
  Future<void> fetchProductsWithDiscount({
    required RxList<ProductModel> products,
    int page = 1,
    required RxBool isDoneLoading,
    RxBool? isLoadingMore,
    bool refresh = false,
    bool shuffle = true,
    int? shopId,
    double? latitude,
    double? longitude,
  }) async {
    if (!refresh) {
      if (page == 1) {
        products.clear();
        isDoneLoading.value = false;
      } else {
        isLoadingMore?.value = true;
      }
    }

    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("limit", () => "20");
    param.putIfAbsent("page", () => "$page");
    if (shopId != null) {
      param.putIfAbsent("shop_id", () => "$shopId");
    }

    if (latitude != null) {
      param.putIfAbsent("latitude", () => "$latitude");
    }
    if (longitude != null) {
      param.putIfAbsent("longitude", () => "$longitude");
    }

    await webService?.fetchDiscountedProducts(param, (response) {
      if (refresh) {
        products.clear();
      }

      if (page == 1) {
        isDoneLoading.value = true;
      } else {
        isLoadingMore?.value = false;
      }

      products.addAll(response.data?.discountedProducts ?? []);
      if (shuffle) {
        products.shuffle();
      }
    });
  }

  ///Fetch Random products from all shops. This will return a list of products from may shops
  Future<void> fetchProductsFromAllShops({
    required RxList<ProductModel> products,
    int page = 1,
    required RxBool isDoneLoading,
    bool refresh = false,
    RxBool? isLoadingMore,
    List<String>? categoryIds,
    String? searchString,
    double? latitude,
    double? longitude,
  }) async {
    if (!refresh) {
      if (page == 1) {
        products.clear();

        isDoneLoading.value = false;
      } else {
        isLoadingMore?.value = true;
      }
    }

    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "20");
    if (categoryIds != null) {
      param.putIfAbsent("category_ids[]", () => categoryIds);
    }
    if (searchString != null) {
      param.putIfAbsent("search_string", () => searchString);
    }

    if (latitude != null) {
      param.putIfAbsent("latitude", () => "$latitude");
    }
    if (longitude != null) {
      param.putIfAbsent("longitude", () => "$longitude");
    }

    await webService?.fetchProductsFromAllShops(param, (response) {
      if (refresh) {
        products.clear();
      }

      if (page == 1) {
        isDoneLoading.value = true;
      } else {
        isLoadingMore?.value = false;
      }

      _filterAllProductsFromShops(
        products,
        shops: response.data?.shops ?? <ShopModel>[],
        responseProducts: response.data?.products ?? <ProductModel>[],
        page: page,
      );
    });
  }

  Future<void> _filterAllProductsFromShops(
    RxList<ProductModel> products, {
    List<ShopModel>? shops,
    List<ProductModel>? responseProducts,
    int? page,
  }) async {
    if (shops != null && shops.isNotEmpty) {
      shops.forEach((shop) => shop.latestProducts.forEach((prod) {
            prod = prod.copyWith(
              shopId: shop.id,
              shopName: shop.name,
              shopCode: shop.code,
              totalCustomerView:
                  prod.totalCustomerView == 0 ? 1 : prod.totalCustomerView,
            );
            products.add(prod);
            int i = productsOfAShop.indexWhere((e) => e.code == prod.code);
            if (i == -1) {
              productsOfAShop.add(prod);
            }
          }));
    } else if (responseProducts != null && responseProducts.isNotEmpty) {
      products.addAll(responseProducts);
      responseProducts.forEach((element) {
        int i = productsOfAShop.indexWhere((prod) => element.code == prod.code);
        if (i == -1) {
          productsOfAShop.add(element);
        }
      });
    }
  }

  ///Fetch all shops on the platform
  Future<void> fetchProductCategories({
    required RxList<CategoryModel> categoryList,
    int page = 1,
    RxBool? isDoneLoading,
    RxBool? isLoadingMore,
  }) async {
    if (page == 1) {
      categoryList.clear();
      isDoneLoading?.value = false;
    } else {
      isLoadingMore?.value = true;
    }

    return webService?.fetchProductCategories(page, (response) {
      if (page == 1) {
        isDoneLoading?.value = true;
      } else {
        isLoadingMore?.value = false;
      }
      categoryList.addAll(response.data?.categories ?? <CategoryModel>[]);
    });
  }

  Future<void> fetchProductsOfAShop({
    required RxList<ProductModel> products,
    required int shopId,
    int page = 1,
    required RxBool isDoneLoading,
    bool refresh = false,
    RxBool? isLoadingMore,
    List<String>? categoryIds,
    String? searchString,
  }) async {
    if (!refresh) {
      if (page == 1) {
        products.clear();

        isDoneLoading.value = false;
      } else {
        isLoadingMore?.value = true;
      }
    }

    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("page", () => "$page");
    param.putIfAbsent("limit", () => "20");
    param.putIfAbsent("merchant_id", () => "$shopId");
    if (categoryIds != null) {
      param.putIfAbsent("category_ids[]", () => categoryIds);
    }
    if (searchString != null) {
      param.putIfAbsent("search_string", () => searchString);
    }

    await webService?.fetchAllProductsOfAShop(param, (response) {
      if (refresh) {
        products.clear();
      }

      if (page == 1) {
        isDoneLoading.value = true;
      } else {
        isLoadingMore?.value = false;
      }

      products.addAll(response.data?.shopProducts ?? []);
      products.value =
          products.map((e) => e.copyWith(shop: ShopModel(id: shopId))).toList();

      products.forEach((element) {
        int i = productsOfAShop.indexWhere((prod) => element.code == prod.code);
        if (i == -1) {
          productsOfAShop.add(element);
        }
      });
    });
  }

  ///Create cart
  Future<void> createCart({required Function(BaseResponseModel) call}) async {
    List<HashMap> cart = [];
    ServiceInjectors().cartService.productsInBasket.forEach((prod) {
      HashMap<String, int> item = HashMap();
      item.putIfAbsent("product_id", () => prod.id);
      item.putIfAbsent("quantity", () => prod.count);
      cart.add(item);
    });

    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("description", () => "product cart");
    param.putIfAbsent("items", () => cart);

    webService?.saveProductsToCart(param, call);
  }

  ///------------------ O P E R A T I O N S -------------------------

  ///Add or Remove a product from the cart and perform some manipulations on the data
  ///This works on the - total quantity of products selected
  ///                  - Total amount of products selected
  ///                  - Update the main cart list
  ///                  - Updates the main products stream source
  ///                  - Updates the derivative products
  Future<ProductModel> onAddProductToCart(
    ProductModel prod, {
    RxList<ProductModel>? products,
    int count = 1,
    bool canClear = true,
    bool shouldAddToCart = false,
  }) async {
    bool isProductAlreadyAddedToCart = prod.count > 0;

    if (shouldAddToCart) {
      int savedIndex = cartList.indexWhere((e) => e.code == prod.code);
      if (savedIndex != -1) {
        cartList.add(prod);
      }
    }

    int parentIndex = productsOfAShop.indexWhere((e) => e.code == prod.code);
    int cartIndex = cartList.indexWhere((e) => e.code == prod.code);
    prod = prod.copyWith(count: count);

    if (count == 1 && isProductAlreadyAddedToCart && canClear) {
      prod = prod.copyWith(count: 0);
      cartList.removeWhere((e) => e.code == prod.code);
    } else if (count > 0) {
      if (cartIndex != -1) {
        cartList.removeAt(cartIndex);
        cartList.insert(cartIndex, prod);
      } else {
        cartList.add(prod);
      }
    } else {
      prod = prod.copyWith(count: 0);
      cartList.removeWhere((e) => e.code == prod.code);
    }

    if (parentIndex != -1) {
      productsOfAShop.removeAt(parentIndex);
      productsOfAShop.insert(parentIndex, prod);
    }

    products?.clear();
    products?.addAll(productsOfAShop);

    totalQuantity.value = cartList.fold(0, (int sum, item) => sum + item.count);
    double amt = cartList.fold(0.0, (double s, i) => s + (i.count * i.price));
    totalCartAmount.value = NumberUtils.moneyFormatDouble(amt, decPlace: 2);
    return prod;
  }

  ///Update product with the latest changes from the main Products Stream
  void updateProductList(RxList<ProductModel> products) {
    products.clear();
    products.addAll(productsOfAShop);
  }

  ///On
  void onFavoriteOnTap(ProductModel prod, RxList<ProductModel> list) {
    int parentIndex = list.indexWhere((e) => e.code == prod.code);
    prod = prod.copyWith(isFavorite: !prod.isFavorite);
    if (parentIndex != -1) {
      list.removeAt(parentIndex);
      list.insert(parentIndex, prod);
    }
  }
}
