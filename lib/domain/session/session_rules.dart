import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/domain/session/practice_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_rules.freezed.dart';

const staleAfter = Duration(hours: 12);

@freezed
abstract class StaleOutcome with _$StaleOutcome {
  const factory StaleOutcome.resume() = _Resume;
  const factory StaleOutcome.finishAt(DateTime at) = _FinishAt;
  const factory StaleOutcome.discard() = _Discard;
}

StaleOutcome staleOutcome(PracticeSession session, DateTime now) {
  if (now.difference(session.startedAt) <= staleAfter) {
    return const StaleOutcome.resume();
  }
  final lastLoggedAt = session.lastLoggedAt;
  if (lastLoggedAt != null) return StaleOutcome.finishAt(lastLoggedAt);
  return const StaleOutcome.discard();
}

int suggestedPieceMinutes(Duration sinceCurrent) {
  final minutes = sinceCurrent.inMinutes;
  if (minutes < 1) return 1;
  if (minutes > 180) return 180;
  return minutes;
}

List<Piece> buildQueue(List<Piece> plan, Set<int> alreadyLogged) {
  return [
    for (final piece in plan)
      if (piece.status != PieceStatus.archived &&
          (piece.id == null || !alreadyLogged.contains(piece.id)))
        piece,
  ];
}
