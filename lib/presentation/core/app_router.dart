import 'package:ensayo/application/session/session_bloc.dart';
import 'package:ensayo/domain/session/session_status.dart';
import 'package:ensayo/injection.dart';
import 'package:ensayo/presentation/dashboard/home_screen.dart';
import 'package:ensayo/presentation/dashboard/progress_screen.dart';
import 'package:ensayo/presentation/dashboard/scaffold_with_nav_bar.dart';
import 'package:ensayo/presentation/demo_screen.dart';
import 'package:ensayo/presentation/logs/logs_screen.dart';
import 'package:ensayo/presentation/plan/piece_form.dart';
import 'package:ensayo/presentation/plan/plan_screen.dart';
import 'package:ensayo/presentation/session/active_session_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavKey = GlobalKey<NavigatorState>();
final _planNavKey = GlobalKey<NavigatorState>();
final _logsNavKey = GlobalKey<NavigatorState>();
final _progressNavKey = GlobalKey<NavigatorState>();

/// Public so the navigation test can mount the real routes.
final planSubRoutes = <RouteBase>[
  GoRoute(
    path: 'new',
    builder: (BuildContext context, GoRouterState state) => const PieceForm(),
  ),
  GoRoute(
    path: ':pieceId',
    redirect: (BuildContext context, GoRouterState state) =>
        int.tryParse(state.pathParameters['pieceId']!) == null ? '/plan' : null,
    builder: (BuildContext context, GoRouterState state) =>
        PieceForm(pieceId: int.parse(state.pathParameters['pieceId']!)),
  ),
];

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/session',
      parentNavigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        final status = context.read<SessionBloc>().state.status;
        return status == SessionStatus.active ? null : '/home';
      },
      builder: (context, state) => const ActiveSessionScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'demo',
                  builder: (context, state) => const DemoScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _planNavKey,
          routes: [
            GoRoute(
              path: '/plan',
              builder: (context, state) => const PlanScreen(),
              routes: planSubRoutes,
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _logsNavKey,
          routes: [
            GoRoute(
              path: '/logs',
              builder: (context, state) => const LogsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _progressNavKey,
          routes: [
            GoRoute(
              path: '/progress',
              builder: (context, state) => const ProgressScreen(),
              routes: [
                GoRoute(
                  path: 'demo',
                  builder: (context, state) => const DemoScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  observers: [FirebaseAnalyticsObserver(analytics: getIt<FirebaseAnalytics>())],
);
