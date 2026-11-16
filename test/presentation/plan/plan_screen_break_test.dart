import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/plan_mocks.dart';
import '../../helpers/plan_widget_harness.dart';

void main() {
  late MockIPlanFacade facade;

  const learning = Piece(id: 2, title: 'Nocturne', composer: 'Chopin');
  const archived = Piece(
    id: 1,
    title: 'Old etude',
    status: PieceStatus.archived,
  );

  setUp(() => facade = MockIPlanFacade());

  Finder chip(String label) => find.widgetWithText(ChoiceChip, label);

  testWidgets('a failed load shows the message and retry instead of an empty '
      'plan, and retry recovers', (tester) async {
    when(facade.getPieces()).thenAnswer((_) async => throw Exception('db'));
    await pumpPlanApp(tester, facade);

    expect(find.text(en.plan.failure.load), findsOneWidget);
    expect(find.text(en.plan.empty.title), findsNothing);

    when(facade.getPieces()).thenAnswer((_) async => [learning]);
    await tester.tap(find.text(en.plan.failure.retry));
    await tester.pumpAndSettle();

    expect(find.text(en.plan.failure.load), findsNothing);
    expect(find.text('Nocturne'), findsOneWidget);
  });

  testWidgets('an empty plan shows the calm prompt with an add action', (
    tester,
  ) async {
    when(facade.getPieces()).thenAnswer((_) async => []);
    await pumpPlanApp(tester, facade);

    expect(find.text(en.plan.empty.title), findsOneWidget);
    expect(find.text(en.plan.empty.action), findsOneWidget);
    expect(find.text(en.plan.empty.noMatches), findsNothing);
  });

  testWidgets('a filter with no matches says so and keeps the chips visible', (
    tester,
  ) async {
    when(facade.getPieces()).thenAnswer((_) async => [learning]);
    await pumpPlanApp(tester, facade);

    await tester.tap(chip(en.plan.status.polishing));
    await tester.pumpAndSettle();

    expect(find.text(en.plan.empty.noMatches), findsOneWidget);
    expect(find.text(en.plan.empty.title), findsNothing);
    expect(find.byType(ChoiceChip), findsNWidgets(5));
    expect(
      tester.widget<ChoiceChip>(chip(en.plan.status.polishing)).selected,
      isTrue,
    );
  });

  testWidgets('All is selected by default and hides archived pieces; '
      'Archived shows only them', (tester) async {
    when(facade.getPieces()).thenAnswer((_) async => [learning, archived]);
    await pumpPlanApp(tester, facade);

    expect(
      tester.widget<ChoiceChip>(chip(en.plan.filter.all)).selected,
      isTrue,
    );
    expect(find.text('Nocturne'), findsOneWidget);
    expect(find.text('Old etude'), findsNothing);

    await tester.tap(chip(en.plan.status.archived));
    await tester.pumpAndSettle();

    expect(find.text('Old etude'), findsOneWidget);
    expect(find.text('Nocturne'), findsNothing);
  });

  testWidgets('a plan holding only archived pieces under All is "no matches", '
      'not the first-run prompt', (tester) async {
    when(facade.getPieces()).thenAnswer((_) async => [archived]);
    await pumpPlanApp(tester, facade);

    expect(find.text(en.plan.empty.noMatches), findsOneWidget);
    expect(find.text('Old etude'), findsNothing);
  });

  testWidgets('a piece with no composer or tempo shows no placeholders', (
    tester,
  ) async {
    when(
      facade.getPieces(),
    ).thenAnswer((_) async => const [Piece(id: 1, title: 'Bach')]);
    await pumpPlanApp(tester, facade);

    final card = find.byType(Card);
    final texts = tester
        .widgetList<Text>(
          find.descendant(of: card, matching: find.byType(Text)),
        )
        .map((t) => t.data)
        .toList();
    expect(texts, ['Bach', en.plan.status.learning.toUpperCase()]);
  });

  testWidgets('the longest allowed title and composer with unicode render on '
      'a phone without overflowing', (tester) async {
    when(facade.getPieces()).thenAnswer(
      (_) async => [
        Piece(
          id: 1,
          title: '荒城の月 Gymnopédie ${'W' * 59}',
          composer: 'Ñ' * 60,
          status: PieceStatus.performanceReady,
          targetBpm: 300,
          tags: {...FocusTag.values},
        ),
      ],
    );
    await pumpPlanApp(tester, facade);

    expect(tester.takeException(), isNull);
    expect(find.text('300'), findsOneWidget);
  });

  testWidgets('in Spanish the list shows statuses and tags in Spanish', (
    tester,
  ) async {
    // Spanish strings are a deferred library, so load them for real.
    final es = (await tester.runAsync(() => AppLocale.es.build()))!;
    await tester.runAsync(() => LocaleSettings.setLocale(AppLocale.es));
    addTearDown(() => LocaleSettings.setLocaleSync(AppLocale.en));
    when(facade.getPieces()).thenAnswer(
      (_) async => const [
        Piece(id: 1, title: 'Gigue', tags: {FocusTag.sightReading}),
      ],
    );
    await pumpPlanApp(tester, facade);

    expect(find.text(es.plan.status.learning.toUpperCase()), findsOneWidget);
    expect(find.text(es.plan.tag.sightReading), findsOneWidget);
    expect(find.text(en.plan.tag.sightReading), findsNothing);
    expect(find.text(es.plan.status.performanceReady), findsOneWidget); // chip
  });
}
