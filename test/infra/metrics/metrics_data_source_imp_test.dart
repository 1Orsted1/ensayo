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

  // Spec: Default goal / First run; design: get-or-create metrics.
  test('the first read creates the default 60-minute goal and later reads '
      'reuse that row', () async {
    final created = await dataSource.getMetrics();
    final reread = await dataSource.getMetrics();

    expect(created.dailyGoalInMinutes, 60);
    expect(reread, created);
    final rows = await db.select(db.metrics).get();
    expect(rows, hasLength(1));
    expect(rows.single.id, created.id);
    expect(rows.single.dailyGoalInMinutes, 60);
  });
}
