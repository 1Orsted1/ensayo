import 'package:ensayo/domain/metrics/i_metrics_data_source.dart';
import 'package:ensayo/domain/metrics/i_metrics_facade.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMetricsFacade)
class MetricsFacadeImp implements IMetricsFacade {
  MetricsFacadeImp({required this.metricsDataSource});

  final IMetricsDataSource metricsDataSource;

  @override
  Future<MetricsData> getMetrics() => metricsDataSource.getMetrics();

  @override
  Future<MetricsData> updateDailyGoal({required int id, required int minutes}) {
    return metricsDataSource.updateDailyGoal(id: id, minutes: minutes);
  }
}
