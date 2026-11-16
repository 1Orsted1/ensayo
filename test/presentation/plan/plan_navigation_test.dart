import 'package:ensayo/presentation/plan/piece_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/plan_mocks.dart';
import '../../helpers/plan_widget_harness.dart';

void main() {
  testWidgets('the + button opens the empty Add Piece form', (tester) async {
    final facade = MockIPlanFacade();
    when(facade.getPieces()).thenAnswer((_) async => []);
    await pumpPlanApp(tester, facade);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(PieceForm), findsOneWidget);
    expect(find.text(en.plan.form.addTitle), findsWidgets);
    expect(fieldText(tester, titleField), isEmpty);
    expect(find.text(en.plan.form.delete), findsNothing);
  });
}
