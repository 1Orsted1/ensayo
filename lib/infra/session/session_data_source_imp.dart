import 'package:drift/drift.dart' as drift;
import 'package:ensayo/domain/session/i_session_data_source.dart';
import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/domain/session/practice_session.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:ensayo/infra/app_database.dart' as db;
import 'package:injectable/injectable.dart';

@Injectable(as: ISessionDataSource)
class SessionDataSourceImp implements ISessionDataSource {
  SessionDataSourceImp({required this.dataBase});

  final db.AppDatabase dataBase;

  @override
  Future<PracticeSession?> getUnfinishedSession() async {
    final row = await _newestUnfinishedRow();
    if (row == null) return null;
    return _withLogs(row);
  }

  @override
  Future<PracticeSession> startSession(DateTime at) {
    return dataBase.transaction(() async {
      final existing = await _newestUnfinishedRow();
      if (existing != null) return _withLogs(existing);

      final row = await dataBase
          .into(dataBase.practiceSessions)
          .insertReturning(db.PracticeSessionsCompanion.insert(startedAt: at));
      return PracticeSession(id: row.id, startedAt: row.startedAt);
    });
  }

  @override
  Future<void> logPiece(PieceLog log) {
    return dataBase
        .into(dataBase.practiceLogs)
        .insert(
          db.PracticeLogsCompanion.insert(
            sessionId: log.sessionId,
            songId: drift.Value(log.songId),
            pieceTitle: log.pieceTitle,
            minutes: log.minutes,
            mood: drift.Value(log.mood),
            tempoBpm: drift.Value(log.tempoBpm),
            note: drift.Value(log.note),
            loggedAt: log.loggedAt,
          ),
        );
  }

  @override
  Future<void> finishSession(int id, DateTime at) async {
    final rows =
        await (dataBase.update(
          dataBase.practiceSessions,
        )..where((t) => t.id.equals(id) & t.endedAt.isNull())).writeReturning(
          db.PracticeSessionsCompanion(endedAt: drift.Value(at)),
        );
    if (rows.isEmpty) {
      throw StateError('Session $id is missing or already finished');
    }
  }

  @override
  Future<void> discardSession(int id) {
    return dataBase.transaction(() async {
      await (dataBase.delete(
        dataBase.practiceLogs,
      )..where((t) => t.sessionId.equals(id))).go();
      await (dataBase.delete(
        dataBase.practiceSessions,
      )..where((t) => t.id.equals(id))).go();
    });
  }

  @override
  Future<List<SessionSummary>> getFinishedSessions() async {
    final pieceCount = dataBase.practiceLogs.id.count();
    final loggedMinutes = dataBase.practiceLogs.minutes.sum();
    final query = dataBase.select(dataBase.practiceSessions).join([
      drift.leftOuterJoin(
        dataBase.practiceLogs,
        dataBase.practiceLogs.sessionId.equalsExp(dataBase.practiceSessions.id),
      ),
    ]);
    query.where(dataBase.practiceSessions.endedAt.isNotNull());
    query.groupBy([dataBase.practiceSessions.id]);
    query.orderBy([
      drift.OrderingTerm.desc(dataBase.practiceSessions.startedAt),
      drift.OrderingTerm.desc(dataBase.practiceSessions.id),
    ]);
    query.addColumns([pieceCount, loggedMinutes]);

    return [
      for (final row in await query.get())
        _toSummary(
          row.readTable(dataBase.practiceSessions),
          row.read(pieceCount) ?? 0,
          row.read(loggedMinutes) ?? 0,
        ),
    ];
  }

  Future<db.PracticeSession?> _newestUnfinishedRow() {
    return (dataBase.select(dataBase.practiceSessions)
          ..where((t) => t.endedAt.isNull())
          ..orderBy([(t) => drift.OrderingTerm.desc(t.id)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<PracticeSession> _withLogs(db.PracticeSession row) async {
    final logs =
        await (dataBase.select(dataBase.practiceLogs)
              ..where((t) => t.sessionId.equals(row.id))
              ..orderBy([
                (t) => drift.OrderingTerm.desc(t.loggedAt),
                (t) => drift.OrderingTerm.desc(t.id),
              ]))
            .get();
    return PracticeSession(
      id: row.id,
      startedAt: row.startedAt,
      endedAt: row.endedAt,
      loggedSongIds: logs.map((log) => log.songId).whereType<int>().toSet(),
      completedCount: logs.length,
      lastLoggedAt: logs.isEmpty ? null : logs.first.loggedAt,
    );
  }

  SessionSummary _toSummary(
    db.PracticeSession row,
    int pieceCount,
    int loggedMinutes,
  ) {
    final endedAt = row.endedAt!;
    return SessionSummary(
      id: row.id,
      startedAt: row.startedAt,
      duration: endedAt.difference(row.startedAt),
      pieceCount: pieceCount,
      loggedMinutes: loggedMinutes,
    );
  }
}
