import 'package:ensayo/domain/metrics/metrics_data.dart';

abstract class IMetricsFacade {
  Future<MetricsData?> getMetrics();
  Future<MetricsData> createMetric(); //first time event
  Future<MetricsData> increaseStreak({required int id, required int newStreak});
}
