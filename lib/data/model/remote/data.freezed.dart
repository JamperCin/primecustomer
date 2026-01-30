// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'user')
  @JsonKey(name: 'signup_user')
  Customer get signupUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_token')
  VerifiedToken get verifiedToken => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_code')
  String get certCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_details')
  Customer get userDetails => throw _privateConstructorUsedError;
  Customer get customer => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<PrimeCardModel> get cards => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_url')
  String get paymentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_types')
  List<WalletType> get walletTypes => throw _privateConstructorUsedError;
  List<WalletModel> get wallets => throw _privateConstructorUsedError;
  PrimeCartModel get cart => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;
  WalletModel get wallet => throw _privateConstructorUsedError;
  List<AdvertImageModel> get images => throw _privateConstructorUsedError;
  AppUpdateMeta get meta => throw _privateConstructorUsedError;
  Account get account => throw _privateConstructorUsedError;
  List<RatingModel> get ratings => throw _privateConstructorUsedError;
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "account_log")
  AccountLogs get accountLogs => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_accounts')
  List<CardAccount> get cardAccounts => throw _privateConstructorUsedError;
  @JsonKey(name: 'gift_logs')
  List<GiftedCard> get giftCardsList => throw _privateConstructorUsedError;
  List<Payments> get payments =>
      throw _privateConstructorUsedError; //@JsonKey(name: "efund_requests")
  @JsonKey(name: "efund_request_groups")
  List<EfundRequestModel> get eFundRequests =>
      throw _privateConstructorUsedError;
  List<PrimeCardModel> get favourites => throw _privateConstructorUsedError;
  @JsonKey(name: "close_merchants")
  List<NearByMerchantModel> get nearByMerchants =>
      throw _privateConstructorUsedError;
  List<ShopModel> get shops => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;
  @JsonKey(name: 'discounted_products')
  List<ProductModel> get discountedProducts =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_options')
  List<PaymentOptions> get paymentOptions => throw _privateConstructorUsedError;
  List<OrderModel> get orders => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_cart")
  ShopCartModel get shopCart => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_products')
  List<ProductModel> get shopProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_payments')
  List<ShopPaymentModel> get shopPayments => throw _privateConstructorUsedError;
  List<AddressModel> get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_details')
  ShopModel get shopDetails => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({
    @JsonKey(name: 'user') @JsonKey(name: 'signup_user') Customer signupUser,
    @JsonKey(name: 'verified_token') VerifiedToken verifiedToken,
    String token,
    String message,
    @JsonKey(name: 'new_code') String certCode,
    @JsonKey(name: 'user_details') Customer userDetails,
    Customer customer,
    List<CategoryModel> categories,
    List<PrimeCardModel> cards,
    String url,
    @JsonKey(name: 'payment_url') String paymentUrl,
    @JsonKey(name: 'wallet_types') List<WalletType> walletTypes,
    List<WalletModel> wallets,
    PrimeCartModel cart,
    @JsonKey(name: 'user_id') int userId,
    List<Question> questions,
    WalletModel wallet,
    List<AdvertImageModel> images,
    AppUpdateMeta meta,
    Account account,
    List<RatingModel> ratings,
    List<NotificationModel> notifications,
    @JsonKey(name: "account_log") AccountLogs accountLogs,
    @JsonKey(name: 'card_accounts') List<CardAccount> cardAccounts,
    @JsonKey(name: 'gift_logs') List<GiftedCard> giftCardsList,
    List<Payments> payments,
    @JsonKey(name: "efund_request_groups")
    List<EfundRequestModel> eFundRequests,
    List<PrimeCardModel> favourites,
    @JsonKey(name: "close_merchants") List<NearByMerchantModel> nearByMerchants,
    List<ShopModel> shops,
    List<ProductModel> products,
    @JsonKey(name: 'discounted_products') List<ProductModel> discountedProducts,
    @JsonKey(name: 'payment_options') List<PaymentOptions> paymentOptions,
    List<OrderModel> orders,
    @JsonKey(name: "shop_cart") ShopCartModel shopCart,
    @JsonKey(name: 'shop_products') List<ProductModel> shopProducts,
    @JsonKey(name: 'shop_payments') List<ShopPaymentModel> shopPayments,
    List<AddressModel> addresses,
    @JsonKey(name: 'shop_details') ShopModel shopDetails,
  });

  $CustomerCopyWith<$Res> get signupUser;
  $VerifiedTokenCopyWith<$Res> get verifiedToken;
  $CustomerCopyWith<$Res> get userDetails;
  $CustomerCopyWith<$Res> get customer;
  $PrimeCartModelCopyWith<$Res> get cart;
  $WalletModelCopyWith<$Res> get wallet;
  $AppUpdateMetaCopyWith<$Res> get meta;
  $AccountCopyWith<$Res> get account;
  $AccountLogsCopyWith<$Res> get accountLogs;
  $ShopCartModelCopyWith<$Res> get shopCart;
  $ShopModelCopyWith<$Res> get shopDetails;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupUser = null,
    Object? verifiedToken = null,
    Object? token = null,
    Object? message = null,
    Object? certCode = null,
    Object? userDetails = null,
    Object? customer = null,
    Object? categories = null,
    Object? cards = null,
    Object? url = null,
    Object? paymentUrl = null,
    Object? walletTypes = null,
    Object? wallets = null,
    Object? cart = null,
    Object? userId = null,
    Object? questions = null,
    Object? wallet = null,
    Object? images = null,
    Object? meta = null,
    Object? account = null,
    Object? ratings = null,
    Object? notifications = null,
    Object? accountLogs = null,
    Object? cardAccounts = null,
    Object? giftCardsList = null,
    Object? payments = null,
    Object? eFundRequests = null,
    Object? favourites = null,
    Object? nearByMerchants = null,
    Object? shops = null,
    Object? products = null,
    Object? discountedProducts = null,
    Object? paymentOptions = null,
    Object? orders = null,
    Object? shopCart = null,
    Object? shopProducts = null,
    Object? shopPayments = null,
    Object? addresses = null,
    Object? shopDetails = null,
  }) {
    return _then(
      _value.copyWith(
            signupUser: null == signupUser
                ? _value.signupUser
                : signupUser // ignore: cast_nullable_to_non_nullable
                      as Customer,
            verifiedToken: null == verifiedToken
                ? _value.verifiedToken
                : verifiedToken // ignore: cast_nullable_to_non_nullable
                      as VerifiedToken,
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            certCode: null == certCode
                ? _value.certCode
                : certCode // ignore: cast_nullable_to_non_nullable
                      as String,
            userDetails: null == userDetails
                ? _value.userDetails
                : userDetails // ignore: cast_nullable_to_non_nullable
                      as Customer,
            customer: null == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                      as Customer,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<CategoryModel>,
            cards: null == cards
                ? _value.cards
                : cards // ignore: cast_nullable_to_non_nullable
                      as List<PrimeCardModel>,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentUrl: null == paymentUrl
                ? _value.paymentUrl
                : paymentUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            walletTypes: null == walletTypes
                ? _value.walletTypes
                : walletTypes // ignore: cast_nullable_to_non_nullable
                      as List<WalletType>,
            wallets: null == wallets
                ? _value.wallets
                : wallets // ignore: cast_nullable_to_non_nullable
                      as List<WalletModel>,
            cart: null == cart
                ? _value.cart
                : cart // ignore: cast_nullable_to_non_nullable
                      as PrimeCartModel,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            questions: null == questions
                ? _value.questions
                : questions // ignore: cast_nullable_to_non_nullable
                      as List<Question>,
            wallet: null == wallet
                ? _value.wallet
                : wallet // ignore: cast_nullable_to_non_nullable
                      as WalletModel,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<AdvertImageModel>,
            meta: null == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as AppUpdateMeta,
            account: null == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                      as Account,
            ratings: null == ratings
                ? _value.ratings
                : ratings // ignore: cast_nullable_to_non_nullable
                      as List<RatingModel>,
            notifications: null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                      as List<NotificationModel>,
            accountLogs: null == accountLogs
                ? _value.accountLogs
                : accountLogs // ignore: cast_nullable_to_non_nullable
                      as AccountLogs,
            cardAccounts: null == cardAccounts
                ? _value.cardAccounts
                : cardAccounts // ignore: cast_nullable_to_non_nullable
                      as List<CardAccount>,
            giftCardsList: null == giftCardsList
                ? _value.giftCardsList
                : giftCardsList // ignore: cast_nullable_to_non_nullable
                      as List<GiftedCard>,
            payments: null == payments
                ? _value.payments
                : payments // ignore: cast_nullable_to_non_nullable
                      as List<Payments>,
            eFundRequests: null == eFundRequests
                ? _value.eFundRequests
                : eFundRequests // ignore: cast_nullable_to_non_nullable
                      as List<EfundRequestModel>,
            favourites: null == favourites
                ? _value.favourites
                : favourites // ignore: cast_nullable_to_non_nullable
                      as List<PrimeCardModel>,
            nearByMerchants: null == nearByMerchants
                ? _value.nearByMerchants
                : nearByMerchants // ignore: cast_nullable_to_non_nullable
                      as List<NearByMerchantModel>,
            shops: null == shops
                ? _value.shops
                : shops // ignore: cast_nullable_to_non_nullable
                      as List<ShopModel>,
            products: null == products
                ? _value.products
                : products // ignore: cast_nullable_to_non_nullable
                      as List<ProductModel>,
            discountedProducts: null == discountedProducts
                ? _value.discountedProducts
                : discountedProducts // ignore: cast_nullable_to_non_nullable
                      as List<ProductModel>,
            paymentOptions: null == paymentOptions
                ? _value.paymentOptions
                : paymentOptions // ignore: cast_nullable_to_non_nullable
                      as List<PaymentOptions>,
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<OrderModel>,
            shopCart: null == shopCart
                ? _value.shopCart
                : shopCart // ignore: cast_nullable_to_non_nullable
                      as ShopCartModel,
            shopProducts: null == shopProducts
                ? _value.shopProducts
                : shopProducts // ignore: cast_nullable_to_non_nullable
                      as List<ProductModel>,
            shopPayments: null == shopPayments
                ? _value.shopPayments
                : shopPayments // ignore: cast_nullable_to_non_nullable
                      as List<ShopPaymentModel>,
            addresses: null == addresses
                ? _value.addresses
                : addresses // ignore: cast_nullable_to_non_nullable
                      as List<AddressModel>,
            shopDetails: null == shopDetails
                ? _value.shopDetails
                : shopDetails // ignore: cast_nullable_to_non_nullable
                      as ShopModel,
          )
          as $Val,
    );
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get signupUser {
    return $CustomerCopyWith<$Res>(_value.signupUser, (value) {
      return _then(_value.copyWith(signupUser: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerifiedTokenCopyWith<$Res> get verifiedToken {
    return $VerifiedTokenCopyWith<$Res>(_value.verifiedToken, (value) {
      return _then(_value.copyWith(verifiedToken: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get userDetails {
    return $CustomerCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrimeCartModelCopyWith<$Res> get cart {
    return $PrimeCartModelCopyWith<$Res>(_value.cart, (value) {
      return _then(_value.copyWith(cart: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res> get wallet {
    return $WalletModelCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUpdateMetaCopyWith<$Res> get meta {
    return $AppUpdateMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountLogsCopyWith<$Res> get accountLogs {
    return $AccountLogsCopyWith<$Res>(_value.accountLogs, (value) {
      return _then(_value.copyWith(accountLogs: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShopCartModelCopyWith<$Res> get shopCart {
    return $ShopCartModelCopyWith<$Res>(_value.shopCart, (value) {
      return _then(_value.copyWith(shopCart: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShopModelCopyWith<$Res> get shopDetails {
    return $ShopModelCopyWith<$Res>(_value.shopDetails, (value) {
      return _then(_value.copyWith(shopDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
    _$DataImpl value,
    $Res Function(_$DataImpl) then,
  ) = __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'user') @JsonKey(name: 'signup_user') Customer signupUser,
    @JsonKey(name: 'verified_token') VerifiedToken verifiedToken,
    String token,
    String message,
    @JsonKey(name: 'new_code') String certCode,
    @JsonKey(name: 'user_details') Customer userDetails,
    Customer customer,
    List<CategoryModel> categories,
    List<PrimeCardModel> cards,
    String url,
    @JsonKey(name: 'payment_url') String paymentUrl,
    @JsonKey(name: 'wallet_types') List<WalletType> walletTypes,
    List<WalletModel> wallets,
    PrimeCartModel cart,
    @JsonKey(name: 'user_id') int userId,
    List<Question> questions,
    WalletModel wallet,
    List<AdvertImageModel> images,
    AppUpdateMeta meta,
    Account account,
    List<RatingModel> ratings,
    List<NotificationModel> notifications,
    @JsonKey(name: "account_log") AccountLogs accountLogs,
    @JsonKey(name: 'card_accounts') List<CardAccount> cardAccounts,
    @JsonKey(name: 'gift_logs') List<GiftedCard> giftCardsList,
    List<Payments> payments,
    @JsonKey(name: "efund_request_groups")
    List<EfundRequestModel> eFundRequests,
    List<PrimeCardModel> favourites,
    @JsonKey(name: "close_merchants") List<NearByMerchantModel> nearByMerchants,
    List<ShopModel> shops,
    List<ProductModel> products,
    @JsonKey(name: 'discounted_products') List<ProductModel> discountedProducts,
    @JsonKey(name: 'payment_options') List<PaymentOptions> paymentOptions,
    List<OrderModel> orders,
    @JsonKey(name: "shop_cart") ShopCartModel shopCart,
    @JsonKey(name: 'shop_products') List<ProductModel> shopProducts,
    @JsonKey(name: 'shop_payments') List<ShopPaymentModel> shopPayments,
    List<AddressModel> addresses,
    @JsonKey(name: 'shop_details') ShopModel shopDetails,
  });

  @override
  $CustomerCopyWith<$Res> get signupUser;
  @override
  $VerifiedTokenCopyWith<$Res> get verifiedToken;
  @override
  $CustomerCopyWith<$Res> get userDetails;
  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $PrimeCartModelCopyWith<$Res> get cart;
  @override
  $WalletModelCopyWith<$Res> get wallet;
  @override
  $AppUpdateMetaCopyWith<$Res> get meta;
  @override
  $AccountCopyWith<$Res> get account;
  @override
  $AccountLogsCopyWith<$Res> get accountLogs;
  @override
  $ShopCartModelCopyWith<$Res> get shopCart;
  @override
  $ShopModelCopyWith<$Res> get shopDetails;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
    : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupUser = null,
    Object? verifiedToken = null,
    Object? token = null,
    Object? message = null,
    Object? certCode = null,
    Object? userDetails = null,
    Object? customer = null,
    Object? categories = null,
    Object? cards = null,
    Object? url = null,
    Object? paymentUrl = null,
    Object? walletTypes = null,
    Object? wallets = null,
    Object? cart = null,
    Object? userId = null,
    Object? questions = null,
    Object? wallet = null,
    Object? images = null,
    Object? meta = null,
    Object? account = null,
    Object? ratings = null,
    Object? notifications = null,
    Object? accountLogs = null,
    Object? cardAccounts = null,
    Object? giftCardsList = null,
    Object? payments = null,
    Object? eFundRequests = null,
    Object? favourites = null,
    Object? nearByMerchants = null,
    Object? shops = null,
    Object? products = null,
    Object? discountedProducts = null,
    Object? paymentOptions = null,
    Object? orders = null,
    Object? shopCart = null,
    Object? shopProducts = null,
    Object? shopPayments = null,
    Object? addresses = null,
    Object? shopDetails = null,
  }) {
    return _then(
      _$DataImpl(
        signupUser: null == signupUser
            ? _value.signupUser
            : signupUser // ignore: cast_nullable_to_non_nullable
                  as Customer,
        verifiedToken: null == verifiedToken
            ? _value.verifiedToken
            : verifiedToken // ignore: cast_nullable_to_non_nullable
                  as VerifiedToken,
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        certCode: null == certCode
            ? _value.certCode
            : certCode // ignore: cast_nullable_to_non_nullable
                  as String,
        userDetails: null == userDetails
            ? _value.userDetails
            : userDetails // ignore: cast_nullable_to_non_nullable
                  as Customer,
        customer: null == customer
            ? _value.customer
            : customer // ignore: cast_nullable_to_non_nullable
                  as Customer,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<CategoryModel>,
        cards: null == cards
            ? _value._cards
            : cards // ignore: cast_nullable_to_non_nullable
                  as List<PrimeCardModel>,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentUrl: null == paymentUrl
            ? _value.paymentUrl
            : paymentUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        walletTypes: null == walletTypes
            ? _value._walletTypes
            : walletTypes // ignore: cast_nullable_to_non_nullable
                  as List<WalletType>,
        wallets: null == wallets
            ? _value._wallets
            : wallets // ignore: cast_nullable_to_non_nullable
                  as List<WalletModel>,
        cart: null == cart
            ? _value.cart
            : cart // ignore: cast_nullable_to_non_nullable
                  as PrimeCartModel,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        questions: null == questions
            ? _value._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<Question>,
        wallet: null == wallet
            ? _value.wallet
            : wallet // ignore: cast_nullable_to_non_nullable
                  as WalletModel,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<AdvertImageModel>,
        meta: null == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as AppUpdateMeta,
        account: null == account
            ? _value.account
            : account // ignore: cast_nullable_to_non_nullable
                  as Account,
        ratings: null == ratings
            ? _value._ratings
            : ratings // ignore: cast_nullable_to_non_nullable
                  as List<RatingModel>,
        notifications: null == notifications
            ? _value._notifications
            : notifications // ignore: cast_nullable_to_non_nullable
                  as List<NotificationModel>,
        accountLogs: null == accountLogs
            ? _value.accountLogs
            : accountLogs // ignore: cast_nullable_to_non_nullable
                  as AccountLogs,
        cardAccounts: null == cardAccounts
            ? _value._cardAccounts
            : cardAccounts // ignore: cast_nullable_to_non_nullable
                  as List<CardAccount>,
        giftCardsList: null == giftCardsList
            ? _value._giftCardsList
            : giftCardsList // ignore: cast_nullable_to_non_nullable
                  as List<GiftedCard>,
        payments: null == payments
            ? _value._payments
            : payments // ignore: cast_nullable_to_non_nullable
                  as List<Payments>,
        eFundRequests: null == eFundRequests
            ? _value._eFundRequests
            : eFundRequests // ignore: cast_nullable_to_non_nullable
                  as List<EfundRequestModel>,
        favourites: null == favourites
            ? _value._favourites
            : favourites // ignore: cast_nullable_to_non_nullable
                  as List<PrimeCardModel>,
        nearByMerchants: null == nearByMerchants
            ? _value._nearByMerchants
            : nearByMerchants // ignore: cast_nullable_to_non_nullable
                  as List<NearByMerchantModel>,
        shops: null == shops
            ? _value._shops
            : shops // ignore: cast_nullable_to_non_nullable
                  as List<ShopModel>,
        products: null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<ProductModel>,
        discountedProducts: null == discountedProducts
            ? _value._discountedProducts
            : discountedProducts // ignore: cast_nullable_to_non_nullable
                  as List<ProductModel>,
        paymentOptions: null == paymentOptions
            ? _value._paymentOptions
            : paymentOptions // ignore: cast_nullable_to_non_nullable
                  as List<PaymentOptions>,
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<OrderModel>,
        shopCart: null == shopCart
            ? _value.shopCart
            : shopCart // ignore: cast_nullable_to_non_nullable
                  as ShopCartModel,
        shopProducts: null == shopProducts
            ? _value._shopProducts
            : shopProducts // ignore: cast_nullable_to_non_nullable
                  as List<ProductModel>,
        shopPayments: null == shopPayments
            ? _value._shopPayments
            : shopPayments // ignore: cast_nullable_to_non_nullable
                  as List<ShopPaymentModel>,
        addresses: null == addresses
            ? _value._addresses
            : addresses // ignore: cast_nullable_to_non_nullable
                  as List<AddressModel>,
        shopDetails: null == shopDetails
            ? _value.shopDetails
            : shopDetails // ignore: cast_nullable_to_non_nullable
                  as ShopModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({
    @JsonKey(name: 'user')
    @JsonKey(name: 'signup_user')
    this.signupUser = const Customer(),
    @JsonKey(name: 'verified_token') this.verifiedToken = const VerifiedToken(),
    this.token = '',
    this.message = '',
    @JsonKey(name: 'new_code') this.certCode = '',
    @JsonKey(name: 'user_details') this.userDetails = const Customer(),
    this.customer = const Customer(),
    final List<CategoryModel> categories = const [],
    final List<PrimeCardModel> cards = const [],
    this.url = '',
    @JsonKey(name: 'payment_url') this.paymentUrl = '',
    @JsonKey(name: 'wallet_types')
    final List<WalletType> walletTypes = const [],
    final List<WalletModel> wallets = const [],
    this.cart = const PrimeCartModel(),
    @JsonKey(name: 'user_id') this.userId = 0,
    final List<Question> questions = const [],
    this.wallet = const WalletModel(),
    final List<AdvertImageModel> images = const [],
    this.meta = const AppUpdateMeta(),
    this.account = const Account(),
    final List<RatingModel> ratings = const [],
    final List<NotificationModel> notifications = const [],
    @JsonKey(name: "account_log") this.accountLogs = const AccountLogs(),
    @JsonKey(name: 'card_accounts')
    final List<CardAccount> cardAccounts = const [],
    @JsonKey(name: 'gift_logs') final List<GiftedCard> giftCardsList = const [],
    final List<Payments> payments = const [],
    @JsonKey(name: "efund_request_groups")
    final List<EfundRequestModel> eFundRequests = const [],
    final List<PrimeCardModel> favourites = const [],
    @JsonKey(name: "close_merchants")
    final List<NearByMerchantModel> nearByMerchants = const [],
    final List<ShopModel> shops = const [],
    final List<ProductModel> products = const [],
    @JsonKey(name: 'discounted_products')
    final List<ProductModel> discountedProducts = const [],
    @JsonKey(name: 'payment_options')
    final List<PaymentOptions> paymentOptions = const [],
    final List<OrderModel> orders = const [],
    @JsonKey(name: "shop_cart") this.shopCart = const ShopCartModel(),
    @JsonKey(name: 'shop_products')
    final List<ProductModel> shopProducts = const [],
    @JsonKey(name: 'shop_payments')
    final List<ShopPaymentModel> shopPayments = const [],
    final List<AddressModel> addresses = const [],
    @JsonKey(name: 'shop_details') this.shopDetails = const ShopModel(),
  }) : _categories = categories,
       _cards = cards,
       _walletTypes = walletTypes,
       _wallets = wallets,
       _questions = questions,
       _images = images,
       _ratings = ratings,
       _notifications = notifications,
       _cardAccounts = cardAccounts,
       _giftCardsList = giftCardsList,
       _payments = payments,
       _eFundRequests = eFundRequests,
       _favourites = favourites,
       _nearByMerchants = nearByMerchants,
       _shops = shops,
       _products = products,
       _discountedProducts = discountedProducts,
       _paymentOptions = paymentOptions,
       _orders = orders,
       _shopProducts = shopProducts,
       _shopPayments = shopPayments,
       _addresses = addresses;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'user')
  @JsonKey(name: 'signup_user')
  final Customer signupUser;
  @override
  @JsonKey(name: 'verified_token')
  final VerifiedToken verifiedToken;
  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'new_code')
  final String certCode;
  @override
  @JsonKey(name: 'user_details')
  final Customer userDetails;
  @override
  @JsonKey()
  final Customer customer;
  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<PrimeCardModel> _cards;
  @override
  @JsonKey()
  List<PrimeCardModel> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey(name: 'payment_url')
  final String paymentUrl;
  final List<WalletType> _walletTypes;
  @override
  @JsonKey(name: 'wallet_types')
  List<WalletType> get walletTypes {
    if (_walletTypes is EqualUnmodifiableListView) return _walletTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walletTypes);
  }

  final List<WalletModel> _wallets;
  @override
  @JsonKey()
  List<WalletModel> get wallets {
    if (_wallets is EqualUnmodifiableListView) return _wallets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallets);
  }

  @override
  @JsonKey()
  final PrimeCartModel cart;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  final List<Question> _questions;
  @override
  @JsonKey()
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  @JsonKey()
  final WalletModel wallet;
  final List<AdvertImageModel> _images;
  @override
  @JsonKey()
  List<AdvertImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final AppUpdateMeta meta;
  @override
  @JsonKey()
  final Account account;
  final List<RatingModel> _ratings;
  @override
  @JsonKey()
  List<RatingModel> get ratings {
    if (_ratings is EqualUnmodifiableListView) return _ratings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ratings);
  }

  final List<NotificationModel> _notifications;
  @override
  @JsonKey()
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey(name: "account_log")
  final AccountLogs accountLogs;
  final List<CardAccount> _cardAccounts;
  @override
  @JsonKey(name: 'card_accounts')
  List<CardAccount> get cardAccounts {
    if (_cardAccounts is EqualUnmodifiableListView) return _cardAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardAccounts);
  }

  final List<GiftedCard> _giftCardsList;
  @override
  @JsonKey(name: 'gift_logs')
  List<GiftedCard> get giftCardsList {
    if (_giftCardsList is EqualUnmodifiableListView) return _giftCardsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_giftCardsList);
  }

  final List<Payments> _payments;
  @override
  @JsonKey()
  List<Payments> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  //@JsonKey(name: "efund_requests")
  final List<EfundRequestModel> _eFundRequests;
  //@JsonKey(name: "efund_requests")
  @override
  @JsonKey(name: "efund_request_groups")
  List<EfundRequestModel> get eFundRequests {
    if (_eFundRequests is EqualUnmodifiableListView) return _eFundRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eFundRequests);
  }

  final List<PrimeCardModel> _favourites;
  @override
  @JsonKey()
  List<PrimeCardModel> get favourites {
    if (_favourites is EqualUnmodifiableListView) return _favourites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favourites);
  }

  final List<NearByMerchantModel> _nearByMerchants;
  @override
  @JsonKey(name: "close_merchants")
  List<NearByMerchantModel> get nearByMerchants {
    if (_nearByMerchants is EqualUnmodifiableListView) return _nearByMerchants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nearByMerchants);
  }

  final List<ShopModel> _shops;
  @override
  @JsonKey()
  List<ShopModel> get shops {
    if (_shops is EqualUnmodifiableListView) return _shops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<ProductModel> _discountedProducts;
  @override
  @JsonKey(name: 'discounted_products')
  List<ProductModel> get discountedProducts {
    if (_discountedProducts is EqualUnmodifiableListView)
      return _discountedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountedProducts);
  }

  final List<PaymentOptions> _paymentOptions;
  @override
  @JsonKey(name: 'payment_options')
  List<PaymentOptions> get paymentOptions {
    if (_paymentOptions is EqualUnmodifiableListView) return _paymentOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentOptions);
  }

  final List<OrderModel> _orders;
  @override
  @JsonKey()
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey(name: "shop_cart")
  final ShopCartModel shopCart;
  final List<ProductModel> _shopProducts;
  @override
  @JsonKey(name: 'shop_products')
  List<ProductModel> get shopProducts {
    if (_shopProducts is EqualUnmodifiableListView) return _shopProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopProducts);
  }

  final List<ShopPaymentModel> _shopPayments;
  @override
  @JsonKey(name: 'shop_payments')
  List<ShopPaymentModel> get shopPayments {
    if (_shopPayments is EqualUnmodifiableListView) return _shopPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopPayments);
  }

  final List<AddressModel> _addresses;
  @override
  @JsonKey()
  List<AddressModel> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  @JsonKey(name: 'shop_details')
  final ShopModel shopDetails;

  @override
  String toString() {
    return 'Data(signupUser: $signupUser, verifiedToken: $verifiedToken, token: $token, message: $message, certCode: $certCode, userDetails: $userDetails, customer: $customer, categories: $categories, cards: $cards, url: $url, paymentUrl: $paymentUrl, walletTypes: $walletTypes, wallets: $wallets, cart: $cart, userId: $userId, questions: $questions, wallet: $wallet, images: $images, meta: $meta, account: $account, ratings: $ratings, notifications: $notifications, accountLogs: $accountLogs, cardAccounts: $cardAccounts, giftCardsList: $giftCardsList, payments: $payments, eFundRequests: $eFundRequests, favourites: $favourites, nearByMerchants: $nearByMerchants, shops: $shops, products: $products, discountedProducts: $discountedProducts, paymentOptions: $paymentOptions, orders: $orders, shopCart: $shopCart, shopProducts: $shopProducts, shopPayments: $shopPayments, addresses: $addresses, shopDetails: $shopDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.signupUser, signupUser) ||
                other.signupUser == signupUser) &&
            (identical(other.verifiedToken, verifiedToken) ||
                other.verifiedToken == verifiedToken) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.certCode, certCode) ||
                other.certCode == certCode) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            const DeepCollectionEquality().equals(
              other._walletTypes,
              _walletTypes,
            ) &&
            const DeepCollectionEquality().equals(other._wallets, _wallets) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality().equals(other._ratings, _ratings) &&
            const DeepCollectionEquality().equals(
              other._notifications,
              _notifications,
            ) &&
            (identical(other.accountLogs, accountLogs) ||
                other.accountLogs == accountLogs) &&
            const DeepCollectionEquality().equals(
              other._cardAccounts,
              _cardAccounts,
            ) &&
            const DeepCollectionEquality().equals(
              other._giftCardsList,
              _giftCardsList,
            ) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            const DeepCollectionEquality().equals(
              other._eFundRequests,
              _eFundRequests,
            ) &&
            const DeepCollectionEquality().equals(
              other._favourites,
              _favourites,
            ) &&
            const DeepCollectionEquality().equals(
              other._nearByMerchants,
              _nearByMerchants,
            ) &&
            const DeepCollectionEquality().equals(other._shops, _shops) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(
              other._discountedProducts,
              _discountedProducts,
            ) &&
            const DeepCollectionEquality().equals(
              other._paymentOptions,
              _paymentOptions,
            ) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.shopCart, shopCart) ||
                other.shopCart == shopCart) &&
            const DeepCollectionEquality().equals(
              other._shopProducts,
              _shopProducts,
            ) &&
            const DeepCollectionEquality().equals(
              other._shopPayments,
              _shopPayments,
            ) &&
            const DeepCollectionEquality().equals(
              other._addresses,
              _addresses,
            ) &&
            (identical(other.shopDetails, shopDetails) ||
                other.shopDetails == shopDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    signupUser,
    verifiedToken,
    token,
    message,
    certCode,
    userDetails,
    customer,
    const DeepCollectionEquality().hash(_categories),
    const DeepCollectionEquality().hash(_cards),
    url,
    paymentUrl,
    const DeepCollectionEquality().hash(_walletTypes),
    const DeepCollectionEquality().hash(_wallets),
    cart,
    userId,
    const DeepCollectionEquality().hash(_questions),
    wallet,
    const DeepCollectionEquality().hash(_images),
    meta,
    account,
    const DeepCollectionEquality().hash(_ratings),
    const DeepCollectionEquality().hash(_notifications),
    accountLogs,
    const DeepCollectionEquality().hash(_cardAccounts),
    const DeepCollectionEquality().hash(_giftCardsList),
    const DeepCollectionEquality().hash(_payments),
    const DeepCollectionEquality().hash(_eFundRequests),
    const DeepCollectionEquality().hash(_favourites),
    const DeepCollectionEquality().hash(_nearByMerchants),
    const DeepCollectionEquality().hash(_shops),
    const DeepCollectionEquality().hash(_products),
    const DeepCollectionEquality().hash(_discountedProducts),
    const DeepCollectionEquality().hash(_paymentOptions),
    const DeepCollectionEquality().hash(_orders),
    shopCart,
    const DeepCollectionEquality().hash(_shopProducts),
    const DeepCollectionEquality().hash(_shopPayments),
    const DeepCollectionEquality().hash(_addresses),
    shopDetails,
  ]);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(this);
  }
}

abstract class _Data implements Data {
  const factory _Data({
    @JsonKey(name: 'user')
    @JsonKey(name: 'signup_user')
    final Customer signupUser,
    @JsonKey(name: 'verified_token') final VerifiedToken verifiedToken,
    final String token,
    final String message,
    @JsonKey(name: 'new_code') final String certCode,
    @JsonKey(name: 'user_details') final Customer userDetails,
    final Customer customer,
    final List<CategoryModel> categories,
    final List<PrimeCardModel> cards,
    final String url,
    @JsonKey(name: 'payment_url') final String paymentUrl,
    @JsonKey(name: 'wallet_types') final List<WalletType> walletTypes,
    final List<WalletModel> wallets,
    final PrimeCartModel cart,
    @JsonKey(name: 'user_id') final int userId,
    final List<Question> questions,
    final WalletModel wallet,
    final List<AdvertImageModel> images,
    final AppUpdateMeta meta,
    final Account account,
    final List<RatingModel> ratings,
    final List<NotificationModel> notifications,
    @JsonKey(name: "account_log") final AccountLogs accountLogs,
    @JsonKey(name: 'card_accounts') final List<CardAccount> cardAccounts,
    @JsonKey(name: 'gift_logs') final List<GiftedCard> giftCardsList,
    final List<Payments> payments,
    @JsonKey(name: "efund_request_groups")
    final List<EfundRequestModel> eFundRequests,
    final List<PrimeCardModel> favourites,
    @JsonKey(name: "close_merchants")
    final List<NearByMerchantModel> nearByMerchants,
    final List<ShopModel> shops,
    final List<ProductModel> products,
    @JsonKey(name: 'discounted_products')
    final List<ProductModel> discountedProducts,
    @JsonKey(name: 'payment_options') final List<PaymentOptions> paymentOptions,
    final List<OrderModel> orders,
    @JsonKey(name: "shop_cart") final ShopCartModel shopCart,
    @JsonKey(name: 'shop_products') final List<ProductModel> shopProducts,
    @JsonKey(name: 'shop_payments') final List<ShopPaymentModel> shopPayments,
    final List<AddressModel> addresses,
    @JsonKey(name: 'shop_details') final ShopModel shopDetails,
  }) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'user')
  @JsonKey(name: 'signup_user')
  Customer get signupUser;
  @override
  @JsonKey(name: 'verified_token')
  VerifiedToken get verifiedToken;
  @override
  String get token;
  @override
  String get message;
  @override
  @JsonKey(name: 'new_code')
  String get certCode;
  @override
  @JsonKey(name: 'user_details')
  Customer get userDetails;
  @override
  Customer get customer;
  @override
  List<CategoryModel> get categories;
  @override
  List<PrimeCardModel> get cards;
  @override
  String get url;
  @override
  @JsonKey(name: 'payment_url')
  String get paymentUrl;
  @override
  @JsonKey(name: 'wallet_types')
  List<WalletType> get walletTypes;
  @override
  List<WalletModel> get wallets;
  @override
  PrimeCartModel get cart;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  List<Question> get questions;
  @override
  WalletModel get wallet;
  @override
  List<AdvertImageModel> get images;
  @override
  AppUpdateMeta get meta;
  @override
  Account get account;
  @override
  List<RatingModel> get ratings;
  @override
  List<NotificationModel> get notifications;
  @override
  @JsonKey(name: "account_log")
  AccountLogs get accountLogs;
  @override
  @JsonKey(name: 'card_accounts')
  List<CardAccount> get cardAccounts;
  @override
  @JsonKey(name: 'gift_logs')
  List<GiftedCard> get giftCardsList;
  @override
  List<Payments> get payments; //@JsonKey(name: "efund_requests")
  @override
  @JsonKey(name: "efund_request_groups")
  List<EfundRequestModel> get eFundRequests;
  @override
  List<PrimeCardModel> get favourites;
  @override
  @JsonKey(name: "close_merchants")
  List<NearByMerchantModel> get nearByMerchants;
  @override
  List<ShopModel> get shops;
  @override
  List<ProductModel> get products;
  @override
  @JsonKey(name: 'discounted_products')
  List<ProductModel> get discountedProducts;
  @override
  @JsonKey(name: 'payment_options')
  List<PaymentOptions> get paymentOptions;
  @override
  List<OrderModel> get orders;
  @override
  @JsonKey(name: "shop_cart")
  ShopCartModel get shopCart;
  @override
  @JsonKey(name: 'shop_products')
  List<ProductModel> get shopProducts;
  @override
  @JsonKey(name: 'shop_payments')
  List<ShopPaymentModel> get shopPayments;
  @override
  List<AddressModel> get addresses;
  @override
  @JsonKey(name: 'shop_details')
  ShopModel get shopDetails;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
