import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a title of only spaces, tabs or newlines is required', () {
    for (final blank in ['', '   ', '\t', ' \n ']) {
      expect(
        validateTitle(blank),
        PieceFieldError.titleRequired,
        reason: 'title ${blank.codeUnits}',
      );
    }
  });

  test('80 characters is the longest title, counted after trimming', () {
    expect(validateTitle('a' * 80), isNull);
    expect(validateTitle('  ${'a' * 80}  '), isNull);
    expect(validateTitle('a' * 81), PieceFieldError.titleTooLong);
  });

  test('60 characters is the longest composer; empty is fine', () {
    expect(validateComposer(''), isNull);
    expect(validateComposer('b' * 60), isNull);
    expect(validateComposer('b' * 61), PieceFieldError.composerTooLong);
  });

  test('tempo boundaries: 1 and 300 pass, 0 and 301 do not', () {
    expect(validateTargetBpm('1'), isNull);
    expect(validateTargetBpm('300'), isNull);
    expect(validateTargetBpm('0'), PieceFieldError.bpmOutOfRange);
    expect(validateTargetBpm('301'), PieceFieldError.bpmOutOfRange);
  });

  test(
    'tempo is optional, and a leading-zero number is read as the number',
    () {
      expect(validateTargetBpm(''), isNull);
      expect(validateTargetBpm('  '), isNull);
      expect(validateTargetBpm('007'), isNull);
      expect(validateTargetBpm('0300'), isNull);
      expect(validateTargetBpm('000'), PieceFieldError.bpmOutOfRange);
    },
  );

  test('a tempo that is not a whole number is rejected', () {
    for (final bad in [
      '52.5',
      '-60',
      'abc',
      '1e2',
      '12 0',
      '99999999999999999999',
    ]) {
      expect(
        validateTargetBpm(bad),
        PieceFieldError.bpmOutOfRange,
        reason: 'tempo "$bad"',
      );
    }
  });

  // Each emoji is two UTF-16 code units; limits must count characters.
  test('emoji count as one character each toward the 80-character limit', () {
    final title = '${'a' * 76}🎻🎹🎼🎵'; // 80 characters

    expect(title.runes.length, 80);
    expect(validateTitle(title), isNull);
  });
}
