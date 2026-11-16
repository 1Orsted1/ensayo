import 'package:drift/native.dart';
import 'package:ensayo/infra/app_database.dart';

/// Frozen copy of the v1 schema, the upgrade's starting point. Never
/// update it.
const v1Schema = [
  'CREATE TABLE "metrics" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "streak_days" INTEGER NOT NULL, "daily_goal_in_minutes" REAL NOT NULL)',
  'CREATE TABLE "feelings" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL)',
  'CREATE TABLE "practice_logs" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "created_at" INTEGER NULL, "title" TEXT NOT NULL, "note" TEXT NOT NULL, "minutes_practiced" REAL NOT NULL, "feeling_id" INTEGER NOT NULL REFERENCES feelings (id) ON DELETE CASCADE)',
  'CREATE TABLE "tags" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL)',
  'CREATE TABLE "songs" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL)',
  'CREATE TABLE "tags_assigned" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "tags_id" INTEGER NOT NULL REFERENCES tags (id) ON DELETE CASCADE, "song_id" INTEGER NOT NULL REFERENCES songs (id) ON DELETE CASCADE)',
];

/// [onRawOpened] exposes the sqlite handle so a test can [reopen] the
/// database, like an app restart.
AppDatabase openV1Database(
  List<String> data, {
  void Function(dynamic raw)? onRawOpened,
}) {
  return AppDatabase(
    NativeDatabase.memory(
      setup: (raw) {
        for (final statement in [...v1Schema, ...data]) {
          raw.execute(statement);
        }
        raw.execute('PRAGMA user_version = 1');
        onRawOpened?.call(raw);
      },
    ),
  );
}

/// Close it before the original.
AppDatabase reopen(dynamic raw) =>
    AppDatabase(NativeDatabase.opened(raw, closeUnderlyingOnClose: false));
