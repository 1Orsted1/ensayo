import 'package:ensayo/domain/metrics/i_metrics_facade.dart';
import 'package:ensayo/domain/session/i_session_facade.dart';
import 'package:ensayo/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' show Environment;

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await configureDependencies(environment: Environment.test);
  });

  tearDown(() => GetIt.instance.reset());

  test('the session and metrics facades resolve in the test environment', () {
    expect(GetIt.instance<ISessionFacade>(), isA<ISessionFacade>());
    expect(GetIt.instance<IMetricsFacade>(), isA<IMetricsFacade>());
  });
}
