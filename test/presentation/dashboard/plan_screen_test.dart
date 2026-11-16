import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/dashboard/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'plan_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IPlanFacade>()])
void main() {
  late MockIPlanFacade facade;
  late PlanBloc bloc;
  final t = AppLocale.en.buildSync();

  const clairDeLune = Piece(
    id: 2,
    title: 'Clair de Lune',
    composer: 'Debussy',
    targetBpm: 52,
    tags: {FocusTag.technique},
  );
  const gigue = Piece(id: 1, title: 'Gigue', status: PieceStatus.archived);

  setUp(() => facade = MockIPlanFacade());

  tearDown(() => bloc.close());

  /// The bloc is created here, inside the widget test's fake-async zone, so
  /// its event handling advances with `pump`.
  Future<void> pumpPlan(WidgetTester tester) async {
    bloc = PlanBloc(facade)..add(const PlanStarted());
    await tester.pumpWidget(
      TranslationProvider(
        child: BlocProvider.value(
          value: bloc,
          child: const MaterialApp(home: PlanScreen()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('an empty plan shows the calm prompt and an add action', (
    tester,
  ) async {
    when(facade.getPieces()).thenAnswer((_) async => []);

    await pumpPlan(tester);

    expect(find.text(t.plan.empty.title), findsOneWidget);
    expect(find.text(t.plan.empty.action), findsOneWidget);
  });

  testWidgets(
    'a piece card shows title, composer, status pill, tempo and tags',
    (tester) async {
      when(facade.getPieces()).thenAnswer((_) async => [clairDeLune]);

      await pumpPlan(tester);

      expect(find.text('Clair de Lune'), findsOneWidget);
      expect(find.text('Debussy'), findsOneWidget);
      expect(find.text(t.plan.status.learning.toUpperCase()), findsOneWidget);
      expect(find.text('52'), findsOneWidget);
      expect(find.text(t.plan.bpmUnit), findsOneWidget);
      expect(find.text(t.plan.tag.technique), findsOneWidget);
    },
  );

  testWidgets('tapping the Archived chip shows only archived pieces', (
    tester,
  ) async {
    when(facade.getPieces()).thenAnswer((_) async => [clairDeLune, gigue]);
    await pumpPlan(tester);
    expect(find.text('Gigue'), findsNothing);

    await tester.tap(find.widgetWithText(ChoiceChip, t.plan.status.archived));
    await tester.pumpAndSettle();

    expect(find.text('Gigue'), findsOneWidget);
    expect(find.text('Clair de Lune'), findsNothing);
  });

  testWidgets('a filter with no matches says so and keeps the chips', (
    tester,
  ) async {
    when(facade.getPieces()).thenAnswer((_) async => [clairDeLune]);
    await pumpPlan(tester);

    await tester.tap(find.widgetWithText(ChoiceChip, t.plan.status.polishing));
    await tester.pumpAndSettle();

    expect(find.text(t.plan.empty.noMatches), findsOneWidget);
    expect(find.byType(ChoiceChip), findsNWidgets(PlanFilter.values.length));
  });

  testWidgets('a failed load shows a message, and Try again reloads', (
    tester,
  ) async {
    when(facade.getPieces()).thenAnswer((_) async => throw Exception('db'));
    await pumpPlan(tester);
    expect(find.text(t.plan.failure.load), findsOneWidget);

    when(facade.getPieces()).thenAnswer((_) async => [clairDeLune]);
    await tester.tap(find.text(t.plan.failure.retry));
    await tester.pumpAndSettle();

    expect(find.text('Clair de Lune'), findsOneWidget);
    verify(facade.getPieces()).called(2);
  });
}
