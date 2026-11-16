import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/presentation/plan/piece_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/plan_mocks.dart';
import '../../helpers/plan_widget_harness.dart';

void main() {
  // Spec: Add a piece / Add with all fields.
  testWidgets('adding a piece with every field stores it and returns to the '
      'plan with the piece on top', (tester) async {
    final facade = MockIPlanFacade();
    var stored = <Piece>[const Piece(id: 1, title: 'Gigue')];
    when(facade.getPieces()).thenAnswer((_) async => stored);
    const expected = Piece(
      title: 'Clair de Lune',
      composer: 'Debussy',
      status: PieceStatus.learning,
      targetBpm: 52,
      tags: {FocusTag.technique, FocusTag.repertoire},
    );
    when(facade.savePiece(any)).thenAnswer((inv) async {
      final saved = (inv.positionalArguments.single as Piece).copyWith(id: 2);
      stored = [saved, ...stored];
      return saved;
    });
    await pumpPlanApp(tester, facade, initialLocation: '/plan/new');

    await tester.enterText(titleField, 'Clair de Lune');
    await tester.enterText(composerField, 'Debussy');
    await tester.enterText(tempoField, '52');
    await tapVisible(
      tester,
      find.widgetWithText(FilterChip, en.plan.tag.technique),
    );
    await tapVisible(
      tester,
      find.widgetWithText(FilterChip, en.plan.tag.repertoire),
    );
    await tapVisible(tester, find.text(en.plan.form.save));

    verify(facade.savePiece(expected)).called(1);
    expect(find.byType(PieceForm), findsNothing);
    final titles = find.descendant(
      of: find.byType(Card),
      matching: find.textContaining(RegExp(r'^(Clair de Lune|Gigue)$')),
    );
    expect(tester.widgetList<Text>(titles).map((t) => t.data), [
      'Clair de Lune',
      'Gigue',
    ]);
  });
}
