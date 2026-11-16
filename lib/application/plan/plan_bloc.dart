import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/plan_action_status.dart';
import 'package:ensayo/domain/plan/plan_filter.dart';
import 'package:ensayo/domain/plan/plan_load_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'plan_bloc.freezed.dart';
part 'plan_event.dart';
part 'plan_state.dart';

/// Reloads after every write so the list always mirrors the database.
@injectable
class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc(this._facade) : super(const PlanState()) {
    on<_Started>(_onStarted);
    on<_FilterChanged>(_onFilterChanged);
    on<_PieceSaved>(_onPieceSaved);
    on<_PieceDeleted>(_onPieceDeleted);
  }

  final IPlanFacade _facade;

  Future<void> _onStarted(_Started event, Emitter<PlanState> emit) async {
    emit(state.copyWith(loadStatus: PlanLoadStatus.loading));
    await _reload(emit);
  }

  void _onFilterChanged(_FilterChanged event, Emitter<PlanState> emit) {
    emit(state.copyWith(filter: event.filter));
  }

  Future<void> _onPieceSaved(_PieceSaved event, Emitter<PlanState> emit) =>
      _write(emit, () => _facade.savePiece(event.piece));

  Future<void> _onPieceDeleted(_PieceDeleted event, Emitter<PlanState> emit) =>
      _write(emit, () => _facade.deletePiece(event.id));

  /// A failed reload still reports success: the write itself was stored.
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
