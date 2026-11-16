import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/plan_mocks.dart';
import '../../helpers/plan_widget_harness.dart';

void main() {
  // Spec: Plan list (each item shows title, composer, status pill, tempo with
  // its unit, and focus tags).
  testWidgets('a piece shows as a card with all its values', (tester) async {
    final facade = MockIPlanFacade();
    when(facade.getPieces()).thenAnswer(
      (_) async => const [
        Piece(
          id: 1,
          title: 'Clair de Lune',
          composer: 'Debussy',
          targetBpm: 52,
          tags: {FocusTag.technique, FocusTag.repertoire},
        ),
      ],
    );

    await pumpPlanApp(tester, facade);

    final card = find.byType(Card);
    Finder inCard(String text) =>
        find.descendant(of: card, matching: find.text(text));
    expect(inCard('Clair de Lune'), findsOneWidget);
    expect(inCard('Debussy'), findsOneWidget);
    expect(inCard(en.plan.status.learning.toUpperCase()), findsOneWidget);
    expect(inCard('52'), findsOneWidget);
    expect(inCard(en.plan.bpmUnit), findsOneWidget);
    expect(inCard(en.plan.tag.technique), findsOneWidget);
    expect(inCard(en.plan.tag.repertoire), findsOneWidget);
  });
}
