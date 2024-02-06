// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206083326
// 06/02/2024 08:33
import 'package:flutter/material.dart';

/// The [NotebookCardProgress] widget is responsible for displaying a progress
/// indicator within a notebook card. It visualizes the progress of tasks
/// within the notebook.
class NotebookCardProgress extends StatelessWidget {
  /// Constructs a [NotebookCardProgress] widget with the specified properties.
  const NotebookCardProgress({super.key,
    required this.progress,
  });

  /// The progress of tasks within the notebook (e.g., completion percentage).
  final double progress;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
