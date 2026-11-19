int computeStreak(Iterable<DateTime> sessionStarts, DateTime now) {
  final today = _calendarDay(now);
  final practicedDays = <DateTime>{
    for (final start in sessionStarts)
      if (!_calendarDay(start).isAfter(today)) _calendarDay(start),
  };

  var cursor = practicedDays.contains(today)
      ? today
      : DateTime(today.year, today.month, today.day - 1);
  if (!practicedDays.contains(cursor)) return 0;

  var streak = 0;
  while (practicedDays.contains(cursor)) {
    streak++;
    cursor = DateTime(cursor.year, cursor.month, cursor.day - 1);
  }
  return streak;
}

DateTime _calendarDay(DateTime value) {
  final local = value.toLocal();
  return DateTime(local.year, local.month, local.day);
}
