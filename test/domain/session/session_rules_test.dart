import 'package:ensayo/domain/session/practice_session.dart';
import 'package:ensayo/domain/session/session_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('session rules', () {
    test('a stale session with logs finishes at its last logged piece', () {
      final now = DateTime(2026, 11, 18, 12);
      final startedAt = now.subtract(const Duration(hours: 13));
      final lastLoggedAt = startedAt.add(const Duration(minutes: 40));
      final session = PracticeSession(
        id: 1,
        startedAt: startedAt,
        endedAt: null,
        loggedSongIds: const {42},
        completedCount: 1,
        lastLoggedAt: lastLoggedAt,
      );

      expect(staleOutcome(session, now), StaleOutcome.finishAt(lastLoggedAt));
    });
  });
}
