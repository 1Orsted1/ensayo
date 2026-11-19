import 'package:ensayo/application/logs/logs_bloc.dart';
import 'package:ensayo/domain/logs/logs_load_status.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logs_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ISessionFacade>()])
void main() {
  test('started loads finished sessions newest first', () async {
    final facade = MockISessionFacade();
    final sessions = [
      SessionSummary(
        id: 2,
        startedAt: DateTime(2026, 11, 19, 9),
        duration: const Duration(minutes: 20),
        pieceCount: 2,
      ),
      SessionSummary(
        id: 1,
        startedAt: DateTime(2026, 11, 18, 18, 5),
        duration: const Duration(minutes: 42),
        pieceCount: 3,
      ),
    ];
    when(facade.getFinishedSessions()).thenAnswer((_) async => sessions);
    final bloc = LogsBloc(facade);
    addTearDown(bloc.close);

    bloc.add(const LogsEvent.started());
    await pumpEventQueue();

    expect(bloc.state.loadStatus, LogsLoadStatus.loaded);
    expect(bloc.state.sessions, sessions);
    verify(facade.getFinishedSessions()).called(1);
  });
}
