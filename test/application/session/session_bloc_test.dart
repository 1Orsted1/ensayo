import 'package:clock/clock.dart';
import 'package:ensayo/application/session/session_bloc.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/domain/session/piece_mood.dart';
import 'package:ensayo/domain/session/practice_session.dart';
import 'package:ensayo/domain/session/session_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'session_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ISessionFacade>(),
  MockSpec<IPlanFacade>(),
])
void main() {
  test('start, log, and finish move through active to idle and finish once',
      () async {
    final now = DateTime(2026, 11, 19, 12);
    final sessionFacade = MockISessionFacade();
    final planFacade = MockIPlanFacade();
    final bloc = SessionBloc(sessionFacade, planFacade);
    addTearDown(bloc.close);

    const nocturne = Piece(id: 1, title: 'Nocturne', targetBpm: 120);
    const gigue = Piece(id: 2, title: 'Gigue');
    final session = PracticeSession(
      id: 7,
      startedAt: now,
      endedAt: null,
      loggedSongIds: const {},
      completedCount: 0,
      lastLoggedAt: null,
    );

    await withClock(Clock.fixed(now), () async {
      when(sessionFacade.getUnfinishedSession()).thenAnswer((_) async => null);
      bloc.add(const SessionEvent.restored());
      await pumpEventQueue();
      expect(bloc.state.status, SessionStatus.idle);

      final statuses = <SessionStatus>[];
      final subscription = bloc.stream
          .map((state) => state.status)
          .distinct()
          .listen(statuses.add);
      addTearDown(subscription.cancel);

      when(planFacade.getPieces()).thenAnswer((_) async => [nocturne, gigue]);
      when(sessionFacade.startSession(any)).thenAnswer((_) async => session);
      when(sessionFacade.logPiece(any)).thenAnswer((_) async {});
      when(sessionFacade.finishSession(any, any)).thenAnswer((_) async {});

      bloc.add(const SessionEvent.startRequested());
      await pumpEventQueue();

      expect(bloc.state.status, SessionStatus.active);
      expect(bloc.state.currentPiece, nocturne);
      expect(bloc.state.currentIndex, 0);

      const input = PieceLogInput(
        minutes: 15,
        mood: PieceMood.inspired,
        tempoBpm: 120,
        note: 'Rubato breathing',
      );
      bloc.add(const SessionEvent.pieceLogged(input));
      await pumpEventQueue();

      expect(bloc.state.status, SessionStatus.active);
      expect(bloc.state.currentPiece, gigue);
      expect(bloc.state.currentIndex, 1);
      expect(bloc.state.session?.completedCount, 1);
      expect(bloc.state.session?.loggedSongIds, {1});

      bloc.add(const SessionEvent.finishRequested());
      await pumpEventQueue();

      expect(bloc.state.status, SessionStatus.idle);
      expect(statuses, [
        SessionStatus.starting,
        SessionStatus.active,
        SessionStatus.idle,
      ]);
      verify(sessionFacade.startSession(now)).called(1);

      final log = verify(sessionFacade.logPiece(captureAny)).captured.single
          as PieceLog;
      expect(
        log,
        PieceLog(
          sessionId: 7,
          songId: 1,
          pieceTitle: 'Nocturne',
          minutes: 15,
          mood: PieceMood.inspired,
          tempoBpm: 120,
          note: 'Rubato breathing',
          loggedAt: now,
        ),
      );
      verify(sessionFacade.finishSession(7, now)).called(1);
    });
  });
}
