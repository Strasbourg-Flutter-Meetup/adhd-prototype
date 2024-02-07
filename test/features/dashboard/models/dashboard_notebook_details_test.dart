// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206132111
// 06/02/2024 13:21
import 'package:adhd_prototype/features/dashboard/models/dashboard_notebook_details.dart';
import 'package:bdd_framework/bdd_framework.dart';
import 'package:flutter_test/flutter_test.dart'; // Import the flutter_test for expect function

void main() {
  var feature = BddFeature('Dashboard Notebook Details Management');

  Bdd(feature)
      .scenario('Creating a valid DashboardNotebookDetails instance.')
      .given(
          'I have a notebook ID "nb123", a notebook name "Physics", progress at 75.0, and 5 open tasks')
      .when(
          'I create a DashboardNotebookDetails instance with the given details')
      .then(
          'the instance should have the notebook ID "nb123", the notebook name "Physics", progress at 75.0, and 5 open tasks')
      .and('the instance should not be null')
      .run((ctx) async {
    // Initialize the necessary variables
    String notebookId;
    String notebookName;
    double progress;
    int openTasks;
    DashboardNotebookDetails? dashboardNotebookDetails;

    // Given: I have a notebook ID "nb123", a notebook name "Physics", progress at 75.0, and 5 open tasks
    notebookId = 'nb123';
    notebookName = 'Physics';
    progress = 0.7;
    openTasks = 5;

    // When: I create a DashboardNotebookDetails instance with the given details
    dashboardNotebookDetails = DashboardNotebookDetails(
      notebookId: notebookId,
      notebookName: notebookName,
      progress: progress,
      openTasks: openTasks, rank: 'AAAA',
    );

    // Then: the instance should have the notebook ID "nb123", the notebook name "Physics", progress at 75.0, and 5 open tasks
    expect(dashboardNotebookDetails.notebookId, notebookId,
        reason: 'The notebook ID does not match the expected value.');
    expect(dashboardNotebookDetails.notebookName, notebookName,
        reason: 'The notebook name does not match the expected value.');
    expect(dashboardNotebookDetails.progress, progress,
        reason: 'The progress does not match the expected value.');
    expect(dashboardNotebookDetails.openTasks, openTasks,
        reason: 'The number of open tasks does not match the expected value.');

    // And: the instance should not be null
    expect(dashboardNotebookDetails, isNotNull,
        reason: 'The DashboardNotebookDetails instance is null.');
  });
}
