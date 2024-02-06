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
import '../injections.dart';
import 'injection_configuration.dart';

/// This class is responsible for configuring the dependency injections for various Cubits in the Medical Device Classifier project.
///
/// It extends the [InjectionConfiguration] class.
class InjectionCubits extends InjectionConfiguration {
  @override
  // ignore: long-method
  void configureGetItInjections() {
    getIt.registerFactory<DashboardBloc>(
      () => DashboardBloc(
        const DashboardState.initial(),
      ),
    );
  }
}
