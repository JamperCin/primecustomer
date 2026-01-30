import 'package:primecustomer/controller/view/near_by_merchant_model.dart';
import 'package:primecustomer/data/model/remote/account.dart';
import 'package:primecustomer/data/model/remote/address_model.dart';
import 'package:primecustomer/data/model/remote/advert_image_model.dart';
import 'package:primecustomer/data/model/remote/app_update_meta.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/category_model.dart';
import 'package:primecustomer/data/model/remote/customer.dart';
import 'package:primecustomer/data/model/remote/e_fund_request_model.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/data/model/remote/notification_model.dart';
import 'package:primecustomer/data/model/remote/payment_options.dart';
import 'package:primecustomer/data/model/remote/payments.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/data/model/remote/prime_cart_model.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/question.dart';
import 'package:primecustomer/data/model/remote/rating_model.dart';
import 'package:primecustomer/data/model/remote/shop_cart_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/data/model/remote/shop_payment_model.dart';
import 'package:primecustomer/data/model/remote/verified_token.dart';
import 'package:primecustomer/data/model/remote/wallet_model.dart';
import 'package:primecustomer/data/model/remote/wallet_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_logs.dart';
import 'orders_model.dart';

part 'data.freezed.dart';
part 'data.g.dart';

///
/// There are some inconsistencies in this file and I'll need some insights
/// into decide on what the final version would look like
///
/// As a temporary fix, I'm commenting out conflicting code.
///
@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'user')
    @JsonKey(name: 'signup_user')
    @Default(Customer())
    Customer signupUser,
    @JsonKey(name: 'verified_token')
    @Default(VerifiedToken())
    VerifiedToken verifiedToken,
    @Default('') String token,
    @Default('') String message,
    @JsonKey(name: 'new_code') @Default('') String certCode,
    @JsonKey(name: 'user_details') @Default(Customer()) Customer userDetails,
    @Default(Customer()) Customer customer,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<PrimeCardModel> cards,
    @Default('') String url,
    @JsonKey(name: 'payment_url') @Default('') String paymentUrl,
    @JsonKey(name: 'wallet_types') @Default([]) List<WalletType> walletTypes,
    @Default([]) List<WalletModel> wallets,
    @Default(PrimeCartModel()) PrimeCartModel cart,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @Default([]) List<Question> questions,
    @Default(WalletModel()) WalletModel wallet,
    @Default([]) List<AdvertImageModel> images,
    @Default(AppUpdateMeta()) AppUpdateMeta meta,
    @Default(Account()) Account account,
    @Default([]) List<RatingModel> ratings,
    @Default([]) List<NotificationModel> notifications,
    @JsonKey(name: "account_log")
    @Default(AccountLogs())
    AccountLogs accountLogs,
    @JsonKey(name: 'card_accounts') @Default([]) List<CardAccount> cardAccounts,
    @JsonKey(name: 'gift_logs') @Default([]) List<GiftedCard> giftCardsList,
    @Default([]) List<Payments> payments,
    //@JsonKey(name: "efund_requests")
    @JsonKey(name: "efund_request_groups")
    @Default([])
    List<EfundRequestModel> eFundRequests,
    @Default([]) List<PrimeCardModel> favourites,
    @JsonKey(name: "close_merchants")
    @Default([])
    List<NearByMerchantModel> nearByMerchants,
    @Default([]) List<ShopModel> shops,
    @Default([]) List<ProductModel> products,
    @JsonKey(name: 'discounted_products')
    @Default([])
    List<ProductModel> discountedProducts,
    @JsonKey(name: 'payment_options')
    @Default([])
    List<PaymentOptions> paymentOptions,
    @Default([]) List<OrderModel> orders,
    @JsonKey(name: "shop_cart")
    @Default(ShopCartModel())
    ShopCartModel shopCart,
    @JsonKey(name: 'shop_products')
    @Default([])
    List<ProductModel> shopProducts,
    @JsonKey(name: 'shop_payments')
    @Default([])
    List<ShopPaymentModel> shopPayments,
    @Default([]) List<AddressModel> addresses,
    @JsonKey(name: 'shop_details') @Default(ShopModel()) ShopModel shopDetails,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
