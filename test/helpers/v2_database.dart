import 'package:drift/native.dart';
import 'package:ensayo/infra/app_database.dart';

/// Frozen copy of the v2 schema, the v3 upgrade's starting point. Never
/// update it.
const v2Schema = [
  'CREATE TABLE "metrics" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "streak_days" INTEGER NOT NULL, "daily_goal_in_minutes" REAL NOT NULL)',
  'CREATE TABLE "feelings" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL)',
  'CREATE TABLE "practice_logs" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "created_at" INTEGER NULL, "title" TEXT NOT NULL, "note" TEXT NOT NULL, "minutes_practiced" REAL NOT NULL, "feeling_id" INTEGER NOT NULL REFERENCES feelings (id) ON DELETE CASCADE)',
  'CREATE TABLE "tags" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL)',
  'CREATE TABLE "songs" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL, "composer" TEXT NULL, "status" TEXT NOT NULL DEFAULT \'learning\', "target_bpm" INTEGER NULL)',
  'CREATE TABLE "tags_assigned" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "tags_id" INTEGER NOT NULL REFERENCES tags (id) ON DELETE CASCADE, "song_id" INTEGER NOT NULL REFERENCES songs (id) ON DELETE CASCADE)',
];

const v2SongFixture =
    "INSERT INTO songs (id, name, composer, status, target_bpm) VALUES (1, 'Nocturne', 'Chopin', 'polishing', 72)";

const v2FeelingFixture =
    "INSERT INTO feelings (id, name) VALUES (1, 'Inspired')";

const v2OldPracticeLogFixture =
    "INSERT INTO practice_logs (id, created_at, title, note, minutes_practiced, feeling_id) VALUES (1, 1767225600, 'Old log', 'Legacy note', 25.0, 1)";

String v2MetricsFixture({
  int id = 1,
  int streakDays = 1,
  required double dailyGoalInMinutes,
}) =>
    'INSERT INTO metrics (id, streak_days, daily_goal_in_minutes) '
    'VALUES ($id, $streakDays, $dailyGoalInMinutes)';

/// [onRawOpened] exposes the sqlite handle so a test can reopen the database,
/// like an app restart.
AppDatabase openV2Database(
  List<String> data, {
  void Function(dynamic raw)? onRawOpened,
}) {
  return AppDatabase(
    NativeDatabase.memory(
      setup: (raw) {
        for (final statement in [...v2Schema, ...data]) {
          raw.execute(statement);
        }
        raw.execute('PRAGMA user_version = 2');
        onRawOpened?.call(raw);
      },
    ),
  );
}
