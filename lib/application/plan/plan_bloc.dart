import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'plan_bloc.freezed.dart';
part 'plan_event.dart';
part 'plan_state.dart';

/// The practice plan: its pieces, the status filter, and add/edit/delete.
///
/// Every facade failure is reported with [addError] and shown through the
/// state; nothing is swallowed. The list is reloaded after each write so it
/// always mirrors the database.
@injectable
class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc(this._facade) : super(const PlanState()) {
    on<PlanStarted>(_onStarted);
    on<PlanFilterChanged>(_onFilterChanged);
    on<PlanPieceSaved>(_onPieceSaved);
    on<PlanPieceDeleted>(_onPieceDeleted);
  }

  final IPlanFacade _facade;

  Future<void> _onStarted(PlanStarted event, Emitter<PlanState> emit) async {
    emit(state.copyWith(loadStatus: PlanLoadStatus.loading));
    await _reload(emit);
  }

  void _onFilterChanged(PlanFilterChanged event, Emitter<PlanState> emit) {
    emit(state.copyWith(filter: event.filter));
  }

  Future<void> _onPieceSaved(PlanPieceSaved event, Emitter<PlanState> emit) =>
      _write(emit, () => _facade.savePiece(event.piece));

  Future<void> _onPieceDeleted(
    PlanPieceDeleted event,
    Emitter<PlanState> emit,
  ) => _write(emit, () => _facade.deletePiece(event.id));

  /// Runs a save or delete, then reloads the list.
  ///
  /// If the write succeeds but the reload fails, the action still reports
  /// success (the data is stored) and the list shows its load failure.
  Future<void> _write(
    Emitter<PlanState> emit,
    Future<Object?> Function() action,
  ) async {
    emit(state.copyWith(actionStatus: PlanActionStatus.inProgress));
    try {
      await action();
    } catch (e, s) {
      addError(e, s);
      emit(state.copyWith(actionStatus: PlanActionStatus.failure));
      return;
    }
    await _reload(emit);
    emit(state.copyWith(actionStatus: PlanActionStatus.success));
  }

  Future<void> _reload(Emitter<PlanState> emit) async {
    try {
      final pieces = await _facade.getPieces();
      emit(state.copyWith(pieces: pieces, loadStatus: PlanLoadStatus.loaded));
    } catch (e, s) {
      addError(e, s);
      emit(state.copyWith(loadStatus: PlanLoadStatus.failure));
    }
  }
}
