import 'package:ensayo/domain/plan/piece.dart';

abstract class IPlanFacade {
  /// All pieces in the plan, newest first.
  Future<List<Piece>> getPieces();

  /// Inserts the piece when its id is null, otherwise updates it.
  /// Returns the stored piece (with its id).
  Future<Piece> savePiece(Piece piece);

  /// Removes the piece and its focus tags.
  Future<void> deletePiece(int id);
}
