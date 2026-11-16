import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Spec: Piece input validation (valid input).
  test('a title, composer and in-range tempo are all valid', () {
    expect(validateTitle('Clair de Lune'), isNull);
    expect(validateComposer('Debussy'), isNull);
    expect(validateTargetBpm('52'), isNull);
  });
}
