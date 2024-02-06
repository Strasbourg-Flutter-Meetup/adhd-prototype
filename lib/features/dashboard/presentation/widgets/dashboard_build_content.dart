import 'package:flutter/material.dart';

import '../../../../shared/ui/content_builder.dart';
import '../blocs/dashboard_state.dart';
import 'dashboard_greeting.dart';
import 'notebook_section/notebook_list.dart';
import 'notebook_section/notebook_section.dart';
import 'task_section/task_section.dart';
import 'task_section/task_swipe_dismissible.dart';

/// A content builder for the dashboard screen.
///
/// The [DashboardBuildContentBuilder] class is responsible for building the
/// content for the dashboard screen based on the provided [DashboardStateData].
/// It overrides the [build] method to create a [DashboardBuildContent] widget
/// with the given data.
class DashboardBuildContentBuilder extends ContentBuilder<DashboardStateData> {
  /// Builds the dashboard content based on the provided [data].
  ///
  /// The [data] parameter contains the necessary data for constructing the
  /// dashboard content. This method returns a [DashboardBuildContent] widget
  /// configured with the provided data.
  @override
  Widget build({required data}) => DashboardBuildContent(
        data: data,
      );
}

class DashboardBuildContent extends StatelessWidget {
  const DashboardBuildContent({
    super.key,
    required this.data,
  });

  final DashboardStateData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 48.0),
        DashboardGreeting(userName: data.userName),
        const SizedBox(height: 48.0),
        const NotebookSection(),
        const SizedBox(height: 12.0),
        NotebookList(
          notebookDetails: data.notebookDetails,
        ),
        const SizedBox(height: 48.0),
        const TasksSection(),
        ...List.generate(
          data.todayTasksDetails.length,
          (index) =>
              TaskSwipeDismissible(item: data.todayTasksDetails[index].task),
        ),
      ],
    );
  }
}
