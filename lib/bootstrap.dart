import 'dart:async';
import 'dart:developer' as dev;

import 'package:ensayo/injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

Future<void> bootstrap(
  String environment,
  FutureOr<Widget> Function() builder,
) async {
  //? out of the docs
  Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });

  FlutterError.onError = (details) {
    dev.log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );

    await configureDependencies(environment: environment);

    runApp(await builder());
  }, (error, stackTrace) => dev.log(error.toString(), stackTrace: stackTrace));
}
