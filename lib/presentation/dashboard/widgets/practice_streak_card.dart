import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/domain/metrics/metrics_load_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeStreak extends StatelessWidget {
  const PracticeStreak({required this.subtitle, super.key});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final t = context.t;

    return BlocBuilder<MetricsCubit, MetricsState>(
      buildWhen: (previous, current) =>
          previous.loadStatus != current.loadStatus ||
          previous.streakDays != current.streakDays,
      builder: (context, state) {
        final isLoading = state.loadStatus == MetricsLoadStatus.loading;
        final hasFailed = state.loadStatus == MetricsLoadStatus.failure;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.practiceStreak.title, style: textStyle.labelSmall),
                    if (isLoading)
                      const CircularProgressIndicator.adaptive()
                    else
                      const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.orange,
                      ),
                  ],
                ),
                if (isLoading)
                  const CircularProgressIndicator.adaptive()
                else if (hasFailed)
                  Text(
                    t.practiceStreak.loadFailure,
                    style: textStyle.bodyMedium,
                  )
                else
                  Text(
                    t.practiceStreak.days(
                      n: state.streakDays,
                      count: state.streakDays,
                    ),
                    style: textStyle.headlineMedium,
                  ),
                Text(subtitle, style: textStyle.bodySmall),
              ],
            ),
          ),
        );
      },
    );
  }
}
