import 'dart:async';

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
  late MockIPlanFacade facade;

  const clairDeLune = Piece(
    id: 2,
    title: 'Clair de Lune',
    composer: 'Debussy',
    targetBpm: 52,
    tags: {FocusTag.technique, FocusTag.repertoire},
  );

  final formIsOpen = find.byType(PieceForm);
  final saveButton = find.text(en.plan.form.save);
  Finder tagChip(String label) => find.widgetWithText(FilterChip, label);
  Finder statusChip(String label) => find.widgetWithText(ChoiceChip, label);

  setUp(() {
    facade = MockIPlanFacade();
    when(facade.getPieces()).thenAnswer((_) async => [clairDeLune]);
  });

  testWidgets('double-tapping save stores the piece only once', (tester) async {
    final save = Completer<Piece>();
    when(facade.savePiece(any)).thenAnswer((_) => save.future);
    await pumpPlanApp(tester, facade, initialLocation: '/plan/new');

    await tester.enterText(titleField, 'Nocturne');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.ensureVisible(saveButton);
    await tester.pumpAndSettle();
    await tester.tap(saveButton);
    await tester.tap(saveButton, warnIfMissed: false); // same frame
    await tester.pump();
    await tester.tap(saveButton, warnIfMissed: false); // next frame
    await tester.pump();
    save.complete(const Piece(id: 3, title: 'Nocturne'));
    await tester.pumpAndSettle();

    verify(facade.savePiece(any)).called(1);
    expect(formIsOpen, findsNothing);
  });

  testWidgets('a failed save keeps every input and a second try succeeds', (
    tester,
  ) async {
    var attempts = 0;
    when(facade.savePiece(any)).thenAnswer((inv) async {
      if (++attempts == 1) throw Exception('disk full');
      return (inv.positionalArguments.single as Piece).copyWith(id: 3);
    });
    await pumpPlanApp(tester, facade, initialLocation: '/plan/new');

    await tester.enterText(titleField, 'Nocturne');
    await tester.enterText(tempoField, '60');
    await tapVisible(tester, statusChip(en.plan.status.polishing));
    await tapVisible(tester, tagChip(en.plan.tag.theory));
    await tapVisible(tester, saveButton);

    expect(find.text(en.plan.failure.save), findsOneWidget);
    expect(formIsOpen, findsOneWidget);
    expect(fieldText(tester, titleField), 'Nocturne');
    expect(fieldText(tester, tempoField), '60');
    expect(
      tester.widget<ChoiceChip>(statusChip(en.plan.status.polishing)).selected,
      isTrue,
    );
    expect(
      tester.widget<FilterChip>(tagChip(en.plan.tag.theory)).selected,
      isTrue,
    );

    await tapVisible(tester, saveButton);

    verify(
      facade.savePiece(
        const Piece(
          title: 'Nocturne',
          status: PieceStatus.polishing,
          targetBpm: 60,
          tags: {FocusTag.theory},
        ),
      ),
    ).called(2);
    expect(formIsOpen, findsNothing);
  });

  testWidgets('a blank title and a tempo of 0 show both errors and store '
      'nothing; fixing them saves the trimmed values', (tester) async {
    when(facade.savePiece(any)).thenAnswer(
      (inv) async => (inv.positionalArguments.single as Piece).copyWith(id: 3),
    );
    await pumpPlanApp(tester, facade, initialLocation: '/plan/new');

    await tester.enterText(titleField, '   ');
    await tester.enterText(tempoField, '0');
    await tapVisible(tester, saveButton);

    expect(find.text(en.plan.validation.titleRequired), findsOneWidget);
    expect(
      find.text(en.plan.validation.bpmOutOfRange(min: 1, max: 300)),
      findsOneWidget,
    );
    verifyNever(facade.savePiece(any));
    expect(formIsOpen, findsOneWidget);

    await tester.enterText(titleField, '  Gigue  ');
    await tester.enterText(tempoField, '300');
    await tapVisible(tester, saveButton);

    verify(
      facade.savePiece(const Piece(title: 'Gigue', targetBpm: 300)),
    ).called(1);
    expect(formIsOpen, findsNothing);
  });

  testWidgets('non-digits typed or pasted into tempo never reach storage', (
    tester,
  ) async {
    await pumpPlanApp(tester, facade, initialLocation: '/plan/new');
    await tester.enterText(titleField, 'Gigue');

    await tester.enterText(tempoField, 'fast');
    expect(fieldText(tester, tempoField), isEmpty);

    await tester.enterText(tempoField, '52.5'); // pasted decimal
    await tapVisible(tester, saveButton);

    expect(
      find.text(en.plan.validation.bpmOutOfRange(min: 1, max: 300)),
      findsOneWidget,
    );
    verifyNever(facade.savePiece(any));
  });

  testWidgets('typing a title and discarding adds nothing', (tester) async {
    await pumpPlanApp(tester, facade, initialLocation: '/plan/new');

    await tester.enterText(titleField, 'Bach');
    await tapVisible(tester, find.text(en.plan.form.discard));

    expect(formIsOpen, findsNothing);
    expect(find.text('Bach'), findsNothing);
    verifyNever(facade.savePiece(any));
  });

  testWidgets('editing: changing status, removing a tag and clearing the '
      'tempo saves exactly that', (tester) async {
    when(
      facade.savePiece(any),
    ).thenAnswer((inv) async => inv.positionalArguments.single as Piece);
    await pumpPlanApp(tester, facade, initialLocation: '/plan/2');

    expect(fieldText(tester, titleField), 'Clair de Lune');
    expect(fieldText(tester, composerField), 'Debussy');
    expect(fieldText(tester, tempoField), '52');

    await tester.enterText(tempoField, '');
    await tapVisible(tester, statusChip(en.plan.status.polishing));
    await tapVisible(tester, tagChip(en.plan.tag.repertoire));
    await tapVisible(tester, saveButton);

    verify(
      facade.savePiece(
        const Piece(
          id: 2,
          title: 'Clair de Lune',
          composer: 'Debussy',
          status: PieceStatus.polishing,
          tags: {FocusTag.technique},
        ),
      ),
    ).called(1);
    expect(formIsOpen, findsNothing);
  });

  testWidgets('cancelling the delete confirmation keeps the piece and the '
      'form', (tester) async {
    await pumpPlanApp(tester, facade, initialLocation: '/plan/2');

    await tapVisible(tester, find.text(en.plan.form.delete));
    await tester.tap(find.text(en.plan.deleteDialog.cancel));
    await tester.pumpAndSettle();

    verifyNever(facade.deletePiece(any));
    expect(formIsOpen, findsOneWidget);
    expect(fieldText(tester, titleField), 'Clair de Lune');
  });

  testWidgets('a failed delete shows a message, stays on the form and leaves '
      'the plan unchanged', (tester) async {
    when(facade.deletePiece(2)).thenAnswer((_) async => throw Exception('db'));
    await pumpPlanApp(tester, facade, initialLocation: '/plan/2');

    await tapVisible(tester, find.text(en.plan.form.delete));
    await tester.tap(find.text(en.plan.deleteDialog.confirm));
    await tester.pumpAndSettle();

    expect(find.text(en.plan.failure.delete), findsOneWidget);
    expect(formIsOpen, findsOneWidget);

    await tapVisible(tester, find.text(en.plan.form.discard));
    expect(find.text('Clair de Lune'), findsOneWidget);
  });

  testWidgets('opening a piece before the plan has loaded waits, then '
      'prefills the form', (tester) async {
    final load = Completer<List<Piece>>();
    when(facade.getPieces()).thenAnswer((_) => load.future);
    await pumpPlanApp(
      tester,
      facade,
      initialLocation: '/plan/2',
      settle: false,
    );

    expect(find.byType(CircularProgressIndicator), findsWidgets);
    expect(titleField, findsNothing);

    load.complete([clairDeLune]);
    await tester.pumpAndSettle();

    expect(fieldText(tester, titleField), 'Clair de Lune');
    expect(find.text(en.plan.form.delete), findsOneWidget);
  });
}
