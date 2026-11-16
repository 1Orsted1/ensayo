import 'package:drift/drift.dart' as drift;
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/i_plan_data_source.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IPlanDataSource)
class PlanDataSourceImp implements IPlanDataSource {
  PlanDataSourceImp({required this.dataBase});
  final AppDatabase dataBase;

  @override
  Future<List<Piece>> getPieces() async {
    final songs = await _getSongsDescendingOrd();
    final tagsBySong = await _focusTagsBySong();
    return [
      for (final song in songs) _toPiece(song, tagsBySong[song.id] ?? {}),
    ];
  }

  @override
  Future<Piece> savePiece(Piece piece) {
    return dataBase.transaction(() async {
      final row = _toSongRow(piece);
      final songId = piece.id == null
          ? await _insertSong(row)
          : await _updateSong(piece.id!, row);
      await _replaceTags(songId, piece.tags);
      return piece.copyWith(id: songId);
    });
  }

  @override
  Future<void> deletePiece(int id) {
    return dataBase.transaction(() async {
      // Foreign-key cascades aren't enabled, so remove tag rows explicitly.
      await _deleteTagsOf(id);
      await (dataBase.delete(
        dataBase.songs,
      )..where((t) => t.id.equals(id))).go();
    });
  }

  Future<List<Song>> _getSongsDescendingOrd() {
    return (dataBase.select(
      dataBase.songs,
    )..orderBy([(t) => drift.OrderingTerm.desc(t.id)])).get();
  }

  Future<Map<int, Set<FocusTag>>> _focusTagsBySong() async {
    final query = dataBase.select(dataBase.tagsAssigned).join([
      drift.innerJoin(
        dataBase.tags,
        dataBase.tags.id.equalsExp(dataBase.tagsAssigned.tagsId),
      ),
    ]);
    final focusTagsByName = FocusTag.values.asNameMap();

    final tagsBySong = <int, Set<FocusTag>>{};
    for (final row in await query.get()) {
      final songId = row.readTable(dataBase.tagsAssigned).songId;
      final focusTag = focusTagsByName[row.readTable(dataBase.tags).name];
      if (focusTag == null) continue;
      tagsBySong.putIfAbsent(songId, () => {}).add(focusTag);
    }
    return tagsBySong;
  }

  Piece _toPiece(Song song, Set<FocusTag> tags) {
    return Piece(
      id: song.id,
      title: song.name,
      composer: song.composer,
      status: song.status,
      targetBpm: song.targetBpm,
      tags: tags,
    );
  }

  SongsCompanion _toSongRow(Piece piece) {
    return SongsCompanion(
      name: drift.Value(piece.title),
      composer: drift.Value(piece.composer),
      status: drift.Value(piece.status),
      targetBpm: drift.Value(piece.targetBpm),
    );
  }

  Future<int> _insertSong(SongsCompanion row) async {
    final song = await dataBase.into(dataBase.songs).insertReturning(row);
    return song.id;
  }

  Future<int> _updateSong(int id, SongsCompanion row) async {
    final updated = await (dataBase.update(
      dataBase.songs,
    )..where((t) => t.id.equals(id))).write(row);
    if (updated == 0) throw StateError('Piece $id does not exist');
    return id;
  }

  Future<void> _replaceTags(int songId, Set<FocusTag> focusTags) async {
    await _deleteTagsOf(songId);
    if (focusTags.isEmpty) return;

    final tagIds = await _tagIdsByName();
    await dataBase.batch((b) {
      b.insertAll(dataBase.tagsAssigned, [
        for (final focusTag in focusTags)
          TagsAssignedCompanion.insert(
            songId: songId,
            tagsId:
                tagIds[focusTag.name] ??
                (throw StateError('Focus tag ${focusTag.name} is not seeded')),
          ),
      ]);
    });
  }

  Future<void> _deleteTagsOf(int songId) {
    return (dataBase.delete(
      dataBase.tagsAssigned,
    )..where((t) => t.songId.equals(songId))).go();
  }

  Future<Map<String, int>> _tagIdsByName() async {
    final tags = await dataBase.select(dataBase.tags).get();
    return {for (final tag in tags) tag.name: tag.id};
  }
}
