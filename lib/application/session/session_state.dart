part of 'session_bloc.dart';

@freezed
abstract class SessionState with _$SessionState {
  const SessionState._();

  const factory SessionState({
    @Default(SessionStatus.restoring) SessionStatus status,
    PracticeSession? session,
    @Default(<Piece>[]) List<Piece> queue,
    @Default(0) int currentIndex,
    required DateTime currentSince,
    @Default(SessionActionStatus.idle) SessionActionStatus actionStatus,
    SessionFailure? failure,
  }) = _SessionState;

  factory SessionState.initial() =>
      SessionState(currentSince: DateTime.fromMillisecondsSinceEpoch(0));

  Piece? get currentPiece {
    if (currentIndex < 0 || currentIndex >= queue.length) return null;
    return queue[currentIndex];
  }

  bool get isQueueDone => queue.isNotEmpty && currentIndex >= queue.length;
  bool get isFreePractice => queue.isEmpty;
}
