import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/presentation/dashboard/widgets/daily_goal_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/metronome_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/practice_streak_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/quick_start_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/recent_pieces_card.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //TODO: create DB finnally please :v
  //TODO: make work the practice streak widget
  //TODO: make work the daily goal widget
  //TODO add translations
  //TODO: build metronome

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ThemeCubit>();
    final textStyle = context.textStyle;

    final List<(String, String)> dummy = [
      ("Cello Suite No. 1", "J.S. Bach"),
      ("Moonlight Sonata", "L. v. Beethoven"),
      ("Zigeunerweisen", "Pablo de Sarasate"),
    ];
    final List<String> dummyCat = ["Learning", "Polishing", "Not mastered"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home page", style: textStyle.labelLarge),
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
              title: 'Ready to play',
              subtitle: 'Your focus today: technical proficiency',
              onStart: () {},
            ),
            Gap(32),
            PracticeStreak(
              streakDays: 2,
              subtitle: 'This is your oportunity to improve',
              onStart: () {},
            ),
            DailyGoalCard(
              currentTimeInvested: 35,
              dailyGoalInMinutes: 60,
              onStart: () {},
            ),
            MetronomeCard(),
            Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent pieces",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  Text("View all"),
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
