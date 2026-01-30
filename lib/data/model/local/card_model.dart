import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/advert_image_model.dart';
import 'package:primecustomer/data/model/remote/category_model.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';

import '../remote/prime_cart_model.dart';

class CardModel extends BaseObject {
  final PrimeCardModel? card;
  final PrimeCartModel? cart;
  final String? heroTag;
  final String? filter;
  final DictionaryModel? dic;
  final BaseObject? object;
  final WalletType? type;
  final MerchantDetails? client;
  final int cartId;
  final int? clientId;
  final bool shouldResetPin;
  final bool shouldPopBack;
  final String? clientName;
  final String phoneNumber;
  final List<AdvertImageModel>? advertList;
  List<CategoryModel>? menuCategoryList;
  CategoryModel? selectedMenuCategory;

  CardModel({
    this.card,
    this.heroTag,
    this.filter,
    this.cart,
    this.dic,
    this.client,
    this.object,
    this.cartId = 0,
    this.clientId = -1,
    this.clientName,
    this.shouldResetPin = false,
    this.shouldPopBack = false,
    this.type,
    this.phoneNumber = "",
    this.advertList,
    this.menuCategoryList,
    this.selectedMenuCategory,
  });
}
