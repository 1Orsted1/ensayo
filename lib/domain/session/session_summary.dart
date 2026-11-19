import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_summary.freezed.dart';

@freezed
abstract class SessionSummary with _$SessionSummary {
  const factory SessionSummary({
    required int id,
    required DateTime startedAt,
    required Duration duration,
    required int pieceCount,

    /// Sum of the minutes the user logged per piece; drives the daily goal.
    required int loggedMinutes,
  }) = _SessionSummary;
}
