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

  Future<int> tagRowsOf(int songId) async => (await (db.select(
    db.tagsAssigned,
  )..where((t) => t.songId.equals(songId))).get()).length;

  test('a piece with all five tags is listed once, and newest-first order '
      'survives the tag join', () async {
    final gigue = await dataSource.savePiece(
      const Piece(title: 'Gigue', tags: {...FocusTag.values}),
    );
    final nocturne = await dataSource.savePiece(
      const Piece(title: 'Nocturne', tags: {FocusTag.theory}),
    );

    expect(await dataSource.getPieces(), [nocturne, gigue]);
  });

  test('editing the oldest piece keeps its position and replaces all its '
      'tags with none', () async {
    final gigue = await dataSource.savePiece(
      const Piece(title: 'Gigue', targetBpm: 90, tags: {...FocusTag.values}),
    );
    final nocturne = await dataSource.savePiece(const Piece(title: 'Nocturne'));

    final edited = gigue.copyWith(
      status: PieceStatus.performanceReady,
      targetBpm: null,
      tags: {},
    );
    await dataSource.savePiece(edited);

    expect(await dataSource.getPieces(), [nocturne, edited]);
    expect(await tagRowsOf(gigue.id!), 0);
  });

  test('updating an id that no longer exists fails and does not recreate '
      'the piece', () async {
    final gigue = await dataSource.savePiece(const Piece(title: 'Gigue'));
    await dataSource.deletePiece(gigue.id!);

    await expectLater(
      dataSource.savePiece(gigue.copyWith(tags: {FocusTag.theory})),
      throwsA(anything),
    );
    expect(await dataSource.getPieces(), isEmpty);
    expect(await db.select(db.tagsAssigned).get(), isEmpty);
  });

  test(
    'deleting a missing id is harmless and leaves other pieces alone',
    () async {
      final gigue = await dataSource.savePiece(
        const Piece(title: 'Gigue', tags: {FocusTag.technique}),
      );

      await dataSource.deletePiece(gigue.id! + 100);

      expect(await dataSource.getPieces(), [gigue]);
    },
  );

  test(
    'deleting a piece removes its tag rows but not another piece\'s',
    () async {
      final gigue = await dataSource.savePiece(
        const Piece(title: 'Gigue', tags: {FocusTag.technique}),
      );
      final nocturne = await dataSource.savePiece(
        const Piece(title: 'Nocturne', tags: {FocusTag.technique}),
      );

      await dataSource.deletePiece(gigue.id!);

      expect(await dataSource.getPieces(), [nocturne]);
      expect(await tagRowsOf(gigue.id!), 0);
      expect(await tagRowsOf(nocturne.id!), 1);
    },
  );

  test('unicode and an 80-character title round-trip unchanged', () async {
    final long = 'Ä' * 80;
    final unicode = await dataSource.savePiece(
      const Piece(title: '荒城の月 🎻 Gymnopédie', composer: 'Erik Satie — 1888'),
    );
    final longPiece = await dataSource.savePiece(Piece(title: long));

    expect(await dataSource.getPieces(), [longPiece, unicode]);
  });

  // Validation enforces 80 characters; storage only guards 160 code units.
  test(
    '80 emoji (160 code units) are stored and read back unchanged',
    () async {
      final title = '🎻' * 80;
      expect(title.length, 160);

      final saved = await dataSource.savePiece(Piece(title: title));

      expect(await dataSource.getPieces(), [saved]);
      expect(saved.title, title);
    },
  );

  test('a title over 160 code units is rejected by storage and nothing is '
      'written', () async {
    await expectLater(
      dataSource.savePiece(
        Piece(title: 'x' * 161, tags: const {FocusTag.theory}),
      ),
      throwsA(anything),
    );

    expect(await dataSource.getPieces(), isEmpty);
    expect(await db.select(db.tagsAssigned).get(), isEmpty);
  });

  test(
    'a save that fails while writing tags rolls back the new song',
    () async {
      // A tag missing from Tags (e.g. a damaged seed) fails after the song row
      // was inserted.
      await (db.delete(db.tags)..where((t) => t.name.equals('theory'))).go();

      await expectLater(
        dataSource.savePiece(
          const Piece(title: 'Gigue', tags: {FocusTag.theory}),
        ),
        throwsA(anything),
      );

      expect(await dataSource.getPieces(), isEmpty);
    },
  );
}
