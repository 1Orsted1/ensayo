import 'package:clock/clock.dart';
import 'package:ensayo/domain/metrics/daily_goal.dart';
import 'package:ensayo/domain/metrics/goal_save_status.dart';
import 'package:ensayo/domain/metrics/i_metrics_facade.dart';
import 'package:ensayo/domain/metrics/metrics_load_status.dart';
import 'package:ensayo/domain/metrics/streak.dart';
import 'package:ensayo/domain/metrics/today_minutes.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'metrics_cubit.freezed.dart';

@lazySingleton
class MetricsCubit extends Cubit<MetricsState> {
  MetricsCubit(this._metricsFacade, this._sessionFacade, this._clock)
    : super(const MetricsState());

  final IMetricsFacade _metricsFacade;
  final ISessionFacade _sessionFacade;
  final Clock _clock;
  var _loadGeneration = 0;

  Future<void> load() async {
    final generation = ++_loadGeneration;
    emit(state.copyWith(loadStatus: MetricsLoadStatus.loading));
    try {
      final metrics = await _metricsFacade.getMetrics();
      final sessions = await _sessionFacade.getFinishedSessions();
      if (generation != _loadGeneration) return;

      final now = _clock.now();
      emit(
        state.copyWith(
          metricsId: metrics.id,
          goalMinutes: metrics.dailyGoalInMinutes,
          streakDays: computeStreak(
            sessions.map((session) => session.startedAt),
            now,
          ),
          todayMinutes: minutesOn(now, sessions),
          loadStatus: MetricsLoadStatus.loaded,
        ),
      );
    } catch (e, s) {
      if (generation != _loadGeneration) return;
      addError(e, s);
      emit(state.copyWith(loadStatus: MetricsLoadStatus.failure));
    }
  }

  Future<void> setDailyGoal(int minutes) async {
    if (state.goalSaveStatus == GoalSaveStatus.inProgress) return;
    final id = state.metricsId;
    if (id == null) {
      final error = StateError('Metrics are not loaded');
      addError(error, StackTrace.current);
      emit(state.copyWith(goalSaveStatus: GoalSaveStatus.failure));
      return;
    }

    emit(state.copyWith(goalSaveStatus: GoalSaveStatus.inProgress));
    try {
      final updated = await _metricsFacade.updateDailyGoal(
        id: id,
        minutes: clampGoal(minutes),
      );
      emit(
        state.copyWith(
          goalMinutes: updated.dailyGoalInMinutes,
          goalSaveStatus: GoalSaveStatus.idle,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(state.copyWith(goalSaveStatus: GoalSaveStatus.failure));
    }
  }
}

@freezed
abstract class MetricsState with _$MetricsState {
  const factory MetricsState({
    int? metricsId,
    @Default(defaultGoal) int goalMinutes,
    @Default(0) int streakDays,
    @Default(0) int todayMinutes,
    @Default(MetricsLoadStatus.loading) MetricsLoadStatus loadStatus,
    @Default(GoalSaveStatus.idle) GoalSaveStatus goalSaveStatus,
  }) = _MetricsState;

  factory MetricsState.initial() => const MetricsState();
}
