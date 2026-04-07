import 'package:drift/backends.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<QueryExecutor> get databaseExecutor async {
    return driftDatabase(
      name: 'ensayo_db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @lazySingleton
  AppDatabase database(QueryExecutor executor) => AppDatabase(executor);

  @preResolve
  @singleton
  Future<SharedPreferences> getSharedPreferences() {
    return SharedPreferences.getInstance();
  }
}
