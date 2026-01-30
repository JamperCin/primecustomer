// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
  signupUser: json['user'] == null
      ? const Customer()
      : Customer.fromJson(json['user'] as Map<String, dynamic>),
  verifiedToken: json['verified_token'] == null
      ? const VerifiedToken()
      : VerifiedToken.fromJson(json['verified_token'] as Map<String, dynamic>),
  token: json['token'] as String? ?? '',
  message: json['message'] as String? ?? '',
  certCode: json['new_code'] as String? ?? '',
  userDetails: json['user_details'] == null
      ? const Customer()
      : Customer.fromJson(json['user_details'] as Map<String, dynamic>),
  customer: json['customer'] == null
      ? const Customer()
      : Customer.fromJson(json['customer'] as Map<String, dynamic>),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  cards:
      (json['cards'] as List<dynamic>?)
          ?.map((e) => PrimeCardModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  url: json['url'] as String? ?? '',
  paymentUrl: json['payment_url'] as String? ?? '',
  walletTypes:
      (json['wallet_types'] as List<dynamic>?)
          ?.map((e) => WalletType.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  wallets:
      (json['wallets'] as List<dynamic>?)
          ?.map((e) => WalletModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  cart: json['cart'] == null
      ? const PrimeCartModel()
      : PrimeCartModel.fromJson(json['cart'] as Map<String, dynamic>),
  userId: (json['user_id'] as num?)?.toInt() ?? 0,
  questions:
      (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  wallet: json['wallet'] == null
      ? const WalletModel()
      : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => AdvertImageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  meta: json['meta'] == null
      ? const AppUpdateMeta()
      : AppUpdateMeta.fromJson(json['meta'] as Map<String, dynamic>),
  account: json['account'] == null
      ? const Account()
      : Account.fromJson(json['account'] as Map<String, dynamic>),
  ratings:
      (json['ratings'] as List<dynamic>?)
          ?.map((e) => RatingModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  notifications:
      (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  accountLogs: json['account_log'] == null
      ? const AccountLogs()
      : AccountLogs.fromJson(json['account_log'] as Map<String, dynamic>),
  cardAccounts:
      (json['card_accounts'] as List<dynamic>?)
          ?.map((e) => CardAccount.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  giftCardsList:
      (json['gift_logs'] as List<dynamic>?)
          ?.map((e) => GiftedCard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  payments:
      (json['payments'] as List<dynamic>?)
          ?.map((e) => Payments.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  eFundRequests:
      (json['efund_request_groups'] as List<dynamic>?)
          ?.map((e) => EfundRequestModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  favourites:
      (json['favourites'] as List<dynamic>?)
          ?.map((e) => PrimeCardModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  nearByMerchants:
      (json['close_merchants'] as List<dynamic>?)
          ?.map((e) => NearByMerchantModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shops:
      (json['shops'] as List<dynamic>?)
          ?.map((e) => ShopModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  discountedProducts:
      (json['discounted_products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  paymentOptions:
      (json['payment_options'] as List<dynamic>?)
          ?.map((e) => PaymentOptions.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  orders:
      (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shopCart: json['shop_cart'] == null
      ? const ShopCartModel()
      : ShopCartModel.fromJson(json['shop_cart'] as Map<String, dynamic>),
  shopProducts:
      (json['shop_products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shopPayments:
      (json['shop_payments'] as List<dynamic>?)
          ?.map((e) => ShopPaymentModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  addresses:
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shopDetails: json['shop_details'] == null
      ? const ShopModel()
      : ShopModel.fromJson(json['shop_details'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user': instance.signupUser,
      'verified_token': instance.verifiedToken,
      'token': instance.token,
      'message': instance.message,
      'new_code': instance.certCode,
      'user_details': instance.userDetails,
      'customer': instance.customer,
      'categories': instance.categories,
      'cards': instance.cards,
      'url': instance.url,
      'payment_url': instance.paymentUrl,
      'wallet_types': instance.walletTypes,
      'wallets': instance.wallets,
      'cart': instance.cart,
      'user_id': instance.userId,
      'questions': instance.questions,
      'wallet': instance.wallet,
      'images': instance.images,
      'meta': instance.meta,
      'account': instance.account,
      'ratings': instance.ratings,
      'notifications': instance.notifications,
      'account_log': instance.accountLogs,
      'card_accounts': instance.cardAccounts,
      'gift_logs': instance.giftCardsList,
      'payments': instance.payments,
      'efund_request_groups': instance.eFundRequests,
      'favourites': instance.favourites,
      'close_merchants': instance.nearByMerchants,
      'shops': instance.shops,
      'products': instance.products,
      'discounted_products': instance.discountedProducts,
      'payment_options': instance.paymentOptions,
      'orders': instance.orders,
      'shop_cart': instance.shopCart,
      'shop_products': instance.shopProducts,
      'shop_payments': instance.shopPayments,
      'addresses': instance.addresses,
      'shop_details': instance.shopDetails,
    };
