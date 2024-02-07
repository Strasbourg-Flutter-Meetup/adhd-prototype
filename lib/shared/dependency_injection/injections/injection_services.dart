// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206191147
// 06/02/2024 19:11

import 'package:adhd_prototype/bootstrap.dart';
import 'package:adhd_prototype/shared/isar_db/isar_db.dart';

import '../injections.dart';
import 'injection_configuration.dart';

/// The [InjectionServices] class is responsible for configuring dependency injections
/// related to service classes using the GetIt service locator.
class InjectionServices extends InjectionConfiguration {

  /// Configures dependency injections for service classes using GetIt.
  @override
  // ignore: long-method
  void configureGetItInjections() {
    getIt.registerFactory<Bootstrap>(
          () => BootstrapImpl(isarDB: getIt.get<IsarDB>()),
    );
  }
}
