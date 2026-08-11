import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeStreak extends StatelessWidget {
  const PracticeStreak({
    required this.subtitle,
    required this.onStart,
    super.key,
  });

  final String subtitle;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final t = context.t;

    return BlocBuilder<MetricsCubit, MetricsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final isLoading = state.isLoading;
        final streakDays = state.data.streakDays;
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
                (!isLoading)
                    ? Text(
                        t.practiceStreak.days(count: streakDays),
                        style: textStyle.headlineMedium,
                      )
                    : CircularProgressIndicator.adaptive(),

                Text(subtitle, style: textStyle.bodySmall),
              ],
            ),
          ),
        );
      },
    );
  }
}
