import 'package:drift/drift.dart';
import 'package:ensayo/domain/db/theme_data.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ThemeData])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;
}
