part of 'plan_bloc.dart';

sealed class PlanEvent {
  const PlanEvent();
}

/// Loads the plan. Also used to retry after a failed load.
final class PlanStarted extends PlanEvent {
  const PlanStarted();
}

final class PlanFilterChanged extends PlanEvent {
  const PlanFilterChanged(this.filter);
  final PlanFilter filter;
}

/// Adds the piece when its id is null, otherwise updates it.
final class PlanPieceSaved extends PlanEvent {
  const PlanPieceSaved(this.piece);
  final Piece piece;
}

final class PlanPieceDeleted extends PlanEvent {
  const PlanPieceDeleted(this.id);
  final int id;
}

// @freezed
// abstract class PlanEventPrefered with _$PlanEvent{
//     const factory PlanEventPrefered.customEvent(String param) = _CustomEvent;

// }
