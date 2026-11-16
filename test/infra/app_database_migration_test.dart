import 'package:drift/native.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

/// Schema as shipped in version 1, copied from what the v1 generated code
/// created. Never update this to match newer versions: it's the starting
/// point for the upgrade.
const _v1Schema = [
  'CREATE TABLE "metrics" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "streak_days" INTEGER NOT NULL, "daily_goal_in_minutes" REAL NOT NULL)',
  'CREATE TABLE "feelings" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL)',
  'CREATE TABLE "practice_logs" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "created_at" INTEGER NULL, "title" TEXT NOT NULL, "note" TEXT NOT NULL, "minutes_practiced" REAL NOT NULL, "feeling_id" INTEGER NOT NULL REFERENCES feelings (id) ON DELETE CASCADE)',
  'CREATE TABLE "tags" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL)',
  'CREATE TABLE "songs" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL)',
  'CREATE TABLE "tags_assigned" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "tags_id" INTEGER NOT NULL REFERENCES tags (id) ON DELETE CASCADE, "song_id" INTEGER NOT NULL REFERENCES songs (id) ON DELETE CASCADE)',
];

/// An in-memory database in the state a version 1 install leaves on disk,
/// holding one song.
AppDatabase _openV1Database() {
  return AppDatabase(
    NativeDatabase.memory(
      setup: (raw) {
        for (final statement in _v1Schema) {
          raw.execute(statement);
        }
        raw.execute("INSERT INTO songs (name) VALUES ('Cello Suite No. 1')");
        raw.execute('PRAGMA user_version = 1');
      },
    ),
  );
}

void main() {
  late AppDatabase db;

  setUp(() => db = _openV1Database());
  tearDown(() => db.close());

  test(
    'an existing song survives as Learning with no composer or tempo',
    () async {
      final songs = await db.select(db.songs).get();

      expect(songs, hasLength(1));
      expect(songs.single.name, 'Cello Suite No. 1');
      expect(songs.single.status, PieceStatus.learning);
      expect(songs.single.composer, isNull);
      expect(songs.single.targetBpm, isNull);
    },
  );

  test('the five focus tags exist exactly once after the upgrade', () async {
    final names = (await db.select(db.tags).get()).map((t) => t.name);

    expect(names, unorderedEquals(FocusTag.values.map((tag) => tag.name)));
  });
}
