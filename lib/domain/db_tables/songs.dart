import 'package:drift/drift.dart';
import 'package:ensayo/domain/plan/piece_status.dart';

class Songs extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Drift counts UTF-16 code units, so 160 fits 80 emoji.
  // The real 80-character limit is `validateTitle`'s job.
  TextColumn get name => text().withLength(min: 1, max: 160)();

  // Added in schema version 2.
  TextColumn get composer => text().nullable()();
  TextColumn get status =>
      textEnum<PieceStatus>().withDefault(const Constant('learning'))();
  IntColumn get targetBpm => integer().nullable()();
}
