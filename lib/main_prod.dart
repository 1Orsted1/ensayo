import 'package:ensayo/app.dart';
import 'package:ensayo/bootstrap.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  await bootstrap(Environment.prod, () {
    LocaleSettings.useDeviceLocale();
    return TranslationProvider(child: const App());
  });
}
