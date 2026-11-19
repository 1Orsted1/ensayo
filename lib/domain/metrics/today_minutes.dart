import 'package:ensayo/domain/session/session_summary.dart';

int minutesOn(DateTime day, Iterable<SessionSummary> sessions) {
  return sessions
      .where((session) => _isSameDay(session.startedAt, day))
      .fold(0, (total, session) => total + session.duration.inMinutes);
}

bool _isSameDay(DateTime a, DateTime b) {
  final localA = a.toLocal();
  final localB = b.toLocal();
  return localA.year == localB.year &&
      localA.month == localB.month &&
      localA.day == localB.day;
}
