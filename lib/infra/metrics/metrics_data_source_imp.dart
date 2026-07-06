import 'package:drift/drift.dart' as drift;
import 'package:ensayo/domain/db_tables/metrics.dart';
import 'package:ensayo/domain/metrics/i_metrics_data_source.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMetricsDataSource)
class MetricsDataSourceImp implements IMetricsDataSource {
  MetricsDataSourceImp({required this.dataBase});
  final AppDatabase dataBase;

  @override
  Future<List<MetricsData>> getMetrics() async {
    final metrics = await dataBase.select(dataBase.metrics).get();
    return metrics;
  }

  @override
  Future<void> increaseStreak({required int id, required int newStreak}) async {
    await (dataBase.update(dataBase.metrics)..where((t) => t.id.equals(id)))
        .write(MetricsCompanion(streakDays: drift.Value(newStreak)));
  }
}
