import 'package:drift/drift.dart';
import 'package:ensayo/domain/db/feelings.dart';

class PracticeLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get title => text().withLength(min: 0, max: 32)();
  TextColumn? get note => text().withLength(min: 0, max: 120)();
  RealColumn get minutesPracticed => real()();

  IntColumn? get feelingId => integer().references(
    Feelings,
    #id,
    onDelete:
        KeyAction.cascade, // Optional: auto-delete todos if category is deleted
  )();
}
