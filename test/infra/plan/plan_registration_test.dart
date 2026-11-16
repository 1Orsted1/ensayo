import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/i_plan_facade.dart';
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

  test('the plan facade and a fresh plan bloc resolve in the test '
      'environment', () async {
    expect(GetIt.instance<IPlanFacade>(), isA<IPlanFacade>());

    final first = GetIt.instance<PlanBloc>();
    final second = GetIt.instance<PlanBloc>();
    addTearDown(first.close);
    addTearDown(second.close);
    // D10: a factory, so a recreated provider never gets a closed instance.
    expect(identical(first, second), isFalse);
  });
}
