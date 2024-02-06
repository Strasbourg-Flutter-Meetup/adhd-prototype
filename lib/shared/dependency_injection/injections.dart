// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202132359
// 02/02/2024 13:23
import 'package:get_it/get_it.dart';

import 'injections/injection_configuration.dart';

/// Global instance of GetIt for managing dependency injections.
final GetIt getIt = GetIt.instance;

/// Configures the dependency injections by calling the `configureGetItInjections()` method of each [InjectionConfiguration] instance.
/// It takes a list of [InjectionConfiguration] instances as a parameter.
void configureGetItInjections({
  required List<InjectionConfiguration> injectionConfigurations,
}) {
  // Iterate through each [InjectionConfiguration] instance and call the `configureGetItInjections()` method.
  for (final injectionConfiguration in injectionConfigurations) {
    injectionConfiguration.configureGetItInjections();
  }
}
