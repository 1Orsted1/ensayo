import 'dart:async';

import 'package:clock/clock.dart';
import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/domain/metrics/goal_save_status.dart';
import 'package:ensayo/domain/metrics/i_metrics_facade.dart';
import 'package:ensayo/domain/metrics/metrics_data.dart';
import 'package:ensayo/domain/metrics/metrics_load_status.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/recording_bloc_observer.dart';
import 'metrics_cubit_break_test.mocks.dart';

final _now = DateTime(2026, 11, 19, 12);

// Wall-clock duration runs past the logged minutes so only logged time counts.
SessionSummary _summary(int id, DateTime startedAt, int loggedMinutes) {
  return SessionSummary(
    id: id,
    startedAt: startedAt,
    duration: Duration(minutes: loggedMinutes + 7),
    pieceCount: 1,
    loggedMinutes: loggedMinutes,
  );
}

@GenerateNiceMocks([MockSpec<IMetricsFacade>(), MockSpec<ISessionFacade>()])
void main() {
  late MockIMetricsFacade metricsFacade;
  late MockISessionFacade sessionFacade;
  late MetricsCubit cubit;
  late RecordingBlocObserver observer;
  final storageError = Exception('disk I/O error');

  setUp(() {
    observer = RecordingBlocObserver.install(addTearDown);
    metricsFacade = MockIMetricsFacade();
    sessionFacade = MockISessionFacade();
    cubit = MetricsCubit(metricsFacade, sessionFacade, Clock.fixed(_now));
  });

  tearDown(() => cubit.close());

  group('MetricsCubit adversarial cases', () {
    test('a failed goal save keeps the previous goal', () async {
      const metrics = MetricsData(id: 3, dailyGoalInMinutes: 60);
      when(metricsFacade.getMetrics()).thenAnswer((_) async => metrics);
      when(sessionFacade.getFinishedSessions()).thenAnswer((_) async => []);
      await cubit.load();
      expect(cubit.state.goalMinutes, 60);

      when(
        metricsFacade.updateDailyGoal(
          id: anyNamed('id'),
          minutes: anyNamed('minutes'),
        ),
      ).thenAnswer((_) async => throw storageError);
      await cubit.setDailyGoal(45);

      expect(cubit.state.goalMinutes, 60);
      expect(cubit.state.goalSaveStatus, GoalSaveStatus.failure);
      expect(cubit.state.loadStatus, MetricsLoadStatus.loaded);
      expect(observer.errors, [storageError]);
      verify(metricsFacade.updateDailyGoal(id: 3, minutes: 45)).called(1);
    });

    test(
      'a session facade load failure makes the metrics unavailable',
      () async {
        const metrics = MetricsData(id: 3, dailyGoalInMinutes: 60);
        when(metricsFacade.getMetrics()).thenAnswer((_) async => metrics);
        when(
          sessionFacade.getFinishedSessions(),
        ).thenAnswer((_) async => throw storageError);

        await cubit.load();

        expect(cubit.state.loadStatus, MetricsLoadStatus.failure);
        expect(observer.errors, [storageError]);
        verify(metricsFacade.getMetrics()).called(1);
        verify(sessionFacade.getFinishedSessions()).called(1);
      },
    );

    test('when two loads race, only the latest result wins', () async {
      final firstSessions = Completer<List<SessionSummary>>();
      final secondSessions = Completer<List<SessionSummary>>();
      var metricsCalls = 0;
      var sessionCalls = 0;
      when(metricsFacade.getMetrics()).thenAnswer((_) async {
        metricsCalls += 1;
        return MetricsData(
          id: 3,
          dailyGoalInMinutes: metricsCalls == 1 ? 60 : 45,
        );
      });
      when(sessionFacade.getFinishedSessions()).thenAnswer((_) {
        sessionCalls += 1;
        return sessionCalls == 1 ? firstSessions.future : secondSessions.future;
      });

      final firstLoad = cubit.load();
      await pumpEventQueue();
      final secondLoad = cubit.load();
      await pumpEventQueue();

      secondSessions.complete([
        _summary(1, DateTime(2026, 11, 17, 8), 15),
        _summary(2, DateTime(2026, 11, 18, 18), 25),
        _summary(3, DateTime(2026, 11, 19, 9), 20),
        _summary(4, DateTime(2026, 11, 19, 10), 10),
      ]);
      await secondLoad;
      await pumpEventQueue();

      expect(cubit.state.loadStatus, MetricsLoadStatus.loaded);
      expect(cubit.state.goalMinutes, 45);
      expect(cubit.state.streakDays, 3);
      expect(cubit.state.todayMinutes, 30);

      firstSessions.complete([_summary(5, DateTime(2026, 11, 19, 7), 5)]);
      await firstLoad;
      await pumpEventQueue();

      expect(cubit.state.loadStatus, MetricsLoadStatus.loaded);
      expect(cubit.state.goalMinutes, 45);
      expect(cubit.state.streakDays, 3);
      expect(cubit.state.todayMinutes, 30);

      verify(metricsFacade.getMetrics()).called(2);
      verify(sessionFacade.getFinishedSessions()).called(2);
      expect(observer.errors, isEmpty);
    });
  });
}
