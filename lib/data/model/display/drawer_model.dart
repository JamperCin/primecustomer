import 'package:primecustomer/data/enum/menu_index.dart';
import 'package:flutter/material.dart';

import '../../enum/drawer_inder.dart';

class DrawerModel {
  String label;
  IconData icon;
  String? asset;
  String? header;
  Color? color;
  DrawerIndex index;
  MenuIndex menuIndex;

  DrawerModel({
    this.asset,
    this.icon = Icons.home,
    this.color,
    this.header,
    this.index = DrawerIndex.HOME,
    this.menuIndex = MenuIndex.REFERRALS,
    this.label = "Home",
  });
}
