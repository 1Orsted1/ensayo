/// Lengths count runes, so an emoji is one character, not two code units.
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
  if (title.runes.length > maxTitleLength) return PieceFieldError.titleTooLong;
  return null;
}

PieceFieldError? validateComposer(String input) {
  if (input.trim().runes.length > maxComposerLength) {
    return PieceFieldError.composerTooLong;
  }
  return null;
}

PieceFieldError? validateTargetBpm(String input) {
  final text = input.trim();
  if (text.isEmpty) return null;
  final bpm = int.tryParse(text);
  if (bpm == null || bpm < minTargetBpm || bpm > maxTargetBpm) {
    return PieceFieldError.bpmOutOfRange;
  }
  return null;
}
