import 'package:ensayo/domain/metrics/metrics_data.dart';

abstract class IMetricsDataSource {
  Future<List<MetricsData>> getMetrics();
  Future<void> increaseStreak({required int id, required int newStreak});
}
