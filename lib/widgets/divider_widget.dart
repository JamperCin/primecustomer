import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final Widget? child;
  final String? text;

  const DividerWidget({
    super.key,
    this.height,
    this.width,
    this.color,
  })  : child = null,
        text = null;

  const DividerWidget.withChild({
    super.key,
    this.height,
    this.width,
    this.color,
    this.child,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (child != null || text != null) {
      return Row(
        children: [
          Flexible(child: _divider(colorScheme)),
          SizedBox(width: AppDimens.dimen20),
          child ??
              Text(
                text ?? '',
                style: textTheme.labelMedium,
              ),
          SizedBox(width: AppDimens.dimen20),
          Flexible(child: _divider(colorScheme)),
        ],
      );
    }

    return _divider(colorScheme);
  }

  Widget _divider(ColorScheme colorScheme) {
    return ContainerWidget(
      color: color ?? colorScheme.surfaceDim,
      height: height ?? 1,
      width: width ?? SizeConfig.screenWidth,
    );
  }
}
