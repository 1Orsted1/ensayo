import 'package:ensayo/presentation/theme/extensions/custom_card_style.dart';
import 'package:flutter/material.dart';

extension AppThemeX on BuildContext {
  CustomCardStyle get customCardStyle =>
      Theme.of(this).extension<CustomCardStyle>()!;
}
