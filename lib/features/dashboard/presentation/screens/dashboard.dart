// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202135409
// 02/02/2024 13:54
import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/dependency_injection/injections.dart';
import '../../../../shared/ui/mixins/content_builder_mixin.dart';
import '../../../../shared/ui/screen_template.dart';
import '../../../../shared/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';
import '../blocs/dashboard_bloc.dart';
import '../blocs/dashboard_state.dart';
import '../widgets/dashboard_build_content.dart';

/// The [Dashboard] widget is responsible for displaying the dashboard
/// feature in your application. It initializes the [DashboardBloc] and
/// triggers the [DashboardInitialize] event to set up the dashboard's initial state.
class Dashboard extends StatelessWidget {
  const Dashboard({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) =>
      getIt.get<DashboardBloc>()..add(DashboardInitialize()),
      child: const _DashboardContent(),
    );
  }
}

/// The [_DashboardContent] widget is the main content of the dashboard feature.
/// It listens to the [DashboardBloc] for changes in the dashboard's state and
/// builds the UI accordingly.
class _DashboardContent extends StatelessWidget
    with ContentBuilderMixin<DashboardStateData> {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DashboardBloc>().state;

    return ScreenTemplate(
      appBarTemplate: const AppBarTemplate(isDashboard: true),
      child: buildContent(
        state: state,
        contentBuilder: DashboardBuildContentBuilder(),
      ),
    );
  }
}
