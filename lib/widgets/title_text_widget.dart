import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final GestureTapCallback? onTap;

  const TitleTextWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.bodyLarge,
        ),
        if (onTap != null)
          TextButtonWidget(
            onTap: () {
              onTap?.call();
            },
            text: 'View All',
            style: textTheme.labelMedium
                ?.copyWith(color: colorScheme.inverseSurface.withAlpha(150)),
          ),
      ],
    );
  }
}
