import 'package:drift/drift.dart' as drift;
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/i_plan_data_source.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/infra/app_database.dart';
import 'package:injectable/injectable.dart';

/// Stores pieces in `Songs`, and their focus tags as `TagsAssigned` rows
/// pointing at the seeded `Tags`.
@Injectable(as: IPlanDataSource)
class PlanDataSourceImp implements IPlanDataSource {
  PlanDataSourceImp({required this.dataBase});
  final AppDatabase dataBase;

  @override
  Future<List<Piece>> getPieces() async {
    final query = dataBase.select(dataBase.songs).join([
      drift.leftOuterJoin(
        dataBase.tagsAssigned,
        dataBase.tagsAssigned.songId.equalsExp(dataBase.songs.id),
      ),
      drift.leftOuterJoin(
        dataBase.tags,
        dataBase.tags.id.equalsExp(dataBase.tagsAssigned.tagsId),
      ),
    ])..orderBy([drift.OrderingTerm.desc(dataBase.songs.id)]);

    // One row per (song, tag), so group the tags back onto each song.
    // Map literals keep insertion order, which preserves the newest-first sort.
    final songs = <int, Song>{};
    final tagsBySong = <int, Set<FocusTag>>{};
    final focusTagsByName = FocusTag.values.asNameMap();

    for (final row in await query.get()) {
      final song = row.readTable(dataBase.songs);
      songs[song.id] = song;
      final tags = tagsBySong.putIfAbsent(song.id, () => {});
      final tagName = row.readTableOrNull(dataBase.tags)?.name;
      final focusTag = focusTagsByName[tagName];
      if (focusTag != null) tags.add(focusTag);
    }

    return [
      for (final song in songs.values)
        Piece(
          id: song.id,
          title: song.name,
          composer: song.composer,
          status: song.status,
          targetBpm: song.targetBpm,
          tags: tagsBySong[song.id]!,
        ),
    ];
  }

  @override
  Future<Piece> savePiece(Piece piece) {
    return dataBase.transaction(() async {
      final row = SongsCompanion(
        name: drift.Value(piece.title),
        composer: drift.Value(piece.composer),
        status: drift.Value(piece.status),
        targetBpm: drift.Value(piece.targetBpm),
      );

      final int songId;
      if (piece.id == null) {
        songId = (await dataBase.into(dataBase.songs).insertReturning(row)).id;
      } else {
        songId = piece.id!;
        final updated = await (dataBase.update(
          dataBase.songs,
        )..where((t) => t.id.equals(songId))).write(row);
        if (updated == 0) {
          throw StateError('Piece $songId does not exist');
        }
      }

      await _replaceTags(songId, piece.tags);
      return piece.copyWith(id: songId);
    });
  }

  @override
  Future<void> deletePiece(int id) {
    // Foreign-key cascades aren't enabled, so remove tag rows explicitly.
    return dataBase.transaction(() async {
      await (dataBase.delete(
        dataBase.tagsAssigned,
      )..where((t) => t.songId.equals(id))).go();
      await (dataBase.delete(
        dataBase.songs,
      )..where((t) => t.id.equals(id))).go();
    });
  }

  Future<void> _replaceTags(int songId, Set<FocusTag> focusTags) async {
    await (dataBase.delete(
      dataBase.tagsAssigned,
    )..where((t) => t.songId.equals(songId))).go();
    if (focusTags.isEmpty) return;

    final tagIdsByName = {
      for (final tag in await dataBase.select(dataBase.tags).get())
        tag.name: tag.id,
    };
    await dataBase.batch((b) {
      b.insertAll(dataBase.tagsAssigned, [
        for (final focusTag in focusTags)
          TagsAssignedCompanion.insert(
            songId: songId,
            tagsId:
                tagIdsByName[focusTag.name] ??
                (throw StateError('Focus tag ${focusTag.name} is not seeded')),
          ),
      ]);
    });
  }
}
