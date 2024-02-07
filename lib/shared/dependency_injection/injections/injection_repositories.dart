// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206195006
// 06/02/2024 19:50
import 'package:adhd_prototype/shared/isar_db/isar_db.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/current_day_task_repository.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/notebook_repository.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/user_repository.dart';

import '../injections.dart';
import 'injection_configuration.dart';

/// The [InjectionRepositories] class is responsible for configuring dependency injections
/// related to repository classes using the GetIt service locator.
class InjectionRepositories extends InjectionConfiguration {

  /// Configures dependency injections for repository classes using GetIt.
  @override
  // ignore: long-method
  void configureGetItInjections() {
    getIt.registerFactory<UserRepository>(
          () => UserRepository(
        isarDB: getIt.get<IsarDB>(),
      ),
    );
    getIt.registerFactory<NotebookRepository>(
          () => NotebookRepository(
        isarDB: getIt.get<IsarDB>(),
      ),
    );
    getIt.registerFactory<CurrentDayTaskRepository>(
          () => CurrentDayTaskRepository(
        isarDB: getIt.get<IsarDB>(),
      ),
    );
  }
}
