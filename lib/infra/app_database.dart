import 'package:drift/drift.dart';
import 'package:ensayo/domain/db_tables/feelings.dart';
import 'package:ensayo/domain/db_tables/metrics.dart';
import 'package:ensayo/domain/db_tables/practice_logs.dart';
import 'package:ensayo/domain/db_tables/songs.dart';
import 'package:ensayo/domain/db_tables/tags_assigned.dart';
import 'package:ensayo/domain/db_tables/tags.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece_status.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Metrics, PracticeLogs, Tags, Feelings, Songs, TagsAssigned],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  /// Version history:
  /// 1. Initial schema.
  /// 2. Practice plan: `Songs` gains composer, status and targetBpm; focus
  ///    tags are seeded.
  ///
  /// Never edit a step that has shipped; add a new `if (from < N)` block.
  @override
  int get schemaVersion => 2;

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
    },
  );

  /// Inserts any [FocusTag] key that isn't in `Tags` yet.
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
