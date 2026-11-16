import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/core/app_router.dart';
import 'package:ensayo/presentation/plan/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

final en = AppLocale.en.buildSync();

final titleField = find.byKey(const ValueKey('piece-title'));
final composerField = find.byKey(const ValueKey('piece-composer'));
final tempoField = find.byKey(const ValueKey('piece-tempo'));

/// Creates the bloc here, inside fake-async, so its events advance with
/// `pump`.
Future<({PlanBloc bloc, GoRouter router})> pumpPlanApp(
  WidgetTester tester,
  IPlanFacade facade, {
  String initialLocation = '/plan',
  bool settle = true,
}) async {
  // The 390 pt design width.
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  final bloc = PlanBloc(facade)..add(const PlanEvent.started());
  addTearDown(bloc.close);
  final router = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: '/plan',
        builder: (context, state) => const PlanScreen(),
        routes: planSubRoutes,
      ),
    ],
  );
  addTearDown(router.dispose);

  await tester.pumpWidget(
    TranslationProvider(
      child: BlocProvider.value(
        value: bloc,
        child: MaterialApp.router(routerConfig: router),
      ),
    ),
  );
  if (settle) {
    await tester.pumpAndSettle();
  } else {
    await tester.pump();
  }
  return (bloc: bloc, router: router);
}

/// Unfocuses first: a focused field would scroll itself back into view.
Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pumpAndSettle();
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

String fieldText(WidgetTester tester, Finder field) => tester
    .widget<EditableText>(
      find.descendant(of: field, matching: find.byType(EditableText)),
    )
    .controller
    .text;
