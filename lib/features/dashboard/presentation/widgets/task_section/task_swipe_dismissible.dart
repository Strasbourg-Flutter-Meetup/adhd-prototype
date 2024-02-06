// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206101853
// 06/02/2024 10:18

import 'dart:io';

import 'package:adhd_prototype/features/dashboard/presentation/widgets/task_section/task_dismissible_alert_dialog.dart';
import 'package:adhd_prototype/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'task_slidable_action.dart';

/// The [TaskSwipeDismissible] widget is responsible for displaying a task item
/// within a Slidable container that supports swipe actions such as deletion,
/// marking as done, and moving back to backlog. It provides a customizable tooltip
/// message for each action and shows a confirmation dialog before dismissing the item.
class TaskSwipeDismissible extends StatelessWidget {
  /// The task item to be displayed.
  final String item;

  /// Constructs a [TaskSwipeDismissible] widget with the specified properties.
  const TaskSwipeDismissible({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            _showSuccessMessage(context);
          },
          closeOnCancel: true,
          confirmDismiss: () async {
            return await _callTaskDismissibleAlertDialog(context);
          },
        ),
        // All actions are defined in the children parameter.
        children: [
          TaskSlidableAction(
            toolTipMessage: context.appLocalizations
                    ?.dashboardTaskSlidableToolTipBackToBacklog ??
                'Back to backlog',
            backgroundColor: Colors.lightBlue,
            onPressed: (context) {},
            child: Platform.isIOS
                ? const Icon(Icons.arrow_back_ios_new)
                : const Icon(Icons.arrow_back),
          ),
          TaskSlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.lightGreen,
            toolTipMessage: context
                    .appLocalizations?.dashboardTaskSlidableToolTipMarkAsDone ??
                'Complete task',
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 6,
              child: const Icon(Icons.done),
            ),
          ),
          TaskSlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.redAccent,
            toolTipMessage:
                context.appLocalizations?.dashboardTaskSlidableToolTipDelete ??
                    'Delete task',
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 6,
              child: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ListTile(title: Text(item)),
    );
  }

  /// Displays a confirmation dialog before dismissing the item.
  Future<bool> _callTaskDismissibleAlertDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return const TaskDismissibleAlertDialog();
      },
    );
    return result ?? false;
  }

  /// Displays a success message when a task is deleted.
  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(context.appLocalizations?.dashboardDeleteTaskSuccess ??
              'Task deleted successfully'),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
