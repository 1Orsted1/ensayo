import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/domain/metrics/metrics_load_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/daily_goal/daily_goal_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DailyGoalCard extends StatelessWidget {
  const DailyGoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<MetricsCubit, MetricsState>(
      buildWhen: (previous, current) =>
          previous.loadStatus != current.loadStatus ||
          previous.todayMinutes != current.todayMinutes ||
          previous.goalMinutes != current.goalMinutes,
      builder: (context, state) {
        final isLoading = state.loadStatus == MetricsLoadStatus.loading;
        final progress = (state.todayMinutes / state.goalMinutes).clamp(
          0.0,
          1.0,
        );
        return Card(
          child: InkWell(
            onTap: state.loadStatus == MetricsLoadStatus.loaded
                ? () => DailyGoalForm.show(context)
                : null,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t.dailyGoal.title),
                      const Icon(Icons.track_changes),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${state.todayMinutes}',
                        style: const TextStyle(fontSize: 32),
                      ),
                      Text(t.dailyGoal.remaining(goal: state.goalMinutes)),
                    ],
                  ),
                  const Gap(12),
                  LinearProgressIndicator(value: isLoading ? null : progress),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
