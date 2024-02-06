// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206104344
// 06/02/2024 10:43
import 'package:adhd_prototype/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

/// The [TaskDismissibleAlertDialog] widget is a reusable custom alert dialog
/// designed for displaying a confirmation dialog before deleting a task item.
class TaskDismissibleAlertDialog extends StatelessWidget {
  /// Constructs a [TaskDismissibleAlertDialog] widget.
  const TaskDismissibleAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          context.appLocalizations?.dashboardDeleteTaskConfirmDialogTitle ??
              'Confirm'),
      content: Text(
          context.appLocalizations?.dashboardDeleteTaskConfirmDialogContent ??
              'Are you sure you want to delete this task?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(context
                  .appLocalizations?.dashboardDeleteTaskConfirmDialogCancel ??
              'Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(context
                  .appLocalizations?.dashboardDeleteTaskConfirmDialogDelete ??
              'Delete'),
        ),
      ],
    );
  }
}
