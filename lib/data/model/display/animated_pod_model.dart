import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class AnimatedPodModel {
  Widget widget;
  GlobalKey<AnimatorWidgetState>? key;

  AnimatedPodModel({this.widget = const SizedBox(), this.key});
}
