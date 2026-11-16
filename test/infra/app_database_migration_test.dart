import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/v1_database.dart';

void main() {
  late AppDatabase db;

  tearDown(() => db.close());

  // Spec: Existing data survives the upgrade / Upgrade with an existing piece.
  test('a song stored by version 1 opens as Learning with no composer or '
      'tempo', () async {
    db = openV1Database([
      "INSERT INTO songs (name) VALUES ('Cello Suite No. 1')",
    ]);

    final song = (await db.select(db.songs).get()).single;

    expect(song.name, 'Cello Suite No. 1');
    expect(song.status, PieceStatus.learning);
    expect(song.composer, isNull);
    expect(song.targetBpm, isNull);
  });
}
