// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202122853
// 02/02/2024 12:28

import 'package:flutter/material.dart';

import 'widgets/app_bar/presentation/widget/app_bar_template.dart';

/// The `ScreenTemplate` widget is a Flutter `StatelessWidget` that serves as
/// a common template for creating screens or pages throughout the application.
/// It provides a consistent layout structure including an `AppBarTemplate` at
/// the top, a scrollable content area in the middle, and an optional web footer
/// at the bottom for web-based views.
class ScreenTemplate extends StatelessWidget {
  /// Constructor for the `ScreenTemplate` widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for
  /// this widget.
  ///
  /// [child] is a required parameter that specifies the main content widget
  /// to be displayed within the screen. This widget will be placed inside a
  /// scrollable container.
  ///
  /// [appBarTemplate] is a required parameter that represents the custom
  /// `AppBarTemplate` widget to be displayed at the top of the screen.
  const ScreenTemplate({
    super.key,
    required this.child,
    required this.appBarTemplate,
    this.navigationBar,
    this.floatingActionButton,
  });

  /// The main content widget to be displayed within the screen.
  final Widget child;

  /// The custom `AppBarTemplate` widget to be displayed at the top of the screen.
  final AppBarTemplate appBarTemplate;

  final NavigationBar? navigationBar;

  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // The custom `AppBarTemplate` widget at the top of the screen.
        appBar: appBarTemplate,
        body: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                child,
              ],
            ),
          ),
        ),
        bottomNavigationBar: navigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
