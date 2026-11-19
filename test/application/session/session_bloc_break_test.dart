import 'dart:async';

import 'package:clock/clock.dart';
import 'package:ensayo/application/session/session_bloc.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/domain/session/piece_mood.dart';
import 'package:ensayo/domain/session/practice_session.dart';
import 'package:ensayo/domain/session/session_action_status.dart';
import 'package:ensayo/domain/session/session_failure.dart';
import 'package:ensayo/domain/session/session_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/recording_bloc_observer.dart';
import 'session_bloc_break_test.mocks.dart';

const _nocturne = Piece(id: 1, title: 'Nocturne', targetBpm: 120);
const _gigue = Piece(id: 2, title: 'Gigue');
const _etude = Piece(id: 3, title: 'Etude');
const _input = PieceLogInput(
  minutes: 12,
  mood: PieceMood.calm,
  tempoBpm: 120,
  note: 'Keep the input',
);
final _now = DateTime(2026, 11, 19, 12);

PracticeSession _session({
  DateTime? startedAt,
  Set<int> loggedSongIds = const {},
  int completedCount = 0,
  DateTime? lastLoggedAt,
}) {
  return PracticeSession(
    id: 7,
    startedAt: startedAt ?? _now,
    endedAt: null,
    loggedSongIds: loggedSongIds,
    completedCount: completedCount,
    lastLoggedAt: lastLoggedAt,
  );
}

@GenerateNiceMocks([MockSpec<ISessionFacade>(), MockSpec<IPlanFacade>()])
void main() {
  late MockISessionFacade sessionFacade;
  late MockIPlanFacade planFacade;
  late SessionBloc bloc;
  late RecordingBlocObserver observer;
  final storageError = Exception('disk I/O error');

  setUp(() {
    observer = RecordingBlocObserver.install(addTearDown);
    sessionFacade = MockISessionFacade();
    planFacade = MockIPlanFacade();
    bloc = SessionBloc(sessionFacade, planFacade, Clock.fixed(_now));
  });

  tearDown(() => bloc.close());

  Future<void> dispatch(SessionEvent event) async {
    bloc.add(event);
    await pumpEventQueue();
  }

  Future<void> restoreIdle() async {
    when(sessionFacade.getUnfinishedSession()).thenAnswer((_) async => null);
    await dispatch(const SessionEvent.restored());
    expect(bloc.state.status, SessionStatus.idle);
  }

  Future<void> startActive({
    List<Piece> pieces = const [_nocturne, _gigue],
    PracticeSession? session,
  }) async {
    await restoreIdle();
    final started = session ?? _session();
    when(planFacade.getPieces()).thenAnswer((_) async => pieces);
    when(sessionFacade.startSession(any)).thenAnswer((_) async => started);
    await dispatch(const SessionEvent.startRequested());
    expect(bloc.state.status, SessionStatus.active);
  }

  group('SessionBloc adversarial cases', () {
    test(
      'double start and double finish each call the facade only once',
      () async {
        await restoreIdle();
        final started = _session();
        final start = Completer<PracticeSession>();
        when(planFacade.getPieces()).thenAnswer((_) async => [_nocturne]);
        when(sessionFacade.startSession(any)).thenAnswer((_) => start.future);

        bloc.add(const SessionEvent.startRequested());
        bloc.add(const SessionEvent.startRequested());
        await pumpEventQueue();

        verify(sessionFacade.startSession(any)).called(1);
        start.complete(started);
        await pumpEventQueue();
        expect(bloc.state.status, SessionStatus.active);

        final finish = Completer<void>();
        when(
          sessionFacade.finishSession(any, any),
        ).thenAnswer((_) => finish.future);
        bloc.add(const SessionEvent.finishRequested());
        bloc.add(const SessionEvent.finishRequested());
        await pumpEventQueue();

        verify(sessionFacade.finishSession(7, _now)).called(1);
        finish.complete();
        await pumpEventQueue();
        expect(bloc.state.status, SessionStatus.idle);
      },
    );

    test('a failed log keeps the current piece and a retry logs it', () async {
      await startActive();
      when(
        sessionFacade.logPiece(any),
      ).thenAnswer((_) async => throw storageError);

      await dispatch(const SessionEvent.pieceLogged(_input));

      expect(bloc.state.status, SessionStatus.active);
      expect(bloc.state.actionStatus, SessionActionStatus.failure);
      expect(bloc.state.failure, SessionFailure.log);
      expect(bloc.state.currentIndex, 0);
      expect(bloc.state.currentPiece, _nocturne);
      expect(bloc.state.queue, [_nocturne, _gigue]);
      expect(bloc.state.session, _session());
      expect(observer.errors, [storageError]);

      when(sessionFacade.logPiece(any)).thenAnswer((_) async {});
      await dispatch(const SessionEvent.pieceLogged(_input));

      expect(bloc.state.status, SessionStatus.active);
      expect(bloc.state.actionStatus, SessionActionStatus.idle);
      expect(bloc.state.currentIndex, 1);
      expect(bloc.state.currentPiece, _gigue);
      expect(bloc.state.session?.completedCount, 1);
      expect(bloc.state.session?.loggedSongIds, {1});
      verify(sessionFacade.logPiece(any)).called(2);
    });

    test(
      'a resumable session restores its remaining queue and timing',
      () async {
        final startedAt = _now.subtract(const Duration(minutes: 10));
        final lastLoggedAt = _now.subtract(const Duration(minutes: 2));
        final resumable = _session(
          startedAt: startedAt,
          loggedSongIds: const {1},
          completedCount: 1,
          lastLoggedAt: lastLoggedAt,
        );
        when(
          sessionFacade.getUnfinishedSession(),
        ).thenAnswer((_) async => resumable);
        when(
          planFacade.getPieces(),
        ).thenAnswer((_) async => [_nocturne, _gigue, _etude]);

        await dispatch(const SessionEvent.restored());

        expect(bloc.state.status, SessionStatus.active);
        expect(bloc.state.session, resumable);
        expect(bloc.state.queue, [_gigue, _etude]);
        expect(bloc.state.currentIndex, 0);
        expect(bloc.state.currentPiece, _gigue);
        expect(bloc.state.currentSince, lastLoggedAt);
        expect(bloc.state.session?.completedCount, 1);
        verifyNever(sessionFacade.startSession(any));
      },
    );

    test(
      'a stale session with logs finishes at its last logged time',
      () async {
        final startedAt = _now.subtract(const Duration(hours: 13));
        final lastLoggedAt = startedAt.add(const Duration(minutes: 40));
        final stale = _session(
          startedAt: startedAt,
          loggedSongIds: const {1},
          completedCount: 1,
          lastLoggedAt: lastLoggedAt,
        );
        when(
          sessionFacade.getUnfinishedSession(),
        ).thenAnswer((_) async => stale);
        when(sessionFacade.finishSession(any, any)).thenAnswer((_) async {});

        await dispatch(const SessionEvent.restored());

        expect(bloc.state.status, SessionStatus.idle);
        verify(sessionFacade.finishSession(7, lastLoggedAt)).called(1);
        verifyNever(sessionFacade.discardSession(any));
        verifyNever(planFacade.getPieces());
      },
    );

    test('a stale session without logs is discarded', () async {
      final stale = _session(
        startedAt: _now.subtract(const Duration(hours: 13)),
      );
      when(sessionFacade.getUnfinishedSession()).thenAnswer((_) async => stale);
      when(sessionFacade.discardSession(any)).thenAnswer((_) async {});

      await dispatch(const SessionEvent.restored());

      expect(bloc.state.status, SessionStatus.idle);
      verify(sessionFacade.discardSession(7)).called(1);
      verifyNever(sessionFacade.finishSession(any, any));
      verifyNever(planFacade.getPieces());
    });

    test('a start facade failure returns to idle and is reported', () async {
      await restoreIdle();
      when(planFacade.getPieces()).thenAnswer((_) async => [_nocturne]);
      when(
        sessionFacade.startSession(any),
      ).thenAnswer((_) async => throw storageError);

      await dispatch(const SessionEvent.startRequested());

      expect(bloc.state.status, SessionStatus.idle);
      expect(bloc.state.actionStatus, SessionActionStatus.failure);
      expect(bloc.state.failure, SessionFailure.start);
      expect(bloc.state.session, isNull);
      expect(observer.errors, [storageError]);
    });

    test(
      'a finish facade failure keeps the session active for a retry',
      () async {
        await startActive();
        when(
          sessionFacade.finishSession(any, any),
        ).thenAnswer((_) async => throw storageError);

        await dispatch(const SessionEvent.finishRequested());

        expect(bloc.state.status, SessionStatus.active);
        expect(bloc.state.actionStatus, SessionActionStatus.failure);
        expect(bloc.state.failure, SessionFailure.finish);
        expect(bloc.state.session, _session());
        expect(bloc.state.currentPiece, _nocturne);
        expect(observer.errors, [storageError]);
        verify(sessionFacade.finishSession(7, _now)).called(1);
      },
    );

    test('a discard facade failure leaves the session unchanged', () async {
      await startActive();
      when(
        sessionFacade.discardSession(any),
      ).thenAnswer((_) async => throw storageError);

      await dispatch(const SessionEvent.discardRequested());

      expect(bloc.state.status, SessionStatus.active);
      expect(bloc.state.actionStatus, SessionActionStatus.failure);
      expect(bloc.state.failure, SessionFailure.discard);
      expect(bloc.state.session, _session());
      expect(bloc.state.currentIndex, 0);
      expect(bloc.state.currentPiece, _nocturne);
      expect(bloc.state.queue, [_nocturne, _gigue]);
      expect(observer.errors, [storageError]);
      verify(sessionFacade.discardSession(7)).called(1);
    });

    test('skip advances, and skipping past the end is harmless', () async {
      await startActive();

      await dispatch(const SessionEvent.pieceSkipped());

      expect(bloc.state.currentIndex, 1);
      expect(bloc.state.currentPiece, _gigue);
      expect(bloc.state.session?.completedCount, 0);
      expect(bloc.state.isQueueDone, isFalse);

      await dispatch(const SessionEvent.pieceSkipped());

      expect(bloc.state.currentIndex, 2);
      expect(bloc.state.currentPiece, isNull);
      expect(bloc.state.isQueueDone, isTrue);
      expect(bloc.state.status, SessionStatus.active);
      final doneState = bloc.state;

      await dispatch(const SessionEvent.pieceSkipped());

      expect(bloc.state, doneState);
      verifyNever(sessionFacade.logPiece(any));
    });

    test('an empty plan runs as free practice and can still finish', () async {
      await startActive(pieces: const []);
      when(sessionFacade.finishSession(any, any)).thenAnswer((_) async {});

      expect(bloc.state.status, SessionStatus.active);
      expect(bloc.state.queue, isEmpty);
      expect(bloc.state.currentPiece, isNull);
      expect(bloc.state.isFreePractice, isTrue);

      await dispatch(const SessionEvent.finishRequested());

      expect(bloc.state.status, SessionStatus.idle);
      verify(sessionFacade.finishSession(7, _now)).called(1);
      verifyNever(sessionFacade.logPiece(any));
    });
  });
}
