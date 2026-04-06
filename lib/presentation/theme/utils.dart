import 'package:ensayo/presentation/theme/extensions/hero_text_style.dart';
import 'package:flutter/material.dart';

const textStyles = TextTheme(
  displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
  displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
  displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
  headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
  bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
  labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
  labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
);

HeroTextStyle getHeroStyle() {
  return HeroTextStyle(
    heroTitle: textStyles.displayLarge!.copyWith(
      fontFamily: "Iceland",
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    heroMessage: textStyles.displaySmall!.copyWith(
      fontFamily: "Iceland",
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    heroSubtitle: textStyles.displayMedium!.copyWith(
      fontFamily: "Iceland",
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}
