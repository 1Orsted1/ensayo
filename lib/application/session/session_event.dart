part of 'session_bloc.dart';

@freezed
abstract class SessionEvent with _$SessionEvent {
  const factory SessionEvent.restored() = _Restored;
  const factory SessionEvent.startRequested() = _StartRequested;
  const factory SessionEvent.pieceLogged(PieceLogInput input) = _PieceLogged;
  const factory SessionEvent.pieceSkipped() = _PieceSkipped;
  const factory SessionEvent.finishRequested() = _FinishRequested;
  const factory SessionEvent.discardRequested() = _DiscardRequested;
}
