import 'package:drift/drift.dart';
import 'package:ensayo/domain/plan/piece_status.dart';

/// Pieces in the practice plan (see `Piece`).
class Songs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 80)();

  // Added in schema version 2.
  TextColumn get composer => text().nullable()();
  TextColumn get status =>
      textEnum<PieceStatus>().withDefault(const Constant('learning'))();
  IntColumn get targetBpm => integer().nullable()();
}
