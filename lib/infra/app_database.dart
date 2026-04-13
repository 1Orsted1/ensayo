import 'package:drift/drift.dart';
import 'package:ensayo/domain/db/theme_data.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TestTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;
}
