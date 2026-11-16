import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/plan_load_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/plan_mocks.dart';

void main() {
  test('started loads the plan from the facade', () async {
    final facade = MockIPlanFacade();
    const pieces = [
      Piece(id: 2, title: 'Nocturne'),
      Piece(id: 1, title: 'Gigue'),
    ];
    when(facade.getPieces()).thenAnswer((_) async => pieces);
    final bloc = PlanBloc(facade);
    addTearDown(bloc.close);

    bloc.add(const PlanEvent.started());

    await expectLater(
      bloc.stream,
      emitsThrough(
        isA<PlanState>()
            .having((s) => s.loadStatus, 'loadStatus', PlanLoadStatus.loaded)
            .having((s) => s.pieces, 'pieces', pieces),
      ),
    );
  });
}
