import 'package:clock/clock.dart';
import 'package:ensayo/domain/metrics/streak.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('practice streak adversarial cases', () {
    test('yesterday alone keeps a one-day streak alive', () {
      final now = DateTime(2026, 11, 18, 12);

      withClock(Clock.fixed(now), () {
        expect(computeStreak([DateTime(2026, 11, 17, 9)], clock.now()), 1);
      });
    });

    test('a gap with the last practice two days ago breaks the streak', () {
      final now = DateTime(2026, 11, 18, 12);

      withClock(Clock.fixed(now), () {
        expect(computeStreak([DateTime(2026, 11, 16, 9)], clock.now()), 0);
      });
    });

    test('multiple sessions on one calendar day count only once', () {
      final now = DateTime(2026, 11, 18, 20);

      withClock(Clock.fixed(now), () {
        final starts = [DateTime(2026, 11, 18, 8), DateTime(2026, 11, 18, 19)];

        expect(computeStreak(starts, clock.now()), 1);
      });
    });

    test('a cross-midnight session counts by its start day', () {
      final now = DateTime(2026, 11, 18, 0, 20);
      final startedAt = DateTime(2026, 11, 17, 23, 50);

      withClock(Clock.fixed(now), () {
        expect(computeStreak([startedAt], clock.now()), 1);
      });
    });

    test('no finished sessions produces zero', () {
      final now = DateTime(2026, 11, 18, 12);

      withClock(Clock.fixed(now), () {
        expect(computeStreak(const [], clock.now()), 0);
      });
    });

    test('a future-dated session does not create a streak', () {
      final now = DateTime(2026, 11, 18, 12);

      withClock(Clock.fixed(now), () {
        expect(computeStreak([DateTime(2026, 11, 19, 9)], clock.now()), 0);
      });
    });
  });
}
