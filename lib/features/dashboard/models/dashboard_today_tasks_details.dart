// Project: ivy_lee
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231124114316
// 24.11.2023 11:43
/// The [DashboardTodayTasksDetails] class represents details about tasks
/// scheduled for today on the dashboard. It provides information such as
/// the task's ID, description, and the notebook it belongs to.
class DashboardTodayTasksDetails {
  /// Constructs a [DashboardTodayTasksDetails] object with the specified properties.
  const DashboardTodayTasksDetails({
    required this.taskId,
    required this.task,
    required this.notebookId,
  });

  /// The unique identifier of the task.
  final String taskId;

  /// The description or name of the task.
  final String task;

  /// The identifier of the notebook to which the task belongs.
  final String notebookId;
}

