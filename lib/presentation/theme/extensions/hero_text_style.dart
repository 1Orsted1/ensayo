import 'package:flutter/material.dart';

class HeroTextStyle extends ThemeExtension<HeroTextStyle> {
  const HeroTextStyle({
    required this.heroTitle,
    required this.heroMessage,
    required this.heroSubtitle,
  });

  final TextStyle heroTitle;
  final TextStyle heroMessage;
  final TextStyle heroSubtitle;

  @override
  ThemeExtension<HeroTextStyle> copyWith({
    TextStyle? heroTitle,
    TextStyle? heroMessage,
    TextStyle? heroSubtitle,
  }) {
    return HeroTextStyle(
      heroTitle: heroTitle ?? this.heroSubtitle,
      heroMessage: heroMessage ?? this.heroMessage,
      heroSubtitle: heroSubtitle ?? this.heroSubtitle,
    );
  }

  @override
  ThemeExtension<HeroTextStyle> lerp(
    covariant ThemeExtension<HeroTextStyle>? other,
    double t,
  ) {
    if (other is! HeroTextStyle) {
      return this;
    }
    return HeroTextStyle(
      heroTitle: TextStyle.lerp(heroTitle, other.heroTitle, t)!,
      heroMessage: TextStyle.lerp(heroMessage, other.heroMessage, t)!,
      heroSubtitle: TextStyle.lerp(heroSubtitle, other.heroSubtitle, t)!,
    );
  }
}
