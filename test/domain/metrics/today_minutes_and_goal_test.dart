import 'package:clock/clock.dart';
import 'package:ensayo/domain/metrics/today_minutes.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("today's minutes", () {
    test('sums twenty and ten logged minutes from sessions finished today', () {
      final now = DateTime(2026, 11, 18, 12);
      final sessions = [
        SessionSummary(
          id: 1,
          startedAt: DateTime(2026, 11, 18, 8),
          duration: const Duration(minutes: 32),
          pieceCount: 1,
          loggedMinutes: 20,
        ),
        SessionSummary(
          id: 2,
          startedAt: DateTime(2026, 11, 18, 10),
          duration: const Duration(minutes: 25),
          pieceCount: 2,
          loggedMinutes: 10,
        ),
      ];

      withClock(Clock.fixed(now), () {
        expect(minutesOn(clock.now(), sessions), 30);
      });
    });
  });
}
