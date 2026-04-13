import 'package:ensayo/presentation/dashboard/scaffold_with_nav_bar.dart';
import 'package:ensayo/presentation/dashboard/home_screen.dart';
import 'package:ensayo/presentation/dashboard/plan_screen.dart';
import 'package:ensayo/presentation/dashboard/progress_screen.dart';
import 'package:ensayo/presentation/dashboard/session_screen.dart';
import 'package:ensayo/presentation/demo_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _homeNavKey = GlobalKey<NavigatorState>();
final _planNavKey = GlobalKey<NavigatorState>();
final _sessionNavKey = GlobalKey<NavigatorState>();
final _progressNavKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
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
              builder: (BuildContext context, GoRouterState state) =>
                  HomeScreen(),
              routes: [
                GoRoute(
                  path: 'demo',
                  builder: (BuildContext context, GoRouterState state) =>
                      DemoScreen(),
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
              builder: (BuildContext context, GoRouterState state) =>
                  PlanScreen(),
              routes: [
                GoRoute(
                  path: 'demo',
                  builder: (BuildContext context, GoRouterState state) =>
                      DemoScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sessionNavKey,
          routes: [
            GoRoute(
              path: '/session',
              builder: (BuildContext context, GoRouterState state) =>
                  SessionScreen(),
              routes: [
                GoRoute(
                  path: 'demo',
                  builder: (BuildContext context, GoRouterState state) =>
                      DemoScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _progressNavKey,
          routes: [
            GoRoute(
              path: '/progress',
              builder: (BuildContext context, GoRouterState state) =>
                  ProgressScreen(),
              routes: [
                GoRoute(
                  path: 'demo',
                  builder: (BuildContext context, GoRouterState state) =>
                      DemoScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
