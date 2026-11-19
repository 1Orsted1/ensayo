import 'package:drift/drift.dart' as drift;
import 'package:ensayo/domain/metrics/daily_goal.dart';
import 'package:ensayo/domain/metrics/i_metrics_data_source.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMetricsDataSource)
class MetricsDataSourceImp implements IMetricsDataSource {
  MetricsDataSourceImp({required this.dataBase});

  final AppDatabase dataBase;

  @override
  Future<MetricsData> getMetrics() async {
    final existing =
        await (dataBase.select(dataBase.metrics)
              ..orderBy([(t) => drift.OrderingTerm.asc(t.id)])
              ..limit(1))
            .getSingleOrNull();
    if (existing != null) return existing;

    return dataBase
        .into(dataBase.metrics)
        .insertReturning(
          MetricsCompanion.insert(dailyGoalInMinutes: defaultGoal),
        );
  }

  @override
  Future<MetricsData> updateDailyGoal({
    required int id,
    required int minutes,
  }) async {
    final rows =
        await (dataBase.update(
          dataBase.metrics,
        )..where((t) => t.id.equals(id))).writeReturning(
          MetricsCompanion(dailyGoalInMinutes: drift.Value(minutes)),
        );
    return rows.single;
  }
}
