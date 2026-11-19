import 'package:drift/native.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:ensayo/infra/metrics/metrics_data_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late MetricsDataSourceImp dataSource;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    dataSource = MetricsDataSourceImp(dataBase: db);
  });
  tearDown(() => db.close());

  test('the oldest row wins when duplicate metrics rows exist', () async {
    await db.customStatement(
      'INSERT INTO metrics (id, daily_goal_in_minutes) VALUES (?, ?)',
      [9, 120],
    );
    await db.customStatement(
      'INSERT INTO metrics (id, daily_goal_in_minutes) VALUES (?, ?)',
      [2, 45],
    );

    final metrics = await dataSource.getMetrics();

    expect(metrics.id, 2);
    expect(metrics.dailyGoalInMinutes, 45);
    expect(await db.select(db.metrics).get(), hasLength(2));
  });

  test('updating the daily goal persists the new value', () async {
    final original = await dataSource.getMetrics();

    await dataSource.updateDailyGoal(id: original.id, minutes: 45);

    final reloaded = await MetricsDataSourceImp(dataBase: db).getMetrics();
    expect(reloaded.id, original.id);
    expect(reloaded.dailyGoalInMinutes, 45);
    expect(await db.select(db.metrics).get(), hasLength(1));
  });

  test('updating a missing metrics id fails without creating a row', () async {
    await expectLater(
      dataSource.updateDailyGoal(id: 404, minutes: 45),
      throwsA(anything),
    );

    expect(await db.select(db.metrics).get(), isEmpty);
  });
}
