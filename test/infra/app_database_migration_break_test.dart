import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:drift/native.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:ensayo/infra/plan/plan_data_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/v1_database.dart';

void main() {
  final focusKeys = FocusTag.values.map((t) => t.name);

  Future<List<String>> tagNames(AppDatabase db) async =>
      (await db.select(db.tags).get()).map((t) => t.name).toList();

  test('tag rows the old version already had are kept and the seed does not '
      'duplicate a matching key', () async {
    final db = openV1Database([
      "INSERT INTO tags (name) VALUES ('technique')",
      "INSERT INTO tags (name) VALUES ('Warm-ups')",
    ]);
    addTearDown(db.close);

    final names = await tagNames(db);

    expect(names.where((n) => n == 'technique'), hasLength(1));
    expect(names, contains('Warm-ups'));
    expect(names.toSet(), containsAll(focusKeys));
    expect(names, hasLength(FocusTag.values.length + 1));
  });

  test('an old song tagged with a matching key and a custom tag lists with '
      'the focus tag only', () async {
    final db = openV1Database([
      "INSERT INTO tags (id, name) VALUES (1, 'technique')",
      "INSERT INTO tags (id, name) VALUES (2, 'Warm-ups')",
      "INSERT INTO songs (id, name) VALUES (1, 'Partita No. 2')",
      'INSERT INTO tags_assigned (tags_id, song_id) VALUES (1, 1)',
      'INSERT INTO tags_assigned (tags_id, song_id) VALUES (2, 1)',
    ]);
    addTearDown(db.close);

    final pieces = await PlanDataSourceImp(dataBase: db).getPieces();

    expect(pieces, [
      const Piece(id: 1, title: 'Partita No. 2', tags: {FocusTag.technique}),
    ]);
  });

  test('several old songs, including unicode names, keep their ids, names '
      'and newest-first order', () async {
    final db = openV1Database([
      "INSERT INTO songs (name) VALUES ('Gymnopédie No. 1')",
      "INSERT INTO songs (name) VALUES ('荒城の月 (Kōjō no Tsuki)')",
      "INSERT INTO songs (name) VALUES ('Nocturne Op. 9')",
    ]);
    addTearDown(db.close);

    final pieces = await PlanDataSourceImp(dataBase: db).getPieces();

    expect(pieces.map((p) => (p.id, p.title)), [
      (3, 'Nocturne Op. 9'),
      (2, '荒城の月 (Kōjō no Tsuki)'),
      (1, 'Gymnopédie No. 1'),
    ]);
    expect(pieces.map((p) => p.status), everyElement(PieceStatus.learning));
  });

  test(
    'an old song can be edited and tagged right after the upgrade',
    () async {
      final db = openV1Database([
        "INSERT INTO songs (name) VALUES ('Cello Suite No. 1')",
      ]);
      addTearDown(db.close);
      final dataSource = PlanDataSourceImp(dataBase: db);
      final old = (await dataSource.getPieces()).single;

      await dataSource.savePiece(
        old.copyWith(
          composer: 'Bach',
          status: PieceStatus.polishing,
          targetBpm: 60,
          tags: {FocusTag.repertoire},
        ),
      );

      expect(await dataSource.getPieces(), [
        Piece(
          id: old.id,
          title: 'Cello Suite No. 1',
          composer: 'Bach',
          status: PieceStatus.polishing,
          targetBpm: 60,
          tags: const {FocusTag.repertoire},
        ),
      ]);
    },
  );

  test('opening the upgraded database again (app restart) keeps the piece '
      'and does not seed the tags twice', () async {
    dynamic raw;
    final first = openV1Database([
      "INSERT INTO songs (name) VALUES ('Cello Suite No. 1')",
    ], onRawOpened: (r) => raw = r);
    addTearDown(first.close);
    await first.select(first.songs).get(); // runs the upgrade

    final restarted = reopen(raw);
    final songs = await restarted.select(restarted.songs).get();
    final names = await tagNames(restarted);
    await restarted.close();

    expect(songs.single.name, 'Cello Suite No. 1');
    expect(songs.single.status, PieceStatus.learning);
    expect(names, unorderedEquals(focusKeys));
  });

  test('a fresh install has an empty plan and the five focus tags, and '
      'a piece saved there survives a restart', () async {
    dynamic raw;
    final first = AppDatabase(NativeDatabase.memory(setup: (r) => raw = r));
    addTearDown(first.close);
    final dataSource = PlanDataSourceImp(dataBase: first);
    expect(await dataSource.getPieces(), isEmpty);
    expect(await tagNames(first), unorderedEquals(focusKeys));
    final saved = await dataSource.savePiece(
      const Piece(title: 'Gigue', targetBpm: 96, tags: {FocusTag.theory}),
    );

    final restarted = reopen(raw);
    final pieces = await PlanDataSourceImp(dataBase: restarted).getPieces();
    final names = await tagNames(restarted);
    await restarted.close();

    expect(pieces, [saved]);
    expect(names, unorderedEquals(focusKeys));
  });
}
