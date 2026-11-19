import 'package:drift/native.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/domain/session/piece_mood.dart';
import 'package:ensayo/domain/session/session_summary.dart';
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

  // Design: Session data source behavior test.
  test('starting, logging two pieces and finishing produces the complete '
      'session summary with the summed logged minutes', () async {
    final plan = PlanDataSourceImp(dataBase: db);
    final nocturne = await plan.savePiece(const Piece(title: 'Nocturne'));
    final etude = await plan.savePiece(const Piece(title: 'Etude'));
    final startedAt = DateTime(2026, 11, 14, 18, 5);
    final firstLoggedAt = DateTime(2026, 11, 14, 18, 20);
    final lastLoggedAt = DateTime(2026, 11, 14, 18, 35);

    final session = await dataSource.startSession(startedAt);
    await dataSource.logPiece(
      PieceLog(
        sessionId: session.id,
        songId: nocturne.id,
        pieceTitle: nocturne.title,
        minutes: 15,
        mood: PieceMood.inspired,
        tempoBpm: 120,
        note: 'Rubato breathing',
        loggedAt: firstLoggedAt,
      ),
    );
    await dataSource.logPiece(
      PieceLog(
        sessionId: session.id,
        songId: etude.id,
        pieceTitle: etude.title,
        minutes: 10,
        mood: PieceMood.calm,
        loggedAt: lastLoggedAt,
      ),
    );

    final unfinished = await dataSource.getUnfinishedSession();
    expect(unfinished?.id, session.id);
    expect(unfinished?.completedCount, 2);
    expect(unfinished?.loggedSongIds, {nocturne.id, etude.id});
    expect(unfinished?.lastLoggedAt, lastLoggedAt);

    await dataSource.finishSession(session.id, DateTime(2026, 11, 14, 18, 47));

    expect(await dataSource.getUnfinishedSession(), isNull);
    expect(await dataSource.getFinishedSessions(), [
      SessionSummary(
        id: session.id,
        startedAt: startedAt,
        duration: const Duration(minutes: 42),
        pieceCount: 2,
        loggedMinutes: 25,
      ),
    ]);
  });
}
