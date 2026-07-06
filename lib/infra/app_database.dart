import 'package:drift/drift.dart';
import 'package:ensayo/domain/db/feelings.dart';
import 'package:ensayo/domain/db/metrics.dart';
import 'package:ensayo/domain/db/practice_logs.dart';
import 'package:ensayo/domain/db/songs.dart';
import 'package:ensayo/domain/db/tags_assigned.dart';
import 'package:ensayo/domain/db/tags.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Metrics, PracticeLogs, Tags, Feelings, Songs, TagsAssigned],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;
}
