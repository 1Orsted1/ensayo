import 'package:ensayo/domain/plan/i_plan_facade.dart';
import 'package:mockito/annotations.dart';

export 'plan_mocks.mocks.dart';

/// Only here to carry the annotation; never called.
@GenerateNiceMocks([MockSpec<IPlanFacade>()])
void planMocks() {}
