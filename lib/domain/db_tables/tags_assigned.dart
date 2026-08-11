import 'package:drift/drift.dart';
import 'package:ensayo/domain/db_tables/songs.dart';
import 'package:ensayo/domain/db_tables/tags.dart';

class TagsAssigned extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn? get tagsId =>
      integer().references(Tags, #id, onDelete: KeyAction.cascade)();
  IntColumn? get songId =>
      integer().references(Songs, #id, onDelete: KeyAction.cascade)();
}
