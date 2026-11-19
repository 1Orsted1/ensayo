import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/infra/metrics/metrics_data_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/v1_database.dart';
import '../helpers/v2_database.dart';

void main() {
  test('legacy goals round to the nearest five and clamp to the supported '
      'range', () async {
    final cases = <(double, int)>[
      (37.4, 35),
      (0.0, 5),
      (-40.0, 5),
      (9999.0, 240),
    ];

    for (final (storedGoal, expectedGoal) in cases) {
      final db = openV2Database([
        v2MetricsFixture(dailyGoalInMinutes: storedGoal),
      ]);

      try {
        final metrics = await MetricsDataSourceImp(dataBase: db).getMetrics();

        expect(
          metrics.dailyGoalInMinutes,
          expectedGoal,
          reason: 'A stored goal of $storedGoal should become $expectedGoal',
        );
      } finally {
        await db.close();
      }
    }
  });

  test(
    'the oldest metrics row wins when legacy data contains duplicates',
    () async {
      final db = openV2Database([
        v2MetricsFixture(id: 9, streakDays: 99, dailyGoalInMinutes: 120.0),
        v2MetricsFixture(id: 2, streakDays: 3, dailyGoalInMinutes: 45.0),
      ]);
      addTearDown(db.close);

      final metrics = await MetricsDataSourceImp(dataBase: db).getMetrics();

      expect(metrics.id, 2);
      expect(metrics.dailyGoalInMinutes, 45);
    },
  );

  test('a version 1 database upgrades through version 2 to version 3 in one '
      'opening', () async {
    final db = openV1Database([
      'INSERT INTO metrics (id, streak_days, daily_goal_in_minutes) '
          'VALUES (1, 12, 60.0)',
      "INSERT INTO feelings (id, name) VALUES (1, 'Focused')",
      "INSERT INTO songs (id, name) VALUES (1, 'Cello Suite No. 1')",
    ]);
    addTearDown(db.close);

    final metrics = await MetricsDataSourceImp(dataBase: db).getMetrics();
    final song = (await db.select(db.songs).get()).single;
    final feeling = (await db.select(db.feelings).get()).single;

    expect(metrics.dailyGoalInMinutes, 60);
    expect(await db.select(db.practiceSessions).get(), isEmpty);
    expect(song.name, 'Cello Suite No. 1');
    expect(song.status, PieceStatus.learning);
    expect(song.composer, isNull);
    expect(song.targetBpm, isNull);
    expect(feeling.name, 'Focused');
  });

  test(
    'old practice log rows are discarded without losing their feelings',
    () async {
      final db = openV2Database([
        v2MetricsFixture(dailyGoalInMinutes: 60.0),
        v2FeelingFixture,
        v2OldPracticeLogFixture,
      ]);
      addTearDown(db.close);

      await MetricsDataSourceImp(dataBase: db).getMetrics();

      expect(await db.select(db.practiceLogs).get(), isEmpty);
      final feeling = (await db.select(db.feelings).get()).single;
      expect(feeling.id, 1);
      expect(feeling.name, 'Inspired');

      final logColumns = await db
          .customSelect('PRAGMA table_info(practice_logs)')
          .get();
      expect(
        logColumns.map((row) => row.read<String>('name')).toSet(),
        containsAll({
          'session_id',
          'song_id',
          'piece_title',
          'minutes',
          'mood',
          'tempo_bpm',
          'note',
          'logged_at',
        }),
      );
    },
  );
}
