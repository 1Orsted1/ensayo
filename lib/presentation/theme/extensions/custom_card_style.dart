import 'package:flutter/material.dart';

class CustomCardStyle extends ThemeExtension<CustomCardStyle> {
  const CustomCardStyle({
    required this.backgroundColor,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.buttonStyle,
    required this.padding,
    required this.borderRadius,
  });

  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final ButtonStyle buttonStyle;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  @override
  ThemeExtension<CustomCardStyle> copyWith({
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    ButtonStyle? buttonStyle,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
  }) {
    return CustomCardStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<CustomCardStyle> lerp(CustomCardStyle? other, double t) {
    if (other is! CustomCardStyle) return this;
    return CustomCardStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      subtitleStyle: TextStyle.lerp(subtitleStyle, other.subtitleStyle, t)!,
      buttonStyle: t < 0.5 ? buttonStyle : other.buttonStyle,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
    );
  }
}
