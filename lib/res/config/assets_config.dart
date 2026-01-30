import 'package:primecustomer/data/enum/font_type.dart';

class AssetsConfig {
  static String FONT_FAMILY = FontType.SfUI.toString();
  static const String _baseImageUrl = 'assets/images/';
  static const String _baseGifUrl = 'assets/gif/';
  static const String DEFAULT_CATEGORY_ICON =
      "https://primeegiftfiles.s3.us-east-2.amazonaws.com/prime-merchants-categories-logo/others.png";
  static const String PRIME_ICON =
      "https://primeegiftfiles.s3.us-east-2.amazonaws.com/prime-merchants-categories-logo/prime.png";

  //============== Images assets =======================
  static const String primeIcon = "${_baseImageUrl}prime_white.png";
  static const String primeEGift = "${_baseImageUrl}prime_logo_new.png";
  static const String productsInCart =
      "${_baseImageUrl}ic_products_in_cart.jpg";
  static const String eye = '${_baseImageUrl}ic_eye.svg';
  static const String crossedEye = '${_baseImageUrl}ic_crossed_eye.svg';
  static const String cart = '${_baseImageUrl}ic_cart.svg';
  static const String basket = '${_baseImageUrl}ic_basket_cart.svg';
  static const String discount = '${_baseImageUrl}ic_discount.png';
  static const String discount_ = '${_baseImageUrl}_discount.svg';
  static const String filter2 = '${_baseImageUrl}ic_filter_new.svg';
  static const String location = '${_baseImageUrl}ic_location_new.png';
  static const String shoppingCart = '${_baseImageUrl}ic_shopping_cart.png';
  static const String nearByIcon = '${_baseImageUrl}ic_near_by.png';
  static const String giftBox = '${_baseImageUrl}ic_gift_box.png';
  static const String crown = '${_baseImageUrl}ic_crown.png';
  static const String bestProducts = '${_baseImageUrl}ic_best_producta.png';
  static const String recommendedProducts = '${_baseImageUrl}ic_recommend.png';
  static const String navigation = '${_baseImageUrl}ic_navigation.png';
  static const String quantity = '${_baseImageUrl}ic_quantity.png';
  static const String qrCode = '${_baseImageUrl}ic_scan.png';
  static const String deposit = '${_baseImageUrl}ic_scan.png';
  static const String background = '${_baseImageUrl}ic_background.png';
  static const String shopIcon = '${_baseImageUrl}ic_merchant.svg';
  static const String pickUp = '${_baseImageUrl}ic_pick_up.png';
  static const String delivery = '${_baseImageUrl}ic_delivery.png';
  static const String basketWithProducts =
      '${_baseImageUrl}ic_basket_products.png';

  //================ GIF Assets ==========================================
  static const String shoppingCartGif = '${_baseGifUrl}ic_cart_black.gif';
  static const String basketEmptyGif = '${_baseGifUrl}ic_basket_empty.gif';
}
