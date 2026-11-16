import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.secondaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          label.toUpperCase(),
          style: context.textStyle.labelSmall?.copyWith(
            color: color.onSecondaryContainer,
            letterSpacing: 0.6,
          ),
        ),
      ),
    );
  }
}
