import 'package:clock/clock.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/domain/session/practice_session.dart';
import 'package:ensayo/domain/session/session_action_status.dart';
import 'package:ensayo/domain/session/session_failure.dart';
import 'package:ensayo/domain/session/session_rules.dart';
import 'package:ensayo/domain/session/session_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'session_bloc.freezed.dart';
part 'session_event.dart';
part 'session_state.dart';

@injectable
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc(this._sessionFacade, this._planFacade, this._clock)
    : super(SessionState.initial()) {
    on<_Restored>(_onRestored);
    on<_StartRequested>(_onStartRequested);
    on<_PieceLogged>(_onPieceLogged);
    on<_PieceSkipped>(_onPieceSkipped);
    on<_FinishRequested>(_onFinishRequested);
    on<_DiscardRequested>(_onDiscardRequested);
  }

  final ISessionFacade _sessionFacade;
  final IPlanFacade _planFacade;
  final Clock _clock;

  Future<void> _onRestored(_Restored event, Emitter<SessionState> emit) async {
    emit(state.copyWith(status: SessionStatus.restoring, failure: null));
    try {
      final session = await _sessionFacade.getUnfinishedSession();
      if (session == null) {
        emit(_idle(state));
        return;
      }

      final outcome = staleOutcome(session, _clock.now());
      await outcome.when(
        resume: () async {
          final plan = await _planFacade.getPieces();
          emit(
            state.copyWith(
              status: SessionStatus.active,
              session: session,
              queue: buildQueue(plan, session.loggedSongIds),
              currentIndex: 0,
              currentSince: session.lastLoggedAt ?? session.startedAt,
              actionStatus: SessionActionStatus.idle,
              failure: null,
            ),
          );
        },
        finishAt: (at) async {
          await _sessionFacade.finishSession(session.id, at);
          emit(_idle(state));
        },
        discard: () async {
          await _sessionFacade.discardSession(session.id);
          emit(_idle(state));
        },
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        _idle(state).copyWith(
          actionStatus: SessionActionStatus.failure,
          failure: SessionFailure.restore,
        ),
      );
    }
  }

  Future<void> _onStartRequested(
    _StartRequested event,
    Emitter<SessionState> emit,
  ) async {
    if (state.status != SessionStatus.idle) return;
    emit(
      state.copyWith(
        status: SessionStatus.starting,
        actionStatus: SessionActionStatus.inProgress,
        failure: null,
      ),
    );
    try {
      final session = await _sessionFacade.startSession(_clock.now());
      final plan = await _planFacade.getPieces();
      emit(
        state.copyWith(
          status: SessionStatus.active,
          session: session,
          queue: buildQueue(plan, session.loggedSongIds),
          currentIndex: 0,
          currentSince: session.lastLoggedAt ?? session.startedAt,
          actionStatus: SessionActionStatus.idle,
          failure: null,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        _idle(state).copyWith(
          actionStatus: SessionActionStatus.failure,
          failure: SessionFailure.start,
        ),
      );
    }
  }

  Future<void> _onPieceLogged(
    _PieceLogged event,
    Emitter<SessionState> emit,
  ) async {
    final session = state.session;
    final piece = state.currentPiece;
    if (state.status != SessionStatus.active ||
        session == null ||
        piece == null ||
        state.actionStatus == SessionActionStatus.inProgress) {
      return;
    }

    emit(
      state.copyWith(
        actionStatus: SessionActionStatus.inProgress,
        failure: null,
      ),
    );
    final now = _clock.now();
    try {
      await _sessionFacade.logPiece(
        PieceLog(
          sessionId: session.id,
          songId: piece.id,
          pieceTitle: piece.title,
          minutes: event.input.minutes,
          mood: event.input.mood,
          tempoBpm: event.input.tempoBpm,
          note: event.input.note,
          loggedAt: now,
        ),
      );
      final loggedSongIds = {...session.loggedSongIds};
      if (piece.id != null) loggedSongIds.add(piece.id!);
      emit(
        state.copyWith(
          session: session.copyWith(
            loggedSongIds: loggedSongIds,
            completedCount: session.completedCount + 1,
            lastLoggedAt: now,
          ),
          currentIndex: state.currentIndex + 1,
          currentSince: now,
          actionStatus: SessionActionStatus.idle,
          failure: null,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          actionStatus: SessionActionStatus.failure,
          failure: SessionFailure.log,
        ),
      );
    }
  }

  void _onPieceSkipped(_PieceSkipped event, Emitter<SessionState> emit) {
    if (state.status != SessionStatus.active ||
        state.currentPiece == null ||
        state.actionStatus == SessionActionStatus.inProgress) {
      return;
    }
    emit(
      state.copyWith(
        currentIndex: state.currentIndex + 1,
        currentSince: _clock.now(),
        actionStatus: SessionActionStatus.idle,
        failure: null,
      ),
    );
  }

  Future<void> _onFinishRequested(
    _FinishRequested event,
    Emitter<SessionState> emit,
  ) {
    return _closeSession(
      emit,
      failure: SessionFailure.finish,
      action: (id) => _sessionFacade.finishSession(id, _clock.now()),
    );
  }

  Future<void> _onDiscardRequested(
    _DiscardRequested event,
    Emitter<SessionState> emit,
  ) {
    return _closeSession(
      emit,
      failure: SessionFailure.discard,
      action: _sessionFacade.discardSession,
    );
  }

  Future<void> _closeSession(
    Emitter<SessionState> emit, {
    required SessionFailure failure,
    required Future<void> Function(int id) action,
  }) async {
    final session = state.session;
    if (state.status != SessionStatus.active ||
        session == null ||
        state.actionStatus == SessionActionStatus.inProgress) {
      return;
    }
    emit(
      state.copyWith(
        actionStatus: SessionActionStatus.inProgress,
        failure: null,
      ),
    );
    try {
      await action(session.id);
      emit(_idle(state));
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          actionStatus: SessionActionStatus.failure,
          failure: failure,
        ),
      );
    }
  }

  SessionState _idle(SessionState current) {
    return current.copyWith(
      status: SessionStatus.idle,
      session: null,
      queue: <Piece>[],
      currentIndex: 0,
      currentSince: _clock.now(),
      actionStatus: SessionActionStatus.idle,
      failure: null,
    );
  }
}
