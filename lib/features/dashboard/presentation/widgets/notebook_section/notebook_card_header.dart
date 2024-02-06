// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206083255
// 06/02/2024 08:32
import 'package:adhd_prototype/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

/// The [NotebookCardHeader] widget is responsible for displaying a header
/// section in a notebook card. It shows the number of open tasks within the notebook.
class NotebookCardHeader extends StatelessWidget {
  /// Constructs a [NotebookCardHeader] widget with the specified properties.
  const NotebookCardHeader({super.key,
    required this.openTasks,
  });

  /// The number of open tasks within the notebook.
  final int openTasks;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Icon(Icons.today_rounded, size: 20.0),
        const SizedBox(width: 6.0),
        Text(
          '$openTasks ${openTasks == 1 ? context.appLocalizations?.notebookCardHeaderTaskSingular : context.appLocalizations?.notebookCardHeaderTaskPlural} ${context.appLocalizations?.notebookCardHeaderOpen}',
          style: const TextStyle(
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
