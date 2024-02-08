// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206083146
// 06/02/2024 08:31
import 'package:flutter/material.dart';

import '../../../models/dashboard_notebook_details.dart';
import 'notebook_card.dart';

/// The [NotebookList] widget is responsible for displaying a list of notebook cards
/// horizontally within a constrained height. It takes a list of [DashboardNotebookDetails]
/// and creates [NotebookCard] widgets for each notebook.
class NotebookList extends StatelessWidget {
  /// Constructs a [NotebookList] widget with the specified properties.
  const NotebookList({super.key,
    required this.notebookDetails,
  });

  /// A list of [DashboardNotebookDetails] representing the notebooks to display.
  final List<DashboardNotebookDetails> notebookDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        itemBuilder: (context, index) => NotebookCard(
          notebookName: notebookDetails[index].notebookName,
          progress: notebookDetails[index].progress,
          openTasks: notebookDetails[index].openTasks,
          notebookId: notebookDetails[index].notebookId,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: notebookDetails.length,
      ),
    );
  }
}
