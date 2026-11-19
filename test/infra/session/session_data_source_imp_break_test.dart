import 'package:drift/native.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:ensayo/infra/plan/plan_data_source_imp.dart';
import 'package:ensayo/infra/session/session_data_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late SessionDataSourceImp dataSource;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    dataSource = SessionDataSourceImp(dataBase: db);
  });
  tearDown(() => db.close());

  test(
    'starting twice returns the same unfinished session and its logs',
    () async {
      final startedAt = DateTime(2026, 11, 14, 9);
      final first = await dataSource.startSession(startedAt);
      final loggedAt = DateTime(2026, 11, 14, 9, 12);
      await dataSource.logPiece(
        PieceLog(
          sessionId: first.id,
          songId: 7,
          pieceTitle: 'Gigue',
          minutes: 12,
          loggedAt: loggedAt,
        ),
      );

      final second = await dataSource.startSession(
        DateTime(2026, 11, 14, 9, 20),
      );

      expect(
        second,
        first.copyWith(
          completedCount: 1,
          loggedSongIds: {7},
          lastLoggedAt: loggedAt,
        ),
      );
      expect(await db.select(db.practiceSessions).get(), hasLength(1));
      expect(await dataSource.getUnfinishedSession(), second);
    },
  );

  test('discarding deletes the session and logs, and unfinished or discarded '
      'sessions stay out of summaries', () async {
    final discarded = await dataSource.startSession(DateTime(2026, 11, 13, 8));
    await dataSource.logPiece(
      PieceLog(
        sessionId: discarded.id,
        pieceTitle: 'Nocturne',
        minutes: 8,
        loggedAt: DateTime(2026, 11, 13, 8, 8),
      ),
    );

    await dataSource.discardSession(discarded.id);

    expect(await db.select(db.practiceLogs).get(), isEmpty);
    expect(await db.select(db.practiceSessions).get(), isEmpty);
    expect(await dataSource.getFinishedSessions(), isEmpty);

    await dataSource.startSession(DateTime(2026, 11, 14, 8));

    expect(await dataSource.getFinishedSessions(), isEmpty);
  });

  test('finishing a missing session id reports failure', () async {
    await expectLater(
      dataSource.finishSession(404, DateTime(2026, 11, 14, 10)),
      throwsA(anything),
    );

    expect(await dataSource.getFinishedSessions(), isEmpty);
  });

  test(
    'a log for a deleted song keeps the song id and title snapshot',
    () async {
      final plan = PlanDataSourceImp(dataBase: db);
      final deletedPiece = await plan.savePiece(const Piece(title: 'Nocturne'));
      await plan.deletePiece(deletedPiece.id!);
      final session = await dataSource.startSession(DateTime(2026, 11, 14, 18));

      await dataSource.logPiece(
        PieceLog(
          sessionId: session.id,
          songId: deletedPiece.id,
          pieceTitle: deletedPiece.title,
          minutes: 20,
          loggedAt: DateTime(2026, 11, 14, 18, 20),
        ),
      );
      await dataSource.finishSession(
        session.id,
        DateTime(2026, 11, 14, 18, 25),
      );

      expect(await db.select(db.songs).get(), isEmpty);
      final storedLog = (await db.select(db.practiceLogs).get()).single;
      expect(storedLog.songId, deletedPiece.id);
      expect(storedLog.pieceTitle, 'Nocturne');
      expect((await dataSource.getFinishedSessions()).single.pieceCount, 1);
    },
  );

  test('zero-log summaries keep their duration and are newest first', () async {
    final older = await dataSource.startSession(DateTime(2026, 11, 13, 9));
    await dataSource.finishSession(older.id, DateTime(2026, 11, 13, 9, 20));
    final newer = await dataSource.startSession(DateTime(2026, 11, 14, 10));
    await dataSource.finishSession(newer.id, DateTime(2026, 11, 14, 10, 10));

    final summaries = await dataSource.getFinishedSessions();

    expect(summaries.map((summary) => summary.id), [newer.id, older.id]);
    expect(summaries.map((summary) => summary.pieceCount), [0, 0]);
    expect(summaries.map((summary) => summary.duration), [
      const Duration(minutes: 10),
      const Duration(minutes: 20),
    ]);
  });
}
