const int minPieceMinutes = 1;
const int maxPieceMinutes = 180;
const int maxPieceNoteLength = 500;

enum PieceLogFieldError { durationOutOfRange, noteTooLong }

PieceLogFieldError? validateDuration(int? minutes) {
  if (minutes == null ||
      minutes < minPieceMinutes ||
      minutes > maxPieceMinutes) {
    return PieceLogFieldError.durationOutOfRange;
  }
  return null;
}

/// Length counts runes after trimming, so an emoji is one character.
PieceLogFieldError? validateNote(String input) {
  if (input.trim().runes.length > maxPieceNoteLength) {
    return PieceLogFieldError.noteTooLong;
  }
  return null;
}
