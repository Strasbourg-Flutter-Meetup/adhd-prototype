// Project: ivy_lee
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231124113754
// 24.11.2023 11:37
/// The [DashboardNotebookDetails] class represents details about a notebook
/// on the dashboard. It provides information such as the notebook's ID,
/// name, progress, and the number of open tasks within the notebook.
class DashboardNotebookDetails {
  /// Constructs a [DashboardNotebookDetails] object with the specified properties.
  const DashboardNotebookDetails({
    required this.notebookId,
    required this.notebookName,
    required this.progress,
    required this.openTasks,
  });

  /// The unique identifier of the notebook.
  final String notebookId;

  /// The name of the notebook.
  final String notebookName;

  /// The progress of tasks within the notebook (e.g., completion percentage).
  /// It is a value between 0.0 and 1.0.
  final double progress;

  /// The number of open tasks within the notebook.
  final int openTasks;
}
