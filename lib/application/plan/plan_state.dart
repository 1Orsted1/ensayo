part of 'plan_bloc.dart';

@freezed
abstract class PlanState with _$PlanState {
  const PlanState._();

  const factory PlanState({
    @Default(<Piece>[]) List<Piece> pieces,
    @Default(PlanFilter.all) PlanFilter filter,
    @Default(PlanLoadStatus.loading) PlanLoadStatus loadStatus,
    @Default(PlanActionStatus.idle) PlanActionStatus actionStatus,
  }) = _PlanState;

  List<Piece> get visiblePieces =>
      pieces.where((p) => filter.includes(p.status)).toList();
}
