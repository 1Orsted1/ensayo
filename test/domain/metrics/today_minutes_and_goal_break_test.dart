import 'package:clock/clock.dart';
import 'package:ensayo/domain/metrics/daily_goal.dart';
import 'package:ensayo/domain/metrics/today_minutes.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:flutter_test/flutter_test.dart';

SessionSummary _session({
  required int id,
  required DateTime startedAt,
  required Duration duration,
}) {
  return SessionSummary(
    id: id,
    startedAt: startedAt,
    duration: duration,
    pieceCount: 0,
  );
}

void main() {
  group("today's minutes and daily goal adversarial cases", () {
    test('a session from yesterday contributes nothing today', () {
      final now = DateTime(2026, 11, 18, 12);
      final yesterday = _session(
        id: 1,
        startedAt: DateTime(2026, 11, 17, 18),
        duration: const Duration(minutes: 40),
      );

      withClock(Clock.fixed(now), () {
        expect(minutesOn(clock.now(), [yesterday]), 0);
      });
    });

    test('a cross-midnight session belongs entirely to its start day', () {
      final now = DateTime(2026, 11, 18, 0, 20);
      final session = _session(
        id: 1,
        startedAt: DateTime(2026, 11, 17, 23, 50),
        duration: const Duration(minutes: 30),
      );

      withClock(Clock.fixed(now), () {
        expect(minutesOn(DateTime(2026, 11, 17), [session]), 30);
        expect(minutesOn(clock.now(), [session]), 0);
      });
    });

    test('goal values are clamped to the nearest range limit', () {
      expect(clampGoal(3), minGoal);
      expect(clampGoal(241), maxGoal);
    });

    test('goal defaults and steps use the specified five-minute range', () {
      expect(defaultGoal, 60);
      expect(goalStep, 5);
      expect(minGoal, 5);
      expect(maxGoal, 240);
      expect(defaultGoal % goalStep, 0);
      expect(clampGoal(defaultGoal + goalStep), 65);
    });
  });
}
