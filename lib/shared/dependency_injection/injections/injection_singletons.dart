// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206191254
// 06/02/2024 19:12

import 'package:adhd_prototype/shared/isar_db/isar_db.dart';

import '../injections.dart';
import 'injection_configuration.dart';

/// The [InjectionSingletons] class is responsible for configuring singleton
/// dependency injections using the GetIt service locator.
class InjectionSingletons extends InjectionConfiguration {

  /// Configures singleton dependency injections using GetIt.
  @override
  // ignore: long-method
  void configureGetItInjections() {
    getIt.registerSingleton(IsarDB.instance);
  }
}
