import 'package:ensayo/domain/metrics/i_metrics_data_source.dart';
import 'package:ensayo/domain/metrics/i_metrics_facade.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMetricsFacade)
class MetricsFacadeImp implements IMetricsFacade {
  MetricsFacadeImp({required this.metricsDataSource});

  final IMetricsDataSource metricsDataSource;

  @override
  Future<MetricsData?> getMetrics() async {
    final data = await metricsDataSource.getMetrics();
    return data.isNotEmpty ? data.first : null;
  }

  @override
  Future<void> increaseStreak({required int id, required int newStreak}) {
    return metricsDataSource.increaseStreak(id: id, newStreak: newStreak);
  }
}
