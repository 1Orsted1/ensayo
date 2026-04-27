import 'package:ensayo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies({String? environment}) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getIt.init(environment: environment);
}
