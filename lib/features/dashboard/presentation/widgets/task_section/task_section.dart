// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206101822
// 06/02/2024 10:18
import 'package:adhd_prototype/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:adhd_prototype/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

/// The [TasksSection] widget is responsible for displaying a section within
/// the dashboard related to tasks. It shows a title and icons for reordering
/// and filtering tasks.
class TasksSection extends StatelessWidget {
  /// Constructs a [TasksSection] widget.
  const TasksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) => DashboardSection(
        iconButtons: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.reorder),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_outlined),
          ),
        ],
        text: context.appLocalizations?.dashboardTodayTasksTitle ??
            'TODAY\'S TASKS',
      );
}
