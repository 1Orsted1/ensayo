import 'package:ensayo/domain/session/piece_mood.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'piece_log.freezed.dart';

@freezed
abstract class PieceLogInput with _$PieceLogInput {
  const factory PieceLogInput({
    required int minutes,
    PieceMood? mood,
    int? tempoBpm,
    String? note,
  }) = _PieceLogInput;
}

@freezed
abstract class PieceLog with _$PieceLog {
  const factory PieceLog({
    required int sessionId,
    int? songId,
    required String pieceTitle,
    required int minutes,
    PieceMood? mood,
    int? tempoBpm,
    String? note,
    required DateTime loggedAt,
  }) = _PieceLog;
}
