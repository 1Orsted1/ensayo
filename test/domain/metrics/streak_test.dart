import 'package:clock/clock.dart';
import 'package:ensayo/domain/metrics/streak.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('practice streak', () {
    test(
      'today and the two preceding practiced days make a three-day streak',
      () {
        final now = DateTime(2026, 11, 18, 12);

        withClock(Clock.fixed(now), () {
          final starts = [
            DateTime(2026, 11, 16, 8),
            DateTime(2026, 11, 17, 18),
            DateTime(2026, 11, 18, 9),
          ];

          expect(computeStreak(starts, clock.now()), 3);
        });
      },
    );
  });
}
