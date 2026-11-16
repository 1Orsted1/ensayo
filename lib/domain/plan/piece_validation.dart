/// Input rules for the Add/Edit Piece form.
///
/// Each validator takes the raw field text and returns `null` when it's valid,
/// or a [PieceFieldError] that the UI maps to translated text.
library;

const int maxTitleLength = 80;
const int maxComposerLength = 60;
const int minTargetBpm = 1;
const int maxTargetBpm = 300;

enum PieceFieldError {
  titleRequired,
  titleTooLong,
  composerTooLong,
  bpmOutOfRange,
}

PieceFieldError? validateTitle(String input) {
  final title = input.trim();
  if (title.isEmpty) return PieceFieldError.titleRequired;
  if (title.length > maxTitleLength) return PieceFieldError.titleTooLong;
  return null;
}

/// Composer is optional; only its length is checked.
PieceFieldError? validateComposer(String input) {
  if (input.trim().length > maxComposerLength) {
    return PieceFieldError.composerTooLong;
  }
  return null;
}

/// Target tempo is optional; when given it must be a whole number in range.
PieceFieldError? validateTargetBpm(String input) {
  final text = input.trim();
  if (text.isEmpty) return null;
  final bpm = int.tryParse(text);
  if (bpm == null || bpm < minTargetBpm || bpm > maxTargetBpm) {
    return PieceFieldError.bpmOutOfRange;
  }
  return null;
}
