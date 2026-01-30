import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final double borderRadius;
  final double spacing;

  const CustomThemeExtension({
    required this.borderRadius,
    required this.spacing,
  });

  @override
  CustomThemeExtension copyWith({double? borderRadius, double? spacing}) {
    return CustomThemeExtension(
      borderRadius: borderRadius ?? this.borderRadius,
      spacing: spacing ?? this.spacing,
    );
  }

  @override
  CustomThemeExtension lerp(
    ThemeExtension<CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      spacing: lerpDouble(spacing, other.spacing, t)!,
    );
  }

  static const light = CustomThemeExtension(borderRadius: 12, spacing: 8);
  static const dark = CustomThemeExtension(borderRadius: 12, spacing: 8);
}
