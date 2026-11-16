import 'package:ensayo/domain/plan/piece_status.dart';

enum PlanFilter {
  all,
  learning,
  polishing,
  performanceReady,
  archived;

  /// "All" leaves out archived pieces; they have their own filter.
  bool includes(PieceStatus status) => switch (this) {
    PlanFilter.all => status != PieceStatus.archived,
    PlanFilter.learning => status == PieceStatus.learning,
    PlanFilter.polishing => status == PieceStatus.polishing,
    PlanFilter.performanceReady => status == PieceStatus.performanceReady,
    PlanFilter.archived => status == PieceStatus.archived,
  };
}
