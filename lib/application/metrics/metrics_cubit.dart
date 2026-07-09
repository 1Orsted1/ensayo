import 'package:ensayo/domain/metrics/i_metrics_facade.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part "metrics_cubit.freezed.dart";

@lazySingleton
class MetricsCubit extends Cubit<MetricsState> {
  MetricsCubit(this.facade) : super(MetricsState.initial());

  final IMetricsFacade facade;

  Future<void> load() async {
    try {
      emit(state.copyWith(isLoading: true));
      final data = await facade.getMetrics();
      emit(state.copyWith(data: data, isLoading: false));
    } catch (e) {
      //TODO add error to analytics
      emit(state.copyWith(isLoading: false));
    }
  }

  //TODO refactor for final version
  Future<void> increase() async {
    try {
      emit(state.copyWith(isLoading: true));
      var oldData = await facade.getMetrics();
      if (oldData == null) {
        await facade.createMetric();
      }
      oldData = await facade.getMetrics();
      final (_, newData) = await (
        facade.increaseStreak(
          id: oldData?.id ?? -1,
          newStreak: (oldData?.streakDays ?? 0) + 1,
        ),
        facade.getMetrics(),
      ).wait;
      emit(state.copyWith(data: newData, isLoading: false));
    } catch (e) {
      //TODO add error to analytics
      emit(state.copyWith(isLoading: false));
    }
  }
}

@freezed
abstract class MetricsState with _$MetricsState {
  const factory MetricsState({
    MetricsData? data,
    @Default(false) bool isLoading,
  }) = _MetricsState;

  factory MetricsState.initial() => MetricsState();
}
