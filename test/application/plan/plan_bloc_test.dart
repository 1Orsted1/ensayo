import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'plan_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IPlanFacade>()])
void main() {
  late MockIPlanFacade facade;
  late PlanBloc bloc;

  const learning = Piece(id: 2, title: 'Gigue', status: PieceStatus.learning);
  const archived = Piece(id: 1, title: 'Old', status: PieceStatus.archived);

  /// Adds [event] and lets every handler finish.
  Future<void> dispatch(PlanEvent event) async {
    bloc.add(event);
    await pumpEventQueue();
  }

  setUp(() {
    facade = MockIPlanFacade();
    bloc = PlanBloc(facade);
  });

  tearDown(() => bloc.close());

  group('loading', () {
    test('PlanStarted loads the pieces', () async {
      when(facade.getPieces()).thenAnswer((_) async => [learning]);

      await dispatch(const PlanStarted());

      expect(bloc.state.loadStatus, PlanLoadStatus.loaded);
      expect(bloc.state.pieces, [learning]);
    });

    test('a failed load ends in the failure status', () async {
      when(facade.getPieces()).thenAnswer((_) async => throw Exception('db'));

      await dispatch(const PlanStarted());

      expect(bloc.state.loadStatus, PlanLoadStatus.failure);
      expect(bloc.state.pieces, isEmpty);
    });

    test('PlanStarted after a failure retries the load', () async {
      when(facade.getPieces()).thenAnswer((_) async => throw Exception('db'));
      await dispatch(const PlanStarted());

      when(facade.getPieces()).thenAnswer((_) async => [learning]);
      await dispatch(const PlanStarted());

      expect(bloc.state.loadStatus, PlanLoadStatus.loaded);
      expect(bloc.state.pieces, [learning]);
      verify(facade.getPieces()).called(2);
    });
  });

  group('filtering', () {
    setUp(() async {
      when(facade.getPieces()).thenAnswer((_) async => [learning, archived]);
      await dispatch(const PlanStarted());
    });

    test('the default All filter hides archived pieces', () {
      expect(bloc.state.filter, PlanFilter.all);
      expect(bloc.state.visiblePieces, [learning]);
    });

    test('the Archived filter shows only archived pieces', () async {
      await dispatch(const PlanFilterChanged(PlanFilter.archived));

      expect(bloc.state.visiblePieces, [archived]);
    });
  });

  group('saving', () {
    const draft = Piece(title: 'Nocturne');

    test('a successful save reloads the list and reports success', () async {
      when(
        facade.savePiece(draft),
      ).thenAnswer((_) async => draft.copyWith(id: 3));
      when(
        facade.getPieces(),
      ).thenAnswer((_) async => [draft.copyWith(id: 3), learning]);

      await dispatch(const PlanPieceSaved(draft));

      expect(bloc.state.actionStatus, PlanActionStatus.success);
      expect(bloc.state.pieces.first.title, 'Nocturne');
      verify(facade.savePiece(draft)).called(1);
    });

    test('a failed save keeps the pieces and reports failure', () async {
      when(facade.getPieces()).thenAnswer((_) async => [learning]);
      await dispatch(const PlanStarted());
      when(facade.savePiece(any)).thenAnswer((_) async => throw Exception());

      await dispatch(const PlanPieceSaved(draft));

      expect(bloc.state.actionStatus, PlanActionStatus.failure);
      expect(bloc.state.pieces, [learning]);
    });
  });

  group('deleting', () {
    setUp(() async {
      when(facade.getPieces()).thenAnswer((_) async => [learning]);
      await dispatch(const PlanStarted());
    });

    test('a successful delete reloads the list and reports success', () async {
      when(facade.deletePiece(2)).thenAnswer((_) async {});
      when(facade.getPieces()).thenAnswer((_) async => []);

      await dispatch(const PlanPieceDeleted(2));

      expect(bloc.state.actionStatus, PlanActionStatus.success);
      expect(bloc.state.pieces, isEmpty);
    });

    test('a failed delete leaves the plan unchanged', () async {
      when(facade.deletePiece(2)).thenAnswer((_) async => throw Exception());

      await dispatch(const PlanPieceDeleted(2));

      expect(bloc.state.actionStatus, PlanActionStatus.failure);
      expect(bloc.state.pieces, [learning]);
    });
  });
}
