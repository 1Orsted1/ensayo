import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/piece_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'piece_form_screen_test.mocks.dart';

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
    tags: {FocusTag.technique, FocusTag.repertoire},
  );

  setUp(() {
    facade = MockIPlanFacade();
    when(facade.getPieces()).thenAnswer((_) async => [clairDeLune]);
  });

  tearDown(() => bloc.close());

  /// Opens the form on top of a placeholder page, so popping can be observed.
  Future<void> openForm(WidgetTester tester, {int? pieceId}) async {
    // A phone-sized viewport (the 390 pt design width).
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    bloc = PlanBloc(facade)..add(const PlanStarted());
    await tester.pumpWidget(
      TranslationProvider(
        child: BlocProvider.value(
          value: bloc,
          child: MaterialApp(
            home: Builder(
              builder: (context) => TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => PieceFormScreen(pieceId: pieceId),
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  /// Closes the keyboard (a focused field would scroll itself back into
  /// view), then scrolls to [finder] and taps it.
  Future<void> tapVisible(WidgetTester tester, Finder finder) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  final titleField = find.byKey(const ValueKey('piece-title'));
  final tempoField = find.byKey(const ValueKey('piece-tempo'));
  final formIsOpen = find.byType(PieceFormScreen);

  testWidgets('invalid input shows errors and stores nothing', (tester) async {
    await openForm(tester);

    await tester.enterText(titleField, '   ');
    await tester.enterText(tempoField, '301');
    await tapVisible(tester, find.text(t.plan.form.save));

    expect(find.text(t.plan.validation.titleRequired), findsOneWidget);
    expect(
      find.text(t.plan.validation.bpmOutOfRange(min: 1, max: 300)),
      findsOneWidget,
    );
    verifyNever(facade.savePiece(any));
    expect(formIsOpen, findsOneWidget);
  });

  testWidgets('saving a new piece sends the trimmed title and closes', (
    tester,
  ) async {
    const expected = Piece(title: 'Gigue');
    when(
      facade.savePiece(expected),
    ).thenAnswer((_) async => expected.copyWith(id: 3));
    await openForm(tester);

    await tester.enterText(titleField, '  Gigue  ');
    await tapVisible(tester, find.text(t.plan.form.save));

    verify(facade.savePiece(expected)).called(1);
    expect(formIsOpen, findsNothing);
  });

  testWidgets('editing prefills the form with the piece', (tester) async {
    await openForm(tester, pieceId: 2);

    expect(find.text(t.plan.form.editTitle), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Clair de Lune'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Debussy'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, '52'), findsOneWidget);
    final learningChip = tester.widget<ChoiceChip>(
      find.widgetWithText(ChoiceChip, t.plan.status.learning),
    );
    expect(learningChip.selected, isTrue);
    final theoryChip = tester.widget<FilterChip>(
      find.widgetWithText(FilterChip, t.plan.tag.theory),
    );
    expect(theoryChip.selected, isFalse);
  });

  testWidgets('a failed save keeps the input and shows a message', (
    tester,
  ) async {
    when(facade.savePiece(any)).thenAnswer((_) async => throw Exception('db'));
    await openForm(tester);

    await tester.enterText(titleField, 'Nocturne');
    await tapVisible(tester, find.text(t.plan.form.save));

    expect(find.text(t.plan.failure.save), findsOneWidget);
    expect(formIsOpen, findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Nocturne'), findsOneWidget);
  });

  testWidgets('confirming delete removes the piece and closes', (tester) async {
    when(facade.deletePiece(2)).thenAnswer((_) async {});
    await openForm(tester, pieceId: 2);

    await tapVisible(tester, find.text(t.plan.form.delete));
    await tester.tap(find.text(t.plan.deleteDialog.confirm));
    await tester.pumpAndSettle();

    verify(facade.deletePiece(2)).called(1);
    expect(formIsOpen, findsNothing);
  });

  testWidgets('cancelling delete keeps the piece and the form', (tester) async {
    await openForm(tester, pieceId: 2);

    await tapVisible(tester, find.text(t.plan.form.delete));
    await tester.tap(find.text(t.plan.deleteDialog.cancel));
    await tester.pumpAndSettle();

    verifyNever(facade.deletePiece(any));
    expect(formIsOpen, findsOneWidget);
  });
}
