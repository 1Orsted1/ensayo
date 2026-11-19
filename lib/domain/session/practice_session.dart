import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_session.freezed.dart';

@freezed
abstract class PracticeSession with _$PracticeSession {
  const factory PracticeSession({
    required int id,
    required DateTime startedAt,
    DateTime? endedAt,
    @Default(<int>{}) Set<int> loggedSongIds,
    @Default(0) int completedCount,
    DateTime? lastLoggedAt,
  }) = _PracticeSession;
}
