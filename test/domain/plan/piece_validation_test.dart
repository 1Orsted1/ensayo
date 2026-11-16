import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validateTitle', () {
    test('blank or whitespace-only title is required', () {
      expect(validateTitle(''), PieceFieldError.titleRequired);
      expect(validateTitle('   '), PieceFieldError.titleRequired);
    });

    test('surrounding spaces are ignored when measuring length', () {
      expect(validateTitle('  Bach  '), isNull);
      expect(validateTitle('  ${'a' * maxTitleLength}  '), isNull);
    });

    test('80 characters is valid, 81 is too long', () {
      expect(validateTitle('a' * maxTitleLength), isNull);
      expect(
        validateTitle('a' * (maxTitleLength + 1)),
        PieceFieldError.titleTooLong,
      );
    });
  });

  group('validateComposer', () {
    test('empty composer is valid (optional)', () {
      expect(validateComposer(''), isNull);
      expect(validateComposer('   '), isNull);
    });

    test('60 characters is valid, 61 is too long', () {
      expect(validateComposer('a' * maxComposerLength), isNull);
      expect(
        validateComposer('a' * (maxComposerLength + 1)),
        PieceFieldError.composerTooLong,
      );
    });
  });

  group('validateTargetBpm', () {
    test('empty tempo is valid (optional)', () {
      expect(validateTargetBpm(''), isNull);
      expect(validateTargetBpm('  '), isNull);
    });

    test('1 and 300 are accepted', () {
      expect(validateTargetBpm('$minTargetBpm'), isNull);
      expect(validateTargetBpm('$maxTargetBpm'), isNull);
    });

    test('0 and 301 are out of range', () {
      expect(validateTargetBpm('0'), PieceFieldError.bpmOutOfRange);
      expect(validateTargetBpm('301'), PieceFieldError.bpmOutOfRange);
    });

    test('non-whole numbers are out of range', () {
      expect(validateTargetBpm('52.5'), PieceFieldError.bpmOutOfRange);
      expect(validateTargetBpm('abc'), PieceFieldError.bpmOutOfRange);
    });
  });
}
