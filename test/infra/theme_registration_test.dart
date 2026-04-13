import 'package:ensayo/domain/theme/i_personalized_theme.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' show Environment;

void main() {
  setUp(() async {
    await configureDependencies(environment: Environment.test);
  });

  tearDown(() => GetIt.instance.reset());

  test('every SelectedTheme value has a registered theme in GetIt', () {
    for (final theme in SelectedTheme.values) {
      print("Theme ${theme.value}");
      expect(
        () => GetIt.instance<IPersonalizedTheme>(instanceName: theme.value),
        returnsNormally,
        reason: '${theme.value} is not registered in GetIt',
      );
    }
  });
}
