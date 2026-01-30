// ignore_for_file: overridden_fields

import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:flutter/material.dart';

class DialogEmoji extends Dialog {
  final double? minimumWidth;
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? insetPadding;

  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)));
  static const double _defaultElevation = 24.0;

  DialogEmoji({
    this.minimumWidth,
    required this.child,
    this.backgroundColor,
    this.insetPadding,
  }) {
    Dialog(
      backgroundColor: backgroundColor ?? Colors.transparent,
      insetPadding: insetPadding ?? EdgeInsets.all(AppDimens.dimen100),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final DialogThemeData dialogTheme = DialogTheme.of(context);
    final EdgeInsets effectivePadding =
        MediaQuery.of(context).viewInsets + (insetPadding ?? EdgeInsets.zero);
    return AnimatedPadding(
      padding: effectivePadding,
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Align(
          alignment: alignment ?? dialogTheme.alignment ?? Alignment.center,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: minimumWidth ?? AppDimens.dimen35),
            child: Material(
              color: backgroundColor ?? Colors.transparent,
              elevation:
                  elevation ?? dialogTheme.elevation ?? _defaultElevation,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              type: MaterialType.card,
              clipBehavior: Clip.hardEdge,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
