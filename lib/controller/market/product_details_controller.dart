import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';
import 'package:get/get.dart';

import '../../data/model/remote/product_model.dart';
import '../../ui/dashboard/market_place/basket/cart_basket_screen.dart';
import '../../ui/dashboard/market_place/shop/screens/merchant_store_page.dart';

class ProductDetailsController extends BaseController {
  ProductsController productsController = ProductsController();
  Rx<ProductModel> selectedProduct = const ProductModel().obs;
  RxInt currentPodIndex = 0.obs;
  RxList<ProductModel> otherProducts = RxList<ProductModel>();
  final ServiceInjectors _serviceInjectors = ServiceInjectors();

  RxBool isDoneLoadingProducts = false.obs;
  RxString selectedSizeOfProduct = "".obs;
  RxString selectedColorOfProduct = "".obs;

  GlobalKey<AnimatorWidgetState> rateProductKey =
      GlobalKey<AnimatorWidgetState>();
  GlobalKey<AnimatorWidgetState> wishListKey = GlobalKey<AnimatorWidgetState>();
  RxBool isWishListed = false.obs;
  RxBool isRated = false.obs;

  ///Dummy data here
  List<String> sizesOfProduct = ["S", "M", "L", "XL", "XXL", "XXXL"];
  List<String> colorsOfProduct = [
    "FF7F50",
    "0D4A59",
    "#2E1047",
    "0E451A",
    "5D2CDA",
    "eef754"
  ];

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    productsController.setContext(context);
  }

  Future<void> initData(BaseObject object) async {
    _resetData();

    if (object is ProductModel) {
      selectedProduct.value = object;
    }

    List<String> categoryIds = [];
    selectedProduct.value.categories.forEach((e) => categoryIds.add("${e.id}"));
    await productsController.fetchProductsOfAShop(
      products: otherProducts,
      isDoneLoading: isDoneLoadingProducts,
      categoryIds: categoryIds,
      shopId: selectedProduct.value.shop.id,
    );
  }

  void _resetData() {
    isWishListed.value = false;
    isRated.value = false;
    selectedSizeOfProduct.value = "";
    selectedColorOfProduct.value = "";
    currentPodIndex.value = 0;
  }

  void onAddRemoveCart(BaseObject prod) {
    print("Value printed ${(prod as ProductModel).count}");
    _serviceInjectors.cartService.addProductOrUpdateQuantity(prod);
  }

  void onAddToWishlist() {
    wishListKey.currentState?.forward(from: -1.0);
    isWishListed.value = !isWishListed.value;
    // UiApi.pop(mContext!, "❤", icon: Icons.favorite, done: () {
    //   //  cardController?.favouriteMerchant(card, call: () {});
    // });
  }

  void onViewBasket() {
    NavApi.fireTarget(CartBasketScreen());
  }

  void goToMerchantShop() {
    NavApi.fireTarget(
      MerchantStorePage(),
      model: selectedProduct.value.shop,
    );
  }

  onAddProductToCart() async {
    _serviceInjectors.cartService
        .addProductToBasketPerShop(selectedProduct.value);
  }

  onAddToBasket(BaseObject obj) async {
    _serviceInjectors.cartService
        .addProductToBasketPerShop(obj as ProductModel);
  }

  onProductTapped(BaseObject obj) {
    _resetData();
    selectedProduct.value = obj as ProductModel;
  }

  void onSizeSelected(String size) {
    selectedSizeOfProduct.value = size;
  }

  void onColorSelected(String color) {
    selectedColorOfProduct.value = color;
  }

  void onRateProductOnClick() {
    rateProductKey.currentState?.forward();
    isRated.value = !isRated.value;
    // UiApi.pop(mContext!, "👍", done: () {
    //   //  cardController?.favouriteMerchant(card, call: () {});
    // });
  }
}
