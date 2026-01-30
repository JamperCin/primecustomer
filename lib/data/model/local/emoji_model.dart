import 'package:primecustomer/res/app/app_colors.dart';
import 'package:flutter/material.dart';

class EmojiModel {
  IconData? icon;
  String data;
  Function? call;
  Color color;
  bool isEmoji;

  EmojiModel({
    this.data = "",
    this.icon,
    this.call,
    this.color = AppColors.kYellowDeepColor,
    this.isEmoji = true,
  });
}
