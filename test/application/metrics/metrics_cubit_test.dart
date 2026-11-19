import 'package:clock/clock.dart';
import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/domain/metrics/i_metrics_facade.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:ensayo/domain/metrics/metrics_load_status.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'metrics_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IMetricsFacade>(), MockSpec<ISessionFacade>()])
void main() {
  test(
    'load computes the streak, goal, and today minutes from saved data',
    () async {
      final now = DateTime(2026, 11, 19, 12);
      final metricsFacade = MockIMetricsFacade();
      final sessionFacade = MockISessionFacade();
      final cubit = MetricsCubit(
        metricsFacade,
        sessionFacade,
        Clock.fixed(now),
      );
      addTearDown(cubit.close);

      const metrics = MetricsData(id: 3, dailyGoalInMinutes: 60);
      final sessions = [
        SessionSummary(
          id: 1,
          startedAt: DateTime(2026, 11, 17, 8),
          duration: const Duration(minutes: 15),
          pieceCount: 1,
          loggedMinutes: 12,
        ),
        SessionSummary(
          id: 2,
          startedAt: DateTime(2026, 11, 18, 18),
          duration: const Duration(minutes: 25),
          pieceCount: 2,
          loggedMinutes: 20,
        ),
        SessionSummary(
          id: 3,
          startedAt: DateTime(2026, 11, 19, 9),
          duration: const Duration(minutes: 34),
          pieceCount: 1,
          loggedMinutes: 20,
        ),
        SessionSummary(
          id: 4,
          startedAt: DateTime(2026, 11, 19, 10),
          duration: const Duration(minutes: 18),
          pieceCount: 2,
          loggedMinutes: 10,
        ),
      ];
      when(metricsFacade.getMetrics()).thenAnswer((_) async => metrics);
      when(
        sessionFacade.getFinishedSessions(),
      ).thenAnswer((_) async => sessions);

      await cubit.load();

      expect(cubit.state.loadStatus, MetricsLoadStatus.loaded);
      expect(cubit.state.metricsId, 3);
      expect(cubit.state.goalMinutes, 60);
      expect(cubit.state.streakDays, 3);
      expect(cubit.state.todayMinutes, 30);
      verify(metricsFacade.getMetrics()).called(1);
      verify(sessionFacade.getFinishedSessions()).called(1);
    },
  );
}
