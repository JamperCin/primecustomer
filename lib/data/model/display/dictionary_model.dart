import 'package:primecustomer/data/enum/card_owner.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DictionaryModel {
  String key;
  String value;
  String? asset;
  RxBool? selected;
  WalletType? type;
  CardOwner? cardOwner;
  int? flex;
  IconData? icon;

  DictionaryModel({
    required this.key,
    required this.value,
    this.selected,
    this.asset,
    this.type,
    this.cardOwner,
    this.flex,
    this.icon,
  });
}
