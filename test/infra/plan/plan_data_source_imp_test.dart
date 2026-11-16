import 'package:drift/native.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:ensayo/infra/plan/plan_data_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late PlanDataSourceImp dataSource;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    dataSource = PlanDataSourceImp(dataBase: db);
  });

  tearDown(() => db.close());

  const clairDeLune = Piece(
    title: 'Clair de Lune',
    composer: 'Debussy',
    status: PieceStatus.learning,
    targetBpm: 52,
    tags: {FocusTag.technique, FocusTag.repertoire},
  );

  test('an empty plan returns no pieces', () async {
    expect(await dataSource.getPieces(), isEmpty);
  });

  test('a saved piece reads back with all its values and tags', () async {
    final saved = await dataSource.savePiece(clairDeLune);

    expect(saved.id, isNotNull);
    expect(await dataSource.getPieces(), [clairDeLune.copyWith(id: saved.id)]);
  });

  test('pieces are listed newest first', () async {
    await dataSource.savePiece(const Piece(title: 'Gigue'));
    await dataSource.savePiece(const Piece(title: 'Nocturne'));

    final titles = (await dataSource.getPieces()).map((p) => p.title);
    expect(titles, ['Nocturne', 'Gigue']);
  });

  test('updating a piece changes its fields and replaces its tags', () async {
    final saved = await dataSource.savePiece(clairDeLune);
    await dataSource.savePiece(const Piece(title: 'Later piece'));

    final edited = saved.copyWith(
      status: PieceStatus.polishing,
      tags: {FocusTag.technique},
    );
    await dataSource.savePiece(edited);

    final pieces = await dataSource.getPieces();
    expect(pieces.map((p) => p.title), ['Later piece', 'Clair de Lune']);
    expect(pieces.last, edited);
  });

  test('optional values can be cleared on update', () async {
    final saved = await dataSource.savePiece(clairDeLune);

    await dataSource.savePiece(
      saved.copyWith(composer: null, targetBpm: null, tags: {}),
    );

    final piece = (await dataSource.getPieces()).single;
    expect(piece.composer, isNull);
    expect(piece.targetBpm, isNull);
    expect(piece.tags, isEmpty);
  });

  test('deleting a piece removes the song and its tag rows', () async {
    final saved = await dataSource.savePiece(clairDeLune);

    await dataSource.deletePiece(saved.id!);

    expect(await dataSource.getPieces(), isEmpty);
    expect(await db.select(db.songs).get(), isEmpty);
    expect(await db.select(db.tagsAssigned).get(), isEmpty);
  });

  test('focus tags are seeded once and not duplicated by saves', () async {
    await dataSource.savePiece(clairDeLune);
    await dataSource.savePiece(clairDeLune.copyWith(title: 'Second'));

    final names = (await db.select(db.tags).get()).map((t) => t.name);
    expect(names, unorderedEquals(FocusTag.values.map((t) => t.name)));
  });
}
