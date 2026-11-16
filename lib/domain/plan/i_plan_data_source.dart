import 'package:ensayo/domain/plan/piece.dart';

abstract class IPlanDataSource {
  /// Newest first.
  Future<List<Piece>> getPieces();

  /// Inserts when the id is null, otherwise updates.
  Future<Piece> savePiece(Piece piece);

  Future<void> deletePiece(int id);
}
