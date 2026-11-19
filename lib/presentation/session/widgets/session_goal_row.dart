import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/domain/metrics/metrics_load_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/daily_goal/daily_goal_form.dart';
import 'package:ensayo/presentation/session/widgets/elapsed_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionGoalRow extends StatelessWidget {
  const SessionGoalRow({required this.startedAt, super.key});

  final DateTime startedAt;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<MetricsCubit, MetricsState>(
      buildWhen: (previous, current) =>
          previous.loadStatus != current.loadStatus ||
          previous.todayMinutes != current.todayMinutes ||
          previous.goalMinutes != current.goalMinutes,
      builder: (context, state) {
        return ElapsedBuilder(
          since: startedAt,
          builder: (context, elapsed) {
            final minutes = state.todayMinutes + elapsed.inMinutes;
            final progress = (minutes / state.goalMinutes).clamp(0.0, 1.0);
            return Card(
              child: InkWell(
                onTap: state.loadStatus == MetricsLoadStatus.loaded
                    ? () => DailyGoalForm.show(context)
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.dailyGoal.title),
                      const SizedBox(height: 8),
                      Text(
                        '$minutes ${t.dailyGoal.remaining(goal: state.goalMinutes)}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(value: progress),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
