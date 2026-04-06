import 'package:flutter/material.dart';

class HeroTheme extends ThemeExtension<HeroTheme> {
  HeroTheme({
    required this.background,
    required this.textTitle,
    required this.textContent,
    required this.borderColor,
    required this.shadeColor,
  });

  final Color background;
  final Color textTitle;
  final Color textContent;
  final Color borderColor;
  final Color shadeColor;

  @override
  ThemeExtension<HeroTheme> copyWith({
    Color? background,
    Color? textTitle,
    Color? textContent,
    Color? borderColor,
    Color? shadeColor,
  }) {
    return HeroTheme(
      background: background ?? this.background,
      textTitle: textTitle ?? this.textTitle,
      textContent: textContent ?? this.textContent,
      borderColor: borderColor ?? this.borderColor,
      shadeColor: shadeColor ?? this.shadeColor,
    );
  }

  @override
  ThemeExtension<HeroTheme> lerp(HeroTheme? other, double t) {
    if (other is! HeroTheme) return this;

    return HeroTheme(
      background: Color.lerp(background, other.background, t)!,
      textTitle: Color.lerp(textTitle, other.textTitle, t)!,
      textContent: Color.lerp(textContent, other.textContent, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      shadeColor: Color.lerp(shadeColor, other.shadeColor, t)!,
    );
  }
}
