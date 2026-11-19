import 'package:drift/drift.dart';
import 'package:ensayo/domain/db_tables/feelings.dart';
import 'package:ensayo/domain/db_tables/metrics.dart';
import 'package:ensayo/domain/db_tables/practice_logs.dart';
import 'package:ensayo/domain/db_tables/practice_sessions.dart';
import 'package:ensayo/domain/db_tables/songs.dart';
import 'package:ensayo/domain/db_tables/tags_assigned.dart';
import 'package:ensayo/domain/db_tables/tags.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/domain/session/piece_mood.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Metrics,
    PracticeSessions,
    PracticeLogs,
    Tags,
    Feelings,
    Songs,
    TagsAssigned,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  /// v2: plan columns on `Songs` and seeded focus tags.
  /// v3: practice sessions and per-piece logs; computed streak and integer goal.
  /// Never edit a shipped step; add a new `if (from < N)` block.
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seedFocusTags();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(songs, songs.composer);
        await m.addColumn(songs, songs.status);
        await m.addColumn(songs, songs.targetBpm);
        await _seedFocusTags();
      }
      if (from < 3) {
        await m.deleteTable('practice_logs'); // never written by any release
        await m.createTable(practiceSessions);
        await m.createTable(practiceLogs);
        await m.alterTable(
          TableMigration(
            metrics,
            columnTransformer: {
              metrics.dailyGoalInMinutes: const CustomExpression<int>(
                'MIN(240, MAX(5, CAST(ROUND(daily_goal_in_minutes / 5.0) * 5 AS INTEGER)))',
              ),
            },
          ),
        );
      }
    },
  );

  /// Skips existing keys, so it's safe to run on any install.
  Future<void> _seedFocusTags() async {
    final existing = (await select(tags).get()).map((t) => t.name).toSet();
    final missing = FocusTag.values.where((t) => !existing.contains(t.name));
    await batch((b) {
      b.insertAll(tags, [
        for (final tag in missing) TagsCompanion.insert(name: tag.name),
      ]);
    });
  }
}
