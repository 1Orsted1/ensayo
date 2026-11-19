import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/domain/session/practice_session.dart';
import 'package:ensayo/domain/session/session_rules.dart';
import 'package:flutter_test/flutter_test.dart';

Piece _piece(
  int id,
  String title, [
  PieceStatus status = PieceStatus.learning,
]) {
  return Piece(
    id: id,
    title: title,
    composer: null,
    status: status,
    targetBpm: null,
    tags: const {},
  );
}

PracticeSession _session({
  required DateTime startedAt,
  Set<int> loggedSongIds = const {},
  int completedCount = 0,
  DateTime? lastLoggedAt,
}) {
  return PracticeSession(
    id: 1,
    startedAt: startedAt,
    endedAt: null,
    loggedSongIds: loggedSongIds,
    completedCount: completedCount,
    lastLoggedAt: lastLoggedAt,
  );
}

void main() {
  group('session rules adversarial cases', () {
    test('exactly twelve hours old is still resumable', () {
      final now = DateTime(2026, 11, 18, 12);
      final session = _session(
        startedAt: now.subtract(const Duration(hours: 12)),
      );

      expect(staleOutcome(session, now), const StaleOutcome.resume());
    });

    test('a stale session without logs is discarded', () {
      final now = DateTime(2026, 11, 18, 12);
      final session = _session(
        startedAt: now.subtract(const Duration(hours: 13)),
      );

      expect(staleOutcome(session, now), const StaleOutcome.discard());
    });

    test('suggested minutes floor elapsed time and clamp to 1 through 180', () {
      expect(suggestedPieceMinutes(Duration.zero), 1);
      expect(suggestedPieceMinutes(const Duration(seconds: 59)), 1);
      expect(
        suggestedPieceMinutes(const Duration(minutes: 12, seconds: 40)),
        12,
      );
      expect(suggestedPieceMinutes(const Duration(minutes: 181)), 180);
    });

    test('queue keeps unlogged active pieces in plan order', () {
      final nocturne = _piece(1, 'Nocturne');
      final gigue = _piece(2, 'Gigue', PieceStatus.archived);
      final etude = _piece(3, 'Etude', PieceStatus.polishing);
      final prelude = _piece(4, 'Prelude', PieceStatus.performanceReady);

      final queue = buildQueue([nocturne, gigue, etude, prelude], const {1});

      expect(queue.map((piece) => piece.id), [3, 4]);
    });

    test('queue is empty when every active piece was already logged', () {
      final plan = [
        _piece(1, 'Nocturne'),
        _piece(2, 'Etude', PieceStatus.polishing),
      ];

      expect(buildQueue(plan, const {1, 2}), isEmpty);
    });

    test('queue is empty when every plan piece is archived', () {
      final plan = [
        _piece(1, 'Nocturne', PieceStatus.archived),
        _piece(2, 'Gigue', PieceStatus.archived),
      ];

      expect(buildQueue(plan, const {}), isEmpty);
    });
  });
}
