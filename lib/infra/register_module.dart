import 'package:drift/backends.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class RegisterModule {
  @dev
  @prod
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

  @lazySingleton
  FirebaseAnalytics getAnalitics() {
    return FirebaseAnalytics.instance;
  }

  @test
  @preResolve
  @lazySingleton
  Future<QueryExecutor> get databaseExecutorTest async =>
      NativeDatabase.memory();
}
