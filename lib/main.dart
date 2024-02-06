import 'package:adhd_prototype/adhd_prototype.dart';
import 'package:flutter/material.dart';

import 'shared/dependency_injection/injections.dart';
import 'shared/dependency_injection/injections/injection_cubits.dart';

void main() {
  _configureGetIt();
  runApp(const AdhdPrototype());
}

void _configureGetIt() {
  // Configure GetIt injections using predefined configurations.
  configureGetItInjections(
    injectionConfigurations: [
      InjectionCubits(),
    ],
  );
}
