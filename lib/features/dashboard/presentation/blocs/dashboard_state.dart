// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202135254
// 02/02/2024 13:52
import 'package:equatable/equatable.dart';

import '../../../../shared/isar_db/models/notebook.dart';
import '../../../../shared/state_management/states.dart';
import '../../models/dashboard_filter_details.dart';
import '../../models/dashboard_notebook_details.dart';
import '../../models/dashboard_today_tasks_details.dart';

/// The [DashboardStateData] class represents the data that makes up the
/// state of the dashboard feature in your application. It extends [Equatable]
/// to enable easy comparison and equality checks.
class DashboardStateData extends Equatable {
  /// Constructs a [DashboardStateData] object with the specified properties.
  const DashboardStateData({
    required this.userName,
    required this.notebookDetails,
    required this.todayTasksDetails,
    required this.filterDetails,
    required this.notebooks,
  });

  /// The username associated with the dashboard.
  final String userName;

  /// A list of dashboard notebook details.
  final List<DashboardNotebookDetails> notebookDetails;

  /// A list of today's tasks details on the dashboard.
  final List<DashboardTodayTasksDetails> todayTasksDetails;

  /// A list of dashboard filter details.
  final List<DashboardFilterDetails> filterDetails;

  final List<Notebook> notebooks;

  @override
  List<Object?> get props => [
        userName,
        notebookDetails,
        todayTasksDetails,
        filterDetails,
        notebooks,
      ];
}

/// The [DashboardState] type represents the state of the dashboard feature
/// in your application. It is defined as a type alias for [StateTemplate]
/// with [DashboardStateData] as the generic type.
typedef DashboardState = StateTemplate<DashboardStateData>;
