// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202135653
// 02/02/2024 13:56
/// The [DashboardEvent] class is an abstract base class for defining
/// events related to the dashboard feature in your application.
abstract class DashboardEvent {}

/// The [DashboardInitialize] class is a specific event that represents the
/// initialization of the dashboard. When this event is dispatched, it triggers
/// the initialization logic in the [DashboardBloc] to set up the initial state
/// of the dashboard.
class DashboardInitialize extends DashboardEvent {}
