import 'package:adhd_prototype/adhd_prototype.dart';
import 'package:adhd_prototype/shared/dependency_injection/injections/injection_repositories.dart';
import 'package:adhd_prototype/shared/dependency_injection/injections/injection_services.dart';
import 'package:adhd_prototype/shared/dependency_injection/injections/injection_singletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'bootstrap.dart';
import 'shared/dependency_injection/injections.dart';
import 'shared/dependency_injection/injections/injection_cubits.dart';
/// The main entry point of the application.
Future<void> main() async {
  // Ensure that widgets binding is initialized.
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Preserve FlutterNativeSplash.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Configure GetIt for dependency injection.
  _configureGetIt();
  // Execute the bootstrap process.
  await getIt.get<Bootstrap>().execute();
  // Run the application.
  runApp(const AdhdPrototype());
  // Remove FlutterNativeSplash.
  FlutterNativeSplash.remove();
}

/// Configures dependency injection using GetIt.
void _configureGetIt() {
  // Configure GetIt injections using predefined configurations.
  configureGetItInjections(
    injectionConfigurations: [
      InjectionSingletons(),
      InjectionRepositories(),
      InjectionServices(),
      InjectionCubits(),
    ],
  );
}
