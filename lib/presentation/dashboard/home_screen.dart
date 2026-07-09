import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/dashboard/widgets/daily_goal_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/metronome_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/practice_streak_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/quick_start_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/recent_pieces_card.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //TODO: build metronome
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<MetricsCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ThemeCubit>();
    final textStyle = context.textStyle;
    final t = context.t;

    final List<(String, String)> dummy = [
      ("Cello Suite No. 1", "J.S. Bach"),
      ("Moonlight Sonata", "L. v. Beethoven"),
      ("Zigeunerweisen", "Pablo de Sarasate"),
    ];
    final List<String> dummyCat = ["Learning", "Polishing", "Not mastered"];

    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.title, style: textStyle.labelLarge),
        actions: [
          IconButton(
            onPressed: () {
              bloc.setTheme(
                bloc.isDarkTheme ? SelectedTheme.light : SelectedTheme.dark,
              );
            },
            icon: Icon(
              bloc.isDarkTheme ? Icons.sunny : Icons.nightlight_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            QuickStartCard(
              title: t.home.quickStart.title,
              subtitle: t.home.quickStart.subtitle,
              onStart: () async {},
            ),
            Gap(32),
            BlocBuilder<MetricsCubit, MetricsState>(
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                return PracticeStreak(
                  isLoading: state.isLoading,
                  streakDays: state.data?.streakDays ?? 0,
                  subtitle: t.practiceStreak.subtitle,
                  onStart: () {},
                );
              },
            ),
            BlocBuilder<MetricsCubit, MetricsState>(
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                return DailyGoalCard(
                  currentTimeInvested: 0,
                  dailyGoalInMinutes: state.data?.dailyGoalInMinutes ?? 1.0,
                  onStart: () {},
                );
              },
            ),
            MetronomeCard(),
            Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    t.home.recentPieces.title,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  Text(t.home.recentPieces.viewAll),
                ],
              ),
            ),
            Column(
              children: dummy
                  .map(
                    (e) => RecentPiecesCard(
                      title: e.$1,
                      subTitle: e.$2,
                      categories: dummyCat,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
