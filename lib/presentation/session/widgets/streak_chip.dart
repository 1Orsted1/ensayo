import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class StreakChip extends StatelessWidget {
  const StreakChip({required this.days, super.key});

  final int days;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Chip(
      avatar: const Icon(Icons.local_fire_department_outlined),
      label: Text(t.practiceStreak.days(n: days, count: days)),
    );
  }
}
