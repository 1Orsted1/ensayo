import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:ensayo/domain/session/piece_log_validation.dart';
import 'package:flutter_test/flutter_test.dart';

String _emojiNote(int runeCount) => List.filled(runeCount, '🎵').join();

void main() {
  group('piece log validation adversarial cases', () {
    test('duration rejects null and values outside 1 through 180', () {
      expect(validateDuration(null), isNotNull);
      expect(validateDuration(0), isNotNull);
      expect(validateDuration(181), isNotNull);
    });

    test('note accepts 500 trimmed runes and rejects 501, including emoji', () {
      final fiveHundredRunes = '  ${_emojiNote(500)}  ';
      final fiveHundredOneRunes = _emojiNote(501);

      expect(fiveHundredRunes.trim().runes.length, 500);
      expect(fiveHundredOneRunes.runes.length, 501);
      expect(validateNote(fiveHundredRunes), isNull);
      expect(validateNote(fiveHundredOneRunes), isNotNull);
    });

    test(
      'tempo enforces its range while accepting typed integers and blank',
      () {
        expect(validateTargetBpm('0'), isNotNull);
        expect(validateTargetBpm('301'), isNotNull);
        expect(validateTargetBpm('007'), isNull);
        expect(validateTargetBpm(''), isNull);
      },
    );
  });
}
