import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/ui/dashboard/market_place/basket/cart_summary_screen.dart';
import 'package:primecustomer/ui/dashboard/market_place/products/screens/more_products_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartCheckOutController extends BaseController {
  ProductsController productsController = ProductsController();
  ServiceInjectors serviceInjectors = ServiceInjectors();
  RxList<ProductModel> products = RxList<ProductModel>();
  RxBool isLoadingMoreProducts = false.obs;
  RxBool isDoneLoadingProducts = false.obs;

  ///Fetch list of Products from all shops
  Future<void> fetchOtherProductsFromSameShop({
    int page = 1,
    bool refresh = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 180));
    if (serviceInjectors.cartService.productsInBasket.isNotEmpty) {
      await productsController.fetchProductsOfAShop(
        page: page,
        products: products,
        isDoneLoading: isDoneLoadingProducts,
        isLoadingMore: isLoadingMoreProducts,
        refresh: refresh,
        shopId: serviceInjectors.cartService.productsInBasket.first.shop.id,
      );
    }
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    productsController.setContext(context);
  }

  void onCheckOutOnClick() {
    DialogsApi.alertDialogYesNo(
        title: 'Save Selected Product(s) To Cart?',
        mess:
            'Are you sure you want to save the selected product(s) to your cart?',
        onYesTap: () {
          productsController.createCart(call: (reps) {
            onGoToCartSummary();
          });
        });
  }

  void onGoToCartSummary() {
    NavApi.fireTarget(CartSummaryScreen());
  }

  void onGoToMoreProducts() {
    NavApi.fireTarget(MoreProductsScreen());
  }

  void onAddRemoveCart(BaseObject prod) {
    serviceInjectors.cartService.updateQuantityOfProduct(prod as ProductModel);
  }

  onAddProductToBasket(BaseObject prod) {
    serviceInjectors.cartService
        .addProductToBasketPerShop(prod as ProductModel);
  }
}
