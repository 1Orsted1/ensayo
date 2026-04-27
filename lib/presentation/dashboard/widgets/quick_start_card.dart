import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class QuickStartCard extends StatelessWidget {
  const QuickStartCard({
    required this.title,
    required this.subtitle,
    required this.onStart,
    super.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final style = context.customCardStyle;

    return Material(
      elevation: 8.0,
      borderRadius: style.borderRadius,
      child: Container(
        padding: style.padding,
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: style.borderRadius,
        ),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: style.titleStyle),
            const SizedBox(height: 4),
            Text(subtitle, style: style.subtitleStyle),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: onStart,
              style: style.buttonStyle,
              child: const Text('Start Session'),
            ),
          ],
        ),
      ),
    );
  }
}
