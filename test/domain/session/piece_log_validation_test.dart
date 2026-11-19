import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:ensayo/domain/session/piece_log_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('piece log validation', () {
    test('valid duration, note and tempo pass', () {
      expect(validateDuration(15), isNull);
      expect(validateNote('Rubato breathing'), isNull);
      expect(validateTargetBpm('120'), isNull);
    });
  });
}
