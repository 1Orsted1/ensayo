import 'package:drift/native.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:ensayo/infra/plan/plan_data_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  // Spec: Add a piece / Add with all fields.
  test('a saved piece reads back with all its values and tags', () async {
    final dataSource = PlanDataSourceImp(dataBase: db);
    const clairDeLune = Piece(
      title: 'Clair de Lune',
      composer: 'Debussy',
      status: PieceStatus.learning,
      targetBpm: 52,
      tags: {FocusTag.technique, FocusTag.repertoire},
    );

    final saved = await dataSource.savePiece(clairDeLune);

    expect(saved.id, isNotNull);
    expect(await dataSource.getPieces(), [clairDeLune.copyWith(id: saved.id)]);
  });
}
