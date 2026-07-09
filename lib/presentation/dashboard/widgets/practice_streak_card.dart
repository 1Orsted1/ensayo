import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class PracticeStreak extends StatelessWidget {
  const PracticeStreak({
    required this.streakDays,
    required this.subtitle,
    required this.onStart,
    required this.isLoading,
    super.key,
  });

  final int streakDays;
  final String subtitle;
  final VoidCallback onStart;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final t = context.t;
    //TODO later get here directly the data from the streak days

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(t.practiceStreak.title, style: textStyle.labelSmall),
                isLoading
                    ? CircularProgressIndicator.adaptive()
                    : Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.orange,
                      ),
              ],
            ),
            Text(
              t.practiceStreak.days(count: streakDays),
              style: textStyle.headlineMedium,
            ),
            Text(subtitle, style: textStyle.bodySmall),
          ],
        ),
      ),
    );
  }
}
