part of 'logs_bloc.dart';

@freezed
abstract class LogsEvent with _$LogsEvent {
  /// Also dispatched to retry after a failure and to refresh after a session.
  const factory LogsEvent.started() = _Started;
}
