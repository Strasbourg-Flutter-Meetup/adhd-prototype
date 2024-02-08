// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202100210
// 02/02/2024 10:02
import 'package:adhd_prototype/features/notebook/presentation/screens/notebook.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/screens/dashboard.dart';
import '../ui/screen_template.dart';
import '../ui/widgets/app_bar/presentation/widget/app_bar_template.dart';
import '../ui/widgets/error_building_content.dart';
import 'go_router_path.dart';

/// The configuration for the application's routing system.
///
/// The [goRouterConfiguration] specifies the initial location, error handling,
/// and available routes for the application's routing system using the
/// [GoRouter] package.
final goRouterConfiguration = GoRouter(
  initialLocation: pathToDashboard,
  errorBuilder: (context, goRouterState) {
    return const ScreenTemplate(
      appBarTemplate: AppBarTemplate(),
      child: ErrorBuildingContent(),
    );
  },
  routes: [
    _toDashboard,
  ],
);

final _toDashboard = GoRoute(
  path: pathToDashboard,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const Dashboard(),
  ),
  routes: [
    _toNotebook,
  ],
);

final _toNotebook = GoRoute(
  path: pathToNotebook,
  name: pathToNotebook,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const Notebook(),
  ),
);
