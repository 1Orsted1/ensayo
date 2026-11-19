part of 'logs_bloc.dart';

@freezed
abstract class LogsState with _$LogsState {
  const factory LogsState({
    @Default(<SessionSummary>[]) List<SessionSummary> sessions,
    @Default(LogsLoadStatus.loading) LogsLoadStatus loadStatus,
  }) = _LogsState;
}
