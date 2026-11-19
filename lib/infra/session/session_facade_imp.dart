import 'package:ensayo/domain/session/i_session_data_source.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/domain/session/practice_session.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ISessionFacade)
class SessionFacadeImp implements ISessionFacade {
  SessionFacadeImp({required this.sessionDataSource});

  final ISessionDataSource sessionDataSource;

  @override
  Future<PracticeSession?> getUnfinishedSession() =>
      sessionDataSource.getUnfinishedSession();

  @override
  Future<PracticeSession> startSession(DateTime at) =>
      sessionDataSource.startSession(at);

  @override
  Future<void> logPiece(PieceLog log) => sessionDataSource.logPiece(log);

  @override
  Future<void> finishSession(int id, DateTime at) =>
      sessionDataSource.finishSession(id, at);

  @override
  Future<void> discardSession(int id) => sessionDataSource.discardSession(id);

  @override
  Future<List<SessionSummary>> getFinishedSessions() =>
      sessionDataSource.getFinishedSessions();
}
