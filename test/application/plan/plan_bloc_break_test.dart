import 'dart:async';

import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/domain/plan/plan_action_status.dart';
import 'package:ensayo/domain/plan/plan_filter.dart';
import 'package:ensayo/domain/plan/plan_load_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/plan_mocks.dart';
import '../../helpers/recording_bloc_observer.dart';

void main() {
  late MockIPlanFacade facade;
  late PlanBloc bloc;
  late RecordingBlocObserver observer;

  const gigue = Piece(id: 1, title: 'Gigue');
  const nocturne = Piece(id: 2, title: 'Nocturne');
  const archived = Piece(
    id: 3,
    title: 'Old etude',
    status: PieceStatus.archived,
  );
  final storageError = Exception('disk I/O error');

  setUp(() {
    observer = RecordingBlocObserver.install(addTearDown);
    facade = MockIPlanFacade();
    bloc = PlanBloc(facade);
  });
  tearDown(() => bloc.close());

  Future<void> dispatch(PlanEvent event) async {
    bloc.add(event);
    await pumpEventQueue();
  }

  Future<void> loadWith(List<Piece> pieces) async {
    when(facade.getPieces()).thenAnswer((_) async => pieces);
    await dispatch(const PlanEvent.started());
  }

  test('a failed load ends in failure (not an empty plan), is reported, and '
      'a retry recovers', () async {
    when(facade.getPieces()).thenAnswer((_) async => throw storageError);
    await dispatch(const PlanEvent.started());

    expect(bloc.state.loadStatus, PlanLoadStatus.failure);
    expect(observer.errors, [storageError]);

    await loadWith([gigue]);

    expect(bloc.state.loadStatus, PlanLoadStatus.loaded);
    expect(bloc.state.pieces, [gigue]);
  });

  test('a failed save reports failure, is reported, and leaves the list as '
      'it was', () async {
    await loadWith([gigue]);
    when(facade.savePiece(any)).thenAnswer((_) async => throw storageError);

    await dispatch(const PlanEvent.pieceSaved(Piece(title: 'Nocturne')));

    expect(bloc.state.actionStatus, PlanActionStatus.failure);
    expect(bloc.state.pieces, [gigue]);
    expect(bloc.state.loadStatus, PlanLoadStatus.loaded);
    expect(observer.errors, [storageError]);
  });

  test('a failed delete reports failure and keeps the piece', () async {
    await loadWith([gigue, nocturne]);
    when(facade.deletePiece(1)).thenAnswer((_) async => throw storageError);

    await dispatch(const PlanEvent.pieceDeleted(1));

    expect(bloc.state.actionStatus, PlanActionStatus.failure);
    expect(bloc.state.pieces, [gigue, nocturne]);
    expect(observer.errors, [storageError]);
  });

  test('a save that is stored but whose reload fails still reports success, '
      'with the list in load failure', () async {
    await loadWith([gigue]);
    when(facade.savePiece(any)).thenAnswer((_) async => nocturne);
    when(facade.getPieces()).thenAnswer((_) async => throw storageError);

    await dispatch(const PlanEvent.pieceSaved(Piece(title: 'Nocturne')));

    expect(bloc.state.actionStatus, PlanActionStatus.success);
    expect(bloc.state.loadStatus, PlanLoadStatus.failure);
    expect(observer.errors, [storageError]);
  });

  test('two saves in a row each pass through in-progress to success, so a '
      'second form also sees its result', () async {
    await loadWith([]);
    when(facade.savePiece(any)).thenAnswer(
      (inv) async => (inv.positionalArguments.single as Piece).copyWith(id: 9),
    );
    final statuses = <PlanActionStatus>[];
    final sub = bloc.stream
        .map((s) => s.actionStatus)
        .distinct()
        .listen(statuses.add);
    addTearDown(sub.cancel);

    when(facade.getPieces()).thenAnswer((_) async => [gigue]);
    await dispatch(const PlanEvent.pieceSaved(Piece(title: 'Gigue')));
    when(facade.getPieces()).thenAnswer((_) async => [nocturne, gigue]);
    await dispatch(const PlanEvent.pieceSaved(Piece(title: 'Nocturne')));

    expect(statuses, [
      PlanActionStatus.inProgress,
      PlanActionStatus.success,
      PlanActionStatus.inProgress,
      PlanActionStatus.success,
    ]);
    expect(bloc.state.pieces, [nocturne, gigue]);
  });

  test('a save after a failed one can still succeed', () async {
    await loadWith([]);
    when(facade.savePiece(any)).thenAnswer((_) async => throw storageError);
    await dispatch(const PlanEvent.pieceSaved(Piece(title: 'Gigue')));

    when(facade.savePiece(any)).thenAnswer((_) async => gigue);
    when(facade.getPieces()).thenAnswer((_) async => [gigue]);
    await dispatch(const PlanEvent.pieceSaved(Piece(title: 'Gigue')));

    expect(bloc.state.actionStatus, PlanActionStatus.success);
    expect(bloc.state.pieces, [gigue]);
  });

  test('changing the filter while the plan is still loading keeps that '
      'filter once the pieces arrive', () async {
    final load = Completer<List<Piece>>();
    when(facade.getPieces()).thenAnswer((_) => load.future);
    bloc.add(const PlanEvent.started());
    await pumpEventQueue();

    await dispatch(const PlanEvent.filterChanged(PlanFilter.archived));
    load.complete([gigue, archived]);
    await pumpEventQueue();

    expect(bloc.state.loadStatus, PlanLoadStatus.loaded);
    expect(bloc.state.filter, PlanFilter.archived);
    expect(bloc.state.visiblePieces, [archived]);
  });
}
