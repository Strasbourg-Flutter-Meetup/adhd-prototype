// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202110542
// 02/02/2024 11:05

import 'package:adhd_prototype/shared/routing/go_router_config.dart';
import 'package:flutter/widgets.dart';

/// The [goRouterContext] getter retrieves the current [BuildContext] associated
/// with the application's router navigator, accessed through the [navigatorKey]
/// of the [goRouterConfiguration.routerDelegate]. This getter provides access to
/// the context within the routing system, which can be useful for triggering
/// navigation or performing other actions related to routing.
///
/// Returns the current [BuildContext] associated with the router navigator,
/// or `null` if it's unavailable.
BuildContext? get goRouterContext =>
    goRouterConfiguration.routerDelegate.navigatorKey.currentContext;
