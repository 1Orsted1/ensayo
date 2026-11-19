import 'package:freezed_annotation/freezed_annotation.dart';

part 'metrics_data.freezed.dart';

@freezed
abstract class MetricsData with _$MetricsData {
  const factory MetricsData({
    required int id,
    required int dailyGoalInMinutes,
  }) = _MetricsData;
}
