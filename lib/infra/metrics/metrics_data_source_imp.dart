import 'package:drift/drift.dart' as drift;
import 'package:ensayo/domain/metrics/i_metrics_data_source.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMetricsDataSource)
class MetricsDataSourceImp implements IMetricsDataSource {
  MetricsDataSourceImp({required this.dataBase});
  final AppDatabase dataBase;

  @override
  Future<MetricsData?> getMetrics() async {
    final metrics = await dataBase.select(dataBase.metrics).getSingleOrNull();
    return metrics;
  }

  @override
  Future<MetricsData> increaseStreak({
    required int id,
    required int newStreak,
  }) async {
    final row =
        await (dataBase.update(
          dataBase.metrics,
        )..where((t) => t.id.equals(id))).writeReturning(
          MetricsCompanion(streakDays: drift.Value(newStreak)),
        );

    return row.single;
  }

  @override
  Future<MetricsData> createMetric() async {
    final row = await dataBase
        .into(dataBase.metrics)
        .insertReturning(
          MetricsCompanion(
            streakDays: drift.Value(1),
            dailyGoalInMinutes: drift.Value(60),
          ),
        );
    return row;
  }
}
