// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011195042
// 11.10.2023 19:50

import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_bloc.dart';

import '../../../features/dashboard/presentation/blocs/dashboard_state.dart';
import '../../isar_db/repositories/current_day_task_repository.dart';
import '../../isar_db/repositories/notebook_repository.dart';
import '../../isar_db/repositories/user_repository.dart';
import '../injections.dart';
import 'injection_configuration.dart';

/// The [InjectionCubits] class is responsible for configuring dependency injections
/// related to Cubit classes using the GetIt service locator.
class InjectionCubits extends InjectionConfiguration {

  /// Configures dependency injections for Cubit classes using GetIt.
  @override
  // ignore: long-method
  void configureGetItInjections() {
    getIt.registerFactory<DashboardBloc>(
          () => DashboardBloc(
        const DashboardState.initial(),
        userRepository: getIt.get<UserRepository>(),
        notebookRepository: getIt.get<NotebookRepository>(),
        currentDayTaskRepository: getIt.get<CurrentDayTaskRepository>(),
      ),
    );
  }
}

