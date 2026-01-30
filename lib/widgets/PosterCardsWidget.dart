import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';

import '../data/model/remote/poster_cards_model.dart';

class PosterCardsWidget extends StatelessWidget {
  final PosterCardsModel poster;
  final Function(PosterCardsModel)? onTap;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const PosterCardsWidget({
    super.key,
    required this.poster,
    this.onTap, this.padding, this.margin, this.titleStyle, this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ContainerWidget(
      color: colorScheme.inversePrimary,
      width: appDimen.screenWidth,
      onTap: () {
        if (onTap != null) onTap!(poster);
      },
      padding: padding ?? EdgeInsets.all(appDimen.dimen(1)),
      margin: margin ?? EdgeInsets.only(right: appDimen.dimen(1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("🚀 ${poster.title}", style: titleStyle ?? textTheme.labelMedium),
          Flexible(
              child: Text(poster.description, style: descriptionStyle ?? textTheme.labelSmall)),
        ],
      ),
    );
  }
}
