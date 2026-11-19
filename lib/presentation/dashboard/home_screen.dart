import 'package:ensayo/application/session/session_bloc.dart';
import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/session/session_failure.dart';
import 'package:ensayo/domain/session/session_status.dart';
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
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final sessionState = context.watch<SessionBloc>().state;
    final textStyle = context.textStyle;
    final t = context.t;

    // This will be replaced later on.
    final List<(String, String)> dummy = [];
    final List<String> dummyCat = ["Learning", "Polishing", "Not mastered"];

    return BlocListener<SessionBloc, SessionState>(
      listenWhen: (previous, current) =>
          (previous.status == SessionStatus.starting &&
              current.status == SessionStatus.active) ||
          (current.failure == SessionFailure.start &&
              previous.failure != current.failure),
      listener: (context, state) {
        if (state.status == SessionStatus.active) {
          context.push('/session');
          return;
        }
        if (state.failure == SessionFailure.start) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.session.failure.start)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.home.title, style: textStyle.labelLarge),
          actions: [
            const Gap(32),
            IconButton(
              onPressed: () {
                themeCubit.setTheme(
                  themeCubit.isDarkTheme
                      ? SelectedTheme.light
                      : SelectedTheme.dark,
                );
              },
              icon: Icon(
                themeCubit.isDarkTheme
                    ? Icons.sunny
                    : Icons.nightlight_outlined,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              QuickStartCard(
                title: t.home.quickStart.title,
                subtitle: t.home.quickStart.subtitle,
                buttonLabel: sessionState.status == SessionStatus.active
                    ? t.quickStartCard.resumeSession
                    : t.quickStartCard.startSession,
                onStart: () {
                  if (sessionState.status == SessionStatus.active) {
                    context.push('/session');
                  } else {
                    context.read<SessionBloc>().add(
                      const SessionEvent.startRequested(),
                    );
                  }
                },
              ),
              const Gap(8),
              PracticeStreak(subtitle: t.practiceStreak.subtitle),
              const Gap(8),
              const DailyGoalCard(),
              const Gap(8),
              const MetronomeCard(),
              const Gap(16),
              if (dummy.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.home.recentPieces.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
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
              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}
