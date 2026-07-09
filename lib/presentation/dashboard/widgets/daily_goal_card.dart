import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DailyGoalCard extends StatelessWidget {
  const DailyGoalCard({
    required this.dailyGoalInMinutes,
    required this.onStart,
    super.key,
    required this.currentTimeInvested,
  });

  final int currentTimeInvested;
  final double dailyGoalInMinutes;
  final VoidCallback onStart;

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
              children: [Text(t.dailyGoal.title), Icon(Icons.track_changes)],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  currentTimeInvested.toString(),
                  style: TextStyle(fontSize: 32),
                ),
                Text(t.dailyGoal.remaining(goal: dailyGoalInMinutes)),
              ],
            ),
            Gap(12),
            LinearProgressIndicator(
              value: currentTimeInvested / dailyGoalInMinutes,
            ),
          ],
        ),
      ),
    );
  }
}
