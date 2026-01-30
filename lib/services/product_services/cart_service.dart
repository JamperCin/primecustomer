import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/extensions/string_extension.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartService {
  RxList<ProductModel> productsInBasket = RxList();
  RxInt totalQuantity = 0.obs;
  RxString totalOrderAmount = "0.0".obs;
  String currency = "GHS";

  ///Add a selected product to your basket for later checkout.
  /// You can create an order per a shop at a time. You cannot make an order from different shops at a time.
  ///
  ///1. First of all check if the [productsInBasket] is empty then begin to freely add product
  ///2. Check if [productsInBasket] is not empty, then we check the parent id of product [ShopModule] ie. if product belongs to the same shop
  ///3. If product belongs to a different shop then we ask user to proceed to cancel existing cart and create a new list of [cart] or continue with old carts
  Future<void> addProductToBasketPerShop(ProductModel product) async {
    product = product.copyWith(count: 1);

    //check if list is empty then add first item
    if (productsInBasket.isEmpty) {
      productsInBasket.add(product);
      await _arithmeticOperations();
      SnackBarApi.snackBarToast(
        "${product.name.capitalizeFirstLetters()} has been added to your basket",
        title: "Product Added",
        bgColor: AppColors.primaryGreenColor,
      );
      return;
    }

    //Check if product is already added then ignore
    bool productAlreadyAdded = await isProductExist(product);

    if (productAlreadyAdded) {
      SnackBarApi.snackBarToast(
        "${product.name.capitalizeFirstLetters()} has already been added to your basket.",
        title: "Product already added",
        bgColor: AppColors.red,
        icon: Icons.dangerous,
      );
      return;
    }

    //Check if subsequent products belongs to same shop
    //Else we clear previous order and start new order.
    //This is to make sure we purchase from one shop at an time and not multiple shops
    bool productBelongsToSameShop = await isProductBelongsToShop(product);

    if (!productBelongsToSameShop) {
      String shopName =
          productsInBasket.first.shop.name.capitalizeFirstLetters();
      DialogsApi.alertDialogYesNo(
          title: "Start a new order?",
          mess:
              "You already have products added from $shopName. To proceed, this will clear your $shopName's order.",
          negativeButtonText: "Cancel",
          positiveButtonText: "Confirm",
          onYesTap: () {
            _clearCartToCreateNewCart(product);
          });
      return;
    }

    //If product belongs to same shop, add product and perform the necessarily calculations
    productsInBasket.add(product);
    productsInBasket.value = productsInBasket.toSet().toList();
    await _arithmeticOperations();
    SnackBarApi.snackBarToast(
      "${product.name} has been added to your basket",
      title: "Product Added",
      bgColor: AppColors.primaryGreenColor,
    );
  }

  ///Check if Product exist in the basket already
  ///@return [bool]
  Future<bool> isProductExist(ProductModel prod) async {
    return productsInBasket.any((p) => p.code == prod.code);
  }

  ///Check if Product belongs to the same shop
  ///@return [bool]
  Future<bool> isProductBelongsToShop(ProductModel prod) async {
    return productsInBasket.first.shop.id == prod.shop.id;
  }

  ///Perform the arithmetic operation after a product has been added or a quantity has been updated
  ///
  ///Calculate the following
  ///[totalQuantity] Total quantity of products ie, adding all quantities per each product
  ///[totalOrderAmount] Total order amount ie. adding all quantity per product multiplied by price
  ///
  Future<void> _arithmeticOperations() async {
    totalQuantity.value =
        productsInBasket.fold(0, (int sum, item) => sum + item.count);
    double amt =
        productsInBasket.fold(0.0, (double s, i) => s + (i.count * i.price));
    totalOrderAmount.value = NumberUtils.moneyFormatDouble(amt, decPlace: 2);
  }

  ///Clear or Remove your previous order to create a new cart
  Future<void> _clearCartToCreateNewCart(ProductModel product) async {
    productsInBasket.clear();
    productsInBasket.add(product);
    await _arithmeticOperations();
    SnackBarApi.snackBarToast(
      "A new order has been created for ${product.name}",
    );
  }

  ///Increase or Decrease the [ProductModel.quantity] of a selected product already added in your basket for later checkout
  ///1. First of all check if the [productsInBasket] has that product
  ///2. If product exist, proceed to update the quantity
  Future<void> updateQuantityOfProduct(ProductModel product) async {
    if (product.count <= 0) {
      _confirmProductRemoval(product);
      return;
    }

    productsInBasket.value = productsInBasket
        .map((p) => p.copyWith(
            count: (p.code == product.code) ? product.count : p.count))
        .toList();

    await _arithmeticOperations();
  }

  ///Use this method to add a product if does not exist in the basket or rather update the quantity if it exist already
  Future<void> addProductOrUpdateQuantity(ProductModel product) async {
    bool productExist = await isProductExist(product);
    if (productExist) {
      updateQuantityOfProduct(product);
    } else {
      addProductToBasketPerShop(product);
    }
  }

  ///Confirm the removal of product from your basket
  ///Upon confirmation, remove product from basket and perform the necessarily calculations and give feedback to user
  void _confirmProductRemoval(ProductModel product) {
    DialogsApi.alertDialogYesNo(
        title: "Confirm removal of ${product.name.capitalizeFirstLetters()}",
        mess: "Are you sure you to remove this product from your basket?",
        positiveButtonText: "Confirm",
        onYesTap: () async {
          await _deleteProductFromBasket(product);
        });
  }

  ///Delete product from the basket and update the total basket cart amount
  ///@param [product]
  Future<void> _deleteProductFromBasket(ProductModel product) async {
    productsInBasket.removeWhere((e) => e.code == product.code);
    await _arithmeticOperations();
    SnackBarApi.snackBarToast(
      "${product.name} has been removed from your basket successfully.",
      title: "Product Removed",
    );
  }
}
