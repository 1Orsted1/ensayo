import 'package:ensayo/application/logs/logs_bloc.dart';
import 'package:ensayo/domain/logs/logs_load_status.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/domain/session/session_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/recording_bloc_observer.dart';
import 'logs_bloc_break_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ISessionFacade>()])
void main() {
  late MockISessionFacade facade;
  late LogsBloc bloc;
  late RecordingBlocObserver observer;
  final storageError = Exception('disk I/O error');

  setUp(() {
    observer = RecordingBlocObserver.install(addTearDown);
    facade = MockISessionFacade();
    bloc = LogsBloc(facade);
  });

  tearDown(() => bloc.close());

  Future<void> start() async {
    bloc.add(const LogsEvent.started());
    await pumpEventQueue();
  }

  group('LogsBloc adversarial cases', () {
    test('an empty history is loaded, not a failure', () async {
      when(facade.getFinishedSessions()).thenAnswer((_) async => []);

      await start();

      expect(bloc.state.loadStatus, LogsLoadStatus.loaded);
      expect(bloc.state.sessions, isEmpty);
      expect(observer.errors, isEmpty);
      verify(facade.getFinishedSessions()).called(1);
    });

    test('a failed load reports failure and a retry succeeds', () async {
      when(facade.getFinishedSessions())
          .thenAnswer((_) async => throw storageError);

      await start();

      expect(bloc.state.loadStatus, LogsLoadStatus.failure);
      expect(observer.errors, [storageError]);

      final sessions = [
        SessionSummary(
          id: 1,
          startedAt: DateTime(2026, 11, 19, 9),
          duration: const Duration(minutes: 25),
          pieceCount: 2,
        ),
      ];
      when(facade.getFinishedSessions()).thenAnswer((_) async => sessions);
      await start();

      expect(bloc.state.loadStatus, LogsLoadStatus.loaded);
      expect(bloc.state.sessions, sessions);
      verify(facade.getFinishedSessions()).called(2);
    });
  });
}
