// Dart imports:
import 'dart:async';
import 'dart:isolate';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/di/locator.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, String env) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupDI(env);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      await FirebaseCrashlytics.instance.recordError(
        pair.first,
        pair.last,
        fatal: true,
      );
    }).sendPort);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(await builder());
  },
      (error, stackTrace) =>
          FirebaseCrashlytics.instance.recordError(error, stackTrace));
}
