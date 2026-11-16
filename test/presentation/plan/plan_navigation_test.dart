import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/core/app_router.dart';
import 'package:ensayo/presentation/dashboard/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'plan_navigation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IPlanFacade>()])
void main() {
  late MockIPlanFacade facade;
  late PlanBloc bloc;
  final t = AppLocale.en.buildSync();

  const clairDeLune = Piece(id: 2, title: 'Clair de Lune', composer: 'Debussy');

  setUp(() {
    facade = MockIPlanFacade();
    when(facade.getPieces()).thenAnswer((_) async => [clairDeLune]);
  });

  tearDown(() => bloc.close());

  /// The plan route with the app's real add/edit sub-routes.
  Future<void> pumpPlanRouter(WidgetTester tester) async {
    bloc = PlanBloc(facade)..add(const PlanStarted());
    final router = GoRouter(
      initialLocation: '/plan',
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
    await tester.pumpAndSettle();
  }

  testWidgets('the + button opens the empty Add Piece form', (tester) async {
    await pumpPlanRouter(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text(t.plan.form.addTitle), findsOneWidget);
    expect(find.text(t.plan.form.delete), findsNothing);
  });

  testWidgets('tapping a card opens the form prefilled with that piece', (
    tester,
  ) async {
    await pumpPlanRouter(tester);

    await tester.tap(find.text('Clair de Lune'));
    await tester.pumpAndSettle();

    expect(find.text(t.plan.form.editTitle), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Clair de Lune'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Debussy'), findsOneWidget);
  });
}
