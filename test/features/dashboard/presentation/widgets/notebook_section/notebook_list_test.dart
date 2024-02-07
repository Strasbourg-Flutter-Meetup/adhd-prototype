// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206131009
// 06/02/2024 13:10
import 'package:adhd_prototype/features/dashboard/models/dashboard_notebook_details.dart';
import 'package:adhd_prototype/features/dashboard/presentation/widgets/notebook_section/notebook_card.dart';
import 'package:adhd_prototype/features/dashboard/presentation/widgets/notebook_section/notebook_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NotebookList widget displays notebook cards correctly',
      (WidgetTester tester) async {
    // Arrange
    final List<DashboardNotebookDetails> notebookDetailsList = [
      const DashboardNotebookDetails(
        notebookId: 'notebookId1',
        notebookName: 'Private',
        progress: 0.8,
        openTasks: 1, rank: 'AAAA',
      ),
      const DashboardNotebookDetails(
        notebookId: 'notebookId2',
        notebookName: 'Job',
        progress: 0.3,
        openTasks: 5, rank: 'BBBB',
      ),
    ];

    // Build the NotebookList widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
              height: 200,
              child: NotebookList(notebookDetails: notebookDetailsList)),
        ),
      ),
    );

    // Act

    // Assert
    final notebookCardWidgets = find.byType(NotebookCard);
    expect(notebookCardWidgets, findsNWidgets(notebookDetailsList.length));
    // Check if the correct number of NotebookCard widgets are displayed

    for (var i = 0; i < notebookDetailsList.length; i++) {
      final notebookCard = tester.widget<NotebookCard>(
        find.byWidgetPredicate((widget) =>
            widget is NotebookCard &&
            widget.notebookName == notebookDetailsList[i].notebookName &&
            widget.progress == notebookDetailsList[i].progress &&
            widget.openTasks == notebookDetailsList[i].openTasks),
      );
      expect(notebookCard, isNotNull);
      // Check if each NotebookCard widget has the correct properties
    }
  });
}
