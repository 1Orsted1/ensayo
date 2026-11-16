part of 'plan_bloc.dart';

@freezed
abstract class PlanEvent with _$PlanEvent {
  /// Also dispatched to retry after a failed load.
  const factory PlanEvent.started() = _Started;

  const factory PlanEvent.filterChanged(PlanFilter filter) = _FilterChanged;

  const factory PlanEvent.pieceSaved(Piece piece) = _PieceSaved;

  const factory PlanEvent.pieceDeleted(int id) = _PieceDeleted;
}
