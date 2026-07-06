import 'package:drift/drift.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';

@UseRowClass(MetricsData)
class Metrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get streakDays => integer()();
  RealColumn get dailyGoalInMinutes => real()();
}
