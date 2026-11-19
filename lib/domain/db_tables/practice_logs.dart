import 'package:drift/drift.dart';
import 'package:ensayo/domain/db_tables/practice_sessions.dart';
import 'package:ensayo/domain/session/piece_mood.dart';

class PracticeLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer().references(PracticeSessions, #id)();
  IntColumn get songId => integer().nullable()();
  TextColumn get pieceTitle => text().withLength(min: 1, max: 160)();
  IntColumn get minutes => integer()();
  TextColumn get mood => textEnum<PieceMood>().nullable()();
  IntColumn get tempoBpm => integer().nullable()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get loggedAt => dateTime()();
}
