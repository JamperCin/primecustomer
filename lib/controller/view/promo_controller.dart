import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoController extends BaseController {
  ///Card controller to make request for cards
  CardController? cardController;

  ///Holders of the array of cards
  RxList<PrimeCardModel> promoList = RxList<PrimeCardModel>();

  ///Boolean listener to listen for request being done
  final RxBool isDoneLoadingPromoCards = false.obs;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  void initAllRequest() {
    cardController?.getCards(promoList, isDoneLoadingPromoCards,
        key: "promotions_only");
  }
}
