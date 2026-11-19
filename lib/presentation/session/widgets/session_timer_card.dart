import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/session/widgets/elapsed_builder.dart';
import 'package:ensayo/presentation/session/widgets/streak_chip.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionTimerCard extends StatelessWidget {
  const SessionTimerCard({
    required this.startedAt,
    required this.completedCount,
    super.key,
  });

  final DateTime startedAt;
  final int completedCount;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(t.session.inProgress, style: context.textStyle.labelLarge),
            const SizedBox(height: 12),
            ElapsedBuilder(
              since: startedAt,
              builder: (context, elapsed) => Text(
                _formatElapsed(elapsed),
                key: const ValueKey('session-elapsed-time'),
                style: context.textStyle.displayMedium,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              t.session.piecesCompleted(
                n: completedCount,
                count: completedCount,
              ),
            ),
            const SizedBox(height: 12),
            BlocBuilder<MetricsCubit, MetricsState>(
              buildWhen: (previous, current) =>
                  previous.streakDays != current.streakDays,
              builder: (context, state) => StreakChip(days: state.streakDays),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatElapsed(Duration elapsed) {
  String twoDigits(int value) => value.toString().padLeft(2, '0');
  return '${twoDigits(elapsed.inHours)}:'
      '${twoDigits(elapsed.inMinutes.remainder(60))}:'
      '${twoDigits(elapsed.inSeconds.remainder(60))}';
}
