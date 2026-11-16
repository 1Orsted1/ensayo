import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/i18n/strings.g.dart';

/// Translated names for plan enums, shared by the plan list and the form.

String statusLabel(Translations t, PieceStatus status) => switch (status) {
  PieceStatus.learning => t.plan.status.learning,
  PieceStatus.polishing => t.plan.status.polishing,
  PieceStatus.performanceReady => t.plan.status.performanceReady,
  PieceStatus.archived => t.plan.status.archived,
};

String focusTagLabel(Translations t, FocusTag tag) => switch (tag) {
  FocusTag.technique => t.plan.tag.technique,
  FocusTag.repertoire => t.plan.tag.repertoire,
  FocusTag.sightReading => t.plan.tag.sightReading,
  FocusTag.theory => t.plan.tag.theory,
  FocusTag.improvisation => t.plan.tag.improvisation,
};

String filterLabel(Translations t, PlanFilter filter) => switch (filter) {
  PlanFilter.all => t.plan.filter.all,
  PlanFilter.learning => statusLabel(t, PieceStatus.learning),
  PlanFilter.polishing => statusLabel(t, PieceStatus.polishing),
  PlanFilter.performanceReady => statusLabel(t, PieceStatus.performanceReady),
  PlanFilter.archived => statusLabel(t, PieceStatus.archived),
};
