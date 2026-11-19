import 'package:ensayo/domain/metrics/metrics_data.dart';

abstract class IMetricsFacade {
  /// Gets the oldest metrics row, creating the default row when none exists.
  Future<MetricsData> getMetrics();

  Future<MetricsData> updateDailyGoal({required int id, required int minutes});
}
