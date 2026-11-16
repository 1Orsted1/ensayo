import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/presentation/plan/piece_form.dart';
import 'package:ensayo/presentation/plan/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/plan_mocks.dart';
import '../../helpers/plan_widget_harness.dart';

void main() {
  late MockIPlanFacade facade;
  late List<Piece> stored;

  const gigue = Piece(id: 1, title: 'Gigue', status: PieceStatus.polishing);
  const nocturne = Piece(
    id: 2,
    title: 'Nocturne',
    status: PieceStatus.polishing,
  );

  final formIsOpen = find.byType(PieceForm);
  final planIsShown = find.byType(PlanScreen);

  /// In-memory, so the plan reflects each write.
  setUp(() {
    stored = [nocturne, gigue];
    facade = MockIPlanFacade();
    when(facade.getPieces()).thenAnswer((_) async => [...stored]);
    when(facade.savePiece(any)).thenAnswer((inv) async {
      final piece = inv.positionalArguments.single as Piece;
      stored = [for (final p in stored) p.id == piece.id ? piece : p];
      return piece;
    });
    when(facade.deletePiece(any)).thenAnswer((inv) async {
      final id = inv.positionalArguments.single as int;
      stored = stored.where((p) => p.id != id).toList();
    });
  });

  testWidgets('a non-numeric id such as /plan/abc lands on the plan', (
    tester,
  ) async {
    await pumpPlanApp(tester, facade, initialLocation: '/plan/abc');

    expect(tester.takeException(), isNull);
    expect(formIsOpen, findsNothing);
    expect(find.text('Nocturne'), findsOneWidget);
  });

  testWidgets('an id that does not exist goes back to the plan instead of '
      'an empty edit form', (tester) async {
    final app = await pumpPlanApp(tester, facade);

    app.router.push('/plan/999');
    await tester.pumpAndSettle();

    expect(formIsOpen, findsNothing);
    expect(planIsShown, findsOneWidget);
  });

  testWidgets('tapping a card opens that piece prefilled', (tester) async {
    await pumpPlanApp(tester, facade);

    await tester.tap(find.text('Gigue'));
    await tester.pumpAndSettle();

    expect(find.text(en.plan.form.editTitle), findsOneWidget);
    expect(fieldText(tester, titleField), 'Gigue');
  });

  testWidgets('a confirmed delete returns to the plan without the piece, and '
      'reopening the deleted id goes back again', (tester) async {
    final app = await pumpPlanApp(tester, facade);
    await tester.tap(find.text('Gigue'));
    await tester.pumpAndSettle();

    await tapVisible(tester, find.text(en.plan.form.delete));
    await tester.tap(find.text(en.plan.deleteDialog.confirm));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(formIsOpen, findsNothing);
    expect(find.text('Gigue'), findsNothing);
    expect(find.text('Nocturne'), findsOneWidget);

    app.router.push('/plan/1'); // e.g. a stale link or restored route
    await tester.pumpAndSettle();

    expect(formIsOpen, findsNothing);
    expect(find.text('Nocturne'), findsOneWidget);
  });

  testWidgets('under Polishing, editing a piece to Performance Ready moves it '
      'out of the list on return', (tester) async {
    await pumpPlanApp(tester, facade);
    await tester.tap(find.widgetWithText(ChoiceChip, en.plan.status.polishing));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Gigue'));
    await tester.pumpAndSettle();

    await tapVisible(
      tester,
      find.widgetWithText(ChoiceChip, en.plan.status.performanceReady),
    );
    await tapVisible(tester, find.text(en.plan.form.save));

    expect(formIsOpen, findsNothing);
    expect(find.text('Gigue'), findsNothing);
    expect(find.text('Nocturne'), findsOneWidget);
    final polishing = tester.widget<ChoiceChip>(
      find.widgetWithText(ChoiceChip, en.plan.status.polishing),
    );
    expect(polishing.selected, isTrue);
  });

  testWidgets('the app bar back button leaves the form without saving', (
    tester,
  ) async {
    await pumpPlanApp(tester, facade);
    await tester.tap(find.text('Gigue'));
    await tester.pumpAndSettle();
    await tester.enterText(titleField, 'Gigue in G');

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(formIsOpen, findsNothing);
    expect(find.text('Gigue'), findsOneWidget);
    verifyNever(facade.savePiece(any));
  });
}
