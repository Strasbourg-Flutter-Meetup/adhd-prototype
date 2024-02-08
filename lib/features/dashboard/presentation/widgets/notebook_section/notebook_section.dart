// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206083111
// 06/02/2024 08:31

import 'package:adhd_prototype/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:adhd_prototype/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/isar_db/models/notebook.dart';
import '../../../../../shared/ui/widgets/custom_modal_bottom_sheet.dart';
import '../../screens/add_notebook_modal.dart';

/// The [NotebookSection] widget is responsible for displaying a section
/// within the dashboard related to notebooks. It shows a title and an
/// "Add" button for managing notebooks.
class NotebookSection extends StatelessWidget {
  /// Constructs a [NotebookSection] widget.
  const NotebookSection({super.key, required this.notebooks});

  final List<Notebook> notebooks;

  @override
  Widget build(BuildContext context) => DashboardSection(
        iconButtons: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => CustomModalBottomSheet(
                  child: AddNotebookModal(
                    notebooks: notebooks,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
        text: context.appLocalizations?.dashboardNotebookTitle ?? 'NOTEBOOKS',
      );
}
