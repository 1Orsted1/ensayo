import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:ensayo/infra/metrics/metrics_data_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/v2_database.dart';

void main() {
  late AppDatabase db;

  tearDown(() => db.close());

  // Spec: Default goal / Upgrade; design: migration v2 → v3 behavior test.
  test('a version 2 upgrade keeps the goal, song and feeling and starts with '
      'no practice sessions', () async {
    db = openV2Database([
      v2MetricsFixture(streakDays: 8, dailyGoalInMinutes: 60.0),
      v2SongFixture,
      v2FeelingFixture,
    ]);

    final metrics = await MetricsDataSourceImp(dataBase: db).getMetrics();
    final sessions = await db.select(db.practiceSessions).get();
    final song = (await db.select(db.songs).get()).single;
    final feeling = (await db.select(db.feelings).get()).single;

    expect(metrics.dailyGoalInMinutes, 60);
    expect(sessions, isEmpty);
    expect(song.id, 1);
    expect(song.name, 'Nocturne');
    expect(song.composer, 'Chopin');
    expect(song.status, PieceStatus.polishing);
    expect(song.targetBpm, 72);
    expect(feeling.id, 1);
    expect(feeling.name, 'Inspired');
  });
}
