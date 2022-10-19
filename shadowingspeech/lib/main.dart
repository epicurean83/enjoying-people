import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shadowingspeech/app/app.dart';
import 'package:shadowingspeech/app/di/locator.dart';

final logger = Logger("Main");

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await initializeApplication();
      runApp(const App());
      Future.microtask(() => FlutterNativeSplash.remove());
    },
    (error, stack) => logger.severe(
      error.toString(),
      error,
      stack,
    ),
  );
}

Future<void> initializeApplication() async {
  setupLogging();
  await setupLocator();
  await requestPermission();
}

Future<void> requestPermission() async {
  await Permission.notification.request();
  await Permission.microphone.request();
  await Permission.speech.request();
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
      if (rec.error != null) {
        debugPrint(rec.error.toString());
      }
      if (rec.stackTrace != null) {
        debugPrintStack(stackTrace: rec.stackTrace);
      }
    }
  });
}
