import 'dart:collection';
import 'dart:io';

import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/remote/base/base_response_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ApiInterface {
  Future<void> generateGuestOtp(HashMap<String, Object> params,
      Function(BaseResponseModel response) callBack);

  Future<void> signUpGuestUser(HashMap<String, Object> params,
      Function(BaseResponseModel response) callBack);

  ///Sign up user onto the Prime platform
  ///@param [params]
  ///[params] is a body
  Future<void> signUpCustomer(HashMap<String, Object> params,
      Function(BaseResponseModel response) callBack);

  ///Sign up user onto the Prime platform
  ///@param [params]
  ///[params] is a body
  Future<void> updateProfileDetails(HashMap<String, Object> params,
      Function(BaseResponseModel response) callBack);

  ///Verify the 6-digit code sent to verify phone number during customer registration
  ///@param[params]
  Future<void> verifyCode(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Verify the 6-digit code sent to verify phone number during customer registration
  ///@param[params]
  Future<void> verifySecurityPin(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Verify the 6-digit code sent to verify phone number during customer registration
  ///@param[params]
  Future<void> verifyWalletCode(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Resend verification code to phone number in cases where the code expired or was not delivered
  ///@param
  Future<void> resendVerificationsCode(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Resend verification code to phone number in cases where the code expired or was not delivered
  ///@param
  Future<void> resendWalletVerificationsCode(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Login into the prime app using already registered credentials
  ///@param [params]
  ///[params] should have both username and password
  Future<void> login(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Login into the prime app using already registered credentials
  ///@param [params]
  ///[params] should have both username and password
  Future<void> guestUserLogin(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Login into the prime app using already registered credentials
  ///@param [params]
  ///[params] should have both username and password
  Future<void> signOut(HashMap<String, Object> params,
      Function(BaseResponseModel? response) callback);

  ///Login into the prime app using already registered credentials
  ///@param [params]
  ///[params] should have both username and password
  Future<void> resetPassword(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Set new Security Pin ontop of user credentials
  ///@param [param]
  Future<void> setSecurityPin(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Get user details
  ///
  Future<void> getUserDetails(Function(BaseResponseModel response) callback);

  ///Get the list of menu categories
  Future<void> getMenuCategories(Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> checkoutToCart(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getPaymentAccounts(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> makePaymentOfCard(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getListOfCards(Map<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getPublishedCardsOnePerMerchant(Map<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> filterPublishCards(Map<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getListOfPromotionalCards(Map<String, dynamic> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> addCardsToCart(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> addCardsToFavorite(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getFavoriteCards(Map<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getFavoriteMerchants(
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> addPaymentAccount(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getCardsInCart(Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getListOfPaymentsWallets(
      Function(BaseResponseModel response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> getWalletTypes(Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> sendFeedback(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> sendFcmToken(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> verifyUserPhone(
      String userId, Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> getUsersSavedQuestions(
      int userId, Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> getSecurityQuestions(
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> setNewSecurityQuestions(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> setNewPassword(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> verifyAnswerToQuestion(HashMap<String, Object> params,
      Function(BaseResponseModel? response) callback);

  ///Send feedback from app to the backend
  Future<void> getBoughtCards(Map<String, Object> params, WalletType type,
      bool showProgress, Function(BaseResponseModel response) callback);

  ///Search for cards using
  Future<List<PrimeCardModel>> searchCardsAndMerchant(String filter);

  ///Send feedback from app to the backend
  Future<void> deletePaymentWallet(
      int walletId, Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> getAdverts(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> reGiftCard(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> getGiftedCard(Map<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> redeemCard(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> removeItemFromCart(
      int cardId, int cartId, Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> clearCart(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> uploadFile(
      File file, Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> checkAppUpdate(Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> getPrimeWalletDetails(
      Function(BaseResponseModel response) callback);

  ///Send feedback from app to the backend
  Future<void> fundPrimeWallet(int id, Function(BaseResponseModel) callback);

  ///View all payment transactions of user
  Future<void> getPaymentTransactions(
      Function(BaseResponseModel response) callback);

  ///View all payment transactions of user
  Future<void> getRedemptionTransactions(
      int page, Function(BaseResponseModel response) callback);

  ///View all payment transactions of user
  Future<void> cancelTransactions(
      String id, Function(BaseResponseModel response) callback);

  ///View all payment transactions of user
  Future<void> sendGiftCardFeedback(dynamic params, int giftId,
      Function(BaseResponseModel response) callback);

  ///View all payment transactions of user
  Future<void> sendCardsForEFund(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///View all payment transactions of user
  Future<void> payForEFund(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///View all payment transactions of user
  Future<void> getDetailsOfCardAccount(
      String id, Function(BaseResponseModel response) callback);

  ///Rate a merchant based on his/her service after a redemption
  ///@param[params]
  Future<void> rateMerchant(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Rate a merchant based on his/her service after a redemption
  ///@param[params]
  Future<void> getMerchantRatings(
      int merchantId, Function(BaseResponseModel response) callback);

  ///Claim a 16-digit gift card outside a user's account
  ///This same can be used to claim a coupon gifted to a user by someone
  ///@param[params]
  Future<void> claimCoupon(HashMap<String, Object> param, bool isPromoCode,
      Function(BaseResponseModel response) callback);

  Future<void> verifyCouponClaimCode(HashMap<String, Object> param,
      bool isPromoCode, Function(BaseResponseModel response) callback);

  Future<void> getNotifications(Function(BaseResponseModel response) callback);

  Future<void> getNearByMerchants(Map<String, Object> params,
      Function(BaseResponseModel response) callback);

  Future<void> sendUerOtp(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  Future<void> verifyUserOtp(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  Future<void> deleteAccount(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  Future<void> changePhoneNumber(HashMap<String, Object> params,
      Function(BaseResponseModel response) callback);

  ///Create an event or calendar
  ///@param[params]
  Future<void> createEvent(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  ///Get a list of event or calendar
  ///@param[params]
  Future<void> getListOfEvents(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  ///Update an event or calendar
  ///@param[params]
  Future<void> updateAnEvents(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  ///Delete an event or calendar
  ///@param[params]
  Future<void> deleteAnEvents(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  Future<void> commentOnEFund(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  ///------------------------------------- M A R K E T  P L A C E -----------------------------------
  ///
  /// SHOPS ------------------------------------------------------------------
  ///
  ///Get List of Shops with their last 3 updated items
  Future<void> fetchShopsWithProducts(
      int page, Function(BaseResponseModel response) callback);

  ///Fetch all shops we have on the platform
  Future<void> fetchAllShops(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  ///Fetch all products of a particular shop
  Future<void> fetchAllProductsOfAShop(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  ///PRODUCTS -----------------------------------------------------------------

  Future<void> fetchPurchasedAndGiftedCards(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  Future<void> fetchProductsFromAllShops(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  Future<void> fetchProductCategories(
      int page, Function(BaseResponseModel response) callback);

  Future<void> fetchProductDetails(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  Future<void> makePaymentOfProduct(
      HashMap<String, Object> param, Function(BaseResponseModel) callback);

  Future<void> saveProductsToCart(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  Future<void> createAddress(HashMap<String, Object> param,
      Function(BaseResponseModel response) callback);

  Future<void> fetchProductsCart(Function(BaseResponseModel response) callback);

  Future<void> updateProductsCart(
      HashMap<String, Object> param, Function(BaseResponseModel) callback);

  Future<void> removeProductCartItem(
      HashMap<String, Object> param, Function(BaseResponseModel) callback);

  Future<void> fetchPaymentOptions(
      Function(BaseResponseModel response) callback);

  Future<void> fetchOrders(int page, Function(BaseResponseModel) callback);

  Future<void> cancelAnOrder(
      String reference, Function(BaseResponseModel) callback);

  Future<void> fetchDeliveryAddress(
      int page, Function(BaseResponseModel) callback);

  Future<void> fetchSingleShopAndProducts(
      int shopId, Function(BaseResponseModel) callback);

  Future<void> clearProductClear(
      int cartId, Function(BaseResponseModel) callback);

  Future<void> sendConfirmationOtp(
      HashMap<String, Object> param, Function(BaseResponseModel) callback);

  Future<void> fetchOrderPayments(
      HashMap<String, Object> param, Function(BaseResponseModel) callback);

  // Future<void> fetchTravelTimeAndDistance(
  //     LatLng l1, LatLng l2, Function(BaseResponseModel) callback);

  // Future<List<T>> fetchData<T>(
  //     {required String url, HashMap<String, Object>? param});

  Future<void> fetchDiscountedProducts(
      HashMap<String, Object> param, Function(BaseResponseModel) callback);

  Future<void> addProductToWishList(
      HashMap<String, Object> param, Function(BaseResponseModel) callback);

  Future<void> addFunds(
      HashMap<String, Object> param, Function(BaseResponseModel) callback);
}
