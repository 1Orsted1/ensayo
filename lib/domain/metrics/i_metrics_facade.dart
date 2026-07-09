import 'package:ensayo/domain/metrics/metrics_data.dart';

abstract class IMetricsFacade {
  Future<MetricsData?> getMetrics();
  Future<void> createMetric(); //first time event
  Future<void> increaseStreak({required int id, required int newStreak});
}
