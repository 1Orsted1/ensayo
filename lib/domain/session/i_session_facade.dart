import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/domain/session/practice_session.dart';
import 'package:ensayo/domain/session/session_summary.dart';

abstract class ISessionFacade {
  /// The newest unfinished session, if any.
  Future<PracticeSession?> getUnfinishedSession();

  /// Returns an existing unfinished session instead of creating another one.
  Future<PracticeSession> startSession(DateTime at);

  Future<void> logPiece(PieceLog log);

  Future<void> finishSession(int id, DateTime at);

  Future<void> discardSession(int id);

  /// Finished sessions, newest first.
  Future<List<SessionSummary>> getFinishedSessions();
}
