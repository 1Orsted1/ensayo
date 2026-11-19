import 'package:ensayo/domain/logs/logs_load_status.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'logs_bloc.freezed.dart';
part 'logs_event.dart';
part 'logs_state.dart';

@injectable
class LogsBloc extends Bloc<LogsEvent, LogsState> {
  LogsBloc(this._facade) : super(const LogsState()) {
    on<_Started>(_onStarted);
  }

  final ISessionFacade _facade;

  Future<void> _onStarted(_Started event, Emitter<LogsState> emit) async {
    emit(state.copyWith(loadStatus: LogsLoadStatus.loading));
    try {
      final sessions = await _facade.getFinishedSessions();
      emit(
        state.copyWith(sessions: sessions, loadStatus: LogsLoadStatus.loaded),
      );
    } catch (e, s) {
      addError(e, s);
      emit(state.copyWith(loadStatus: LogsLoadStatus.failure));
    }
  }
}
