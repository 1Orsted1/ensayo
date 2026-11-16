import 'package:ensayo/domain/plan/i_plan_data_source.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IPlanFacade)
class PlanFacadeImp implements IPlanFacade {
  PlanFacadeImp({required this.planDataSource});

  final IPlanDataSource planDataSource;

  @override
  Future<List<Piece>> getPieces() => planDataSource.getPieces();

  @override
  Future<Piece> savePiece(Piece piece) => planDataSource.savePiece(piece);

  @override
  Future<void> deletePiece(int id) => planDataSource.deletePiece(id);
}
