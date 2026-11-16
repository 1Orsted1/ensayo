part of 'plan_bloc.dart';

enum PlanFilter { all, learning, polishing, performanceReady, archived }

enum PlanLoadStatus { loading, loaded, failure }

/// Outcome of the latest save or delete, so the form knows when to close or
/// show an error.
enum PlanActionStatus { idle, inProgress, success, failure }

@freezed
abstract class PlanState with _$PlanState {
  const PlanState._();

  const factory PlanState({
    @Default(<Piece>[]) List<Piece> pieces,
    @Default(PlanFilter.all) PlanFilter filter,
    @Default(PlanLoadStatus.loading) PlanLoadStatus loadStatus,
    @Default(PlanActionStatus.idle) PlanActionStatus actionStatus,
  }) = _PlanState;

  /// The pieces for the selected filter. "All" leaves out archived pieces.
  List<Piece> get visiblePieces => switch (filter) {
    PlanFilter.all =>
      pieces.where((p) => p.status != PieceStatus.archived).toList(),
    PlanFilter.learning => _withStatus(PieceStatus.learning),
    PlanFilter.polishing => _withStatus(PieceStatus.polishing),
    PlanFilter.performanceReady => _withStatus(PieceStatus.performanceReady),
    PlanFilter.archived => _withStatus(PieceStatus.archived),
  };

  List<Piece> _withStatus(PieceStatus status) =>
      pieces.where((p) => p.status == status).toList();
}
