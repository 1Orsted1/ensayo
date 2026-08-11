import 'package:ensayo/domain/metrics/i_metrics_facade.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part "metrics_cubit.freezed.dart";

@lazySingleton
class MetricsCubit extends Cubit<MetricsState> {
  MetricsCubit(this._facade) : super(MetricsState.initial());

  final IMetricsFacade _facade;

  Future<void> load() async {
    try {
      emit(state.copyWith(isLoading: true));
      MetricsData? data;
      data = await _facade.getMetrics();
      data ??= await _facade.createMetric();
      emit(state.copyWith(data: data, isLoading: false));
    } catch (e) {
      //TODO add error to analytics
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> increase() async {
    try {
      emit(state.copyWith(isLoading: true));
      var data = await _facade.increaseStreak(
        id: state.data.id,
        newStreak: state.data.streakDays + 1,
      );
      emit(state.copyWith(data: data, isLoading: false));
    } catch (e) {
      //TODO add error to analytics
      emit(state.copyWith(isLoading: false));
    }
  }
}

@freezed
abstract class MetricsState with _$MetricsState {
  const factory MetricsState({
    required MetricsData data,
    @Default(false) bool isLoading,
  }) = _MetricsState;

  factory MetricsState.initial() => MetricsState(
    data: MetricsData(id: -1, streakDays: -1, dailyGoalInMinutes: -1),
  );
}
