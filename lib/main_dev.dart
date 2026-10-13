import 'package:device_preview/device_preview.dart';
import 'package:ensayo/app.dart';
import 'package:ensayo/bootstrap.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  await bootstrap(Environment.dev, () {
    LocaleSettings.useDeviceLocale();
    return TranslationProvider(
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => App(), // Wrap your app
      ),
    );
  });
}
