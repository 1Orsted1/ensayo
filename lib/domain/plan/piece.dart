import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'piece.freezed.dart';

/// A piece in the practice plan. A null [id] means it hasn't been saved yet.
@freezed
abstract class Piece with _$Piece {
  const factory Piece({
    int? id,
    required String title,
    String? composer,
    @Default(PieceStatus.learning) PieceStatus status,
    int? targetBpm,
    @Default(<FocusTag>{}) Set<FocusTag> tags,
  }) = _Piece;
}
