// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206083227
// 06/02/2024 08:32

import 'package:flutter/material.dart';

import 'notebook_card_header.dart';
import 'notebook_card_progress.dart';


/// The [NotebookCard] widget is responsible for displaying a card
/// representing a notebook in the dashboard. It shows details such as the
/// notebook name, progress, and the number of open tasks.
class NotebookCard extends StatelessWidget {
  /// Constructs a [NotebookCard] widget with the specified properties.
  const NotebookCard({super.key,
    required this.notebookName,
    required this.progress,
    required this.openTasks,
  });

  /// The name of the notebook.
  final String notebookName;

  /// The progress of tasks within the notebook (e.g., completion percentage).
  final double progress;

  /// The number of open tasks within the notebook.
  final int openTasks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
        child: Card(
          child: ListTile(
            onTap: () {},
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12.0),
                NotebookCardHeader(openTasks: openTasks),
                const SizedBox(height: 24.0),
                Tooltip(
                  height: 40.0,
                  message: notebookName,
                  child: Text(
                    notebookName,
                    style: const TextStyle(fontSize: 20.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 12.0),
                NotebookCardProgress(progress: progress),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
