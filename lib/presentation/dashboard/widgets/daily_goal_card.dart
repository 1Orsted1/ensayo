import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DailyGoalCard extends StatelessWidget {
  const DailyGoalCard({required this.onStart, super.key});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<MetricsCubit, MetricsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final dailyGoalMinutes = state.data.dailyGoalInMinutes;
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
                    Text(t.dailyGoal.title),
                    Icon(Icons.track_changes),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //TODO fix this later
                    Text(
                      "0", //currentTimeInvested.toString(),
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      t.dailyGoal.remaining(
                        goal: state.isLoading ? 0.0 : dailyGoalMinutes,
                      ),
                    ),
                  ],
                ),
                Gap(12),
                (!state.isLoading)
                    ? LinearProgressIndicator(value: 0 / dailyGoalMinutes)
                    : SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
