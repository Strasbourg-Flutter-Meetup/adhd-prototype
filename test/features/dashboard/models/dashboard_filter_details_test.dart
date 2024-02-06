// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206131904
// 06/02/2024 13:19
import 'package:adhd_prototype/features/dashboard/models/dashboard_filter_details.dart';
import 'package:bdd_framework/bdd_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var feature = BddFeature('Dashboard Filter Details Management');

  Bdd(feature)
      .scenario('Creating a valid DashboardFilterDetails instance.')
      .given('I have a notebook ID "nb123" and a notebook name "Physics"')
      .when(
          'I create a DashboardFilterDetails instance with the given ID and name')
      .then(
          'the instance should have the notebook ID "nb123" and the notebook name "Physics"')
      .and('the instance should not be null')
      .run((ctx) async {
    // Initialize the necessary variables
    String notebookId;
    String notebookName;
    DashboardFilterDetails? dashboardFilterDetails;

    // Given: I have a notebook ID "nb123" and a notebook name "Physics"
    notebookId = 'nb123';
    notebookName = 'Physics';

    // When: I create a DashboardFilterDetails instance with the given ID and name
    dashboardFilterDetails = DashboardFilterDetails(
      notebookId: notebookId,
      notebookName: notebookName,
    );

    // Then: the instance should have the notebook ID "nb123" and the notebook name "Physics"
    expect(dashboardFilterDetails.notebookId, notebookId,
        reason: 'The notebook ID does not match the expected value.');
    expect(dashboardFilterDetails.notebookName, notebookName,
        reason: 'The notebook name does not match the expected value.');

    // And: the instance should not be null
    expect(dashboardFilterDetails, isNotNull,
        reason: 'The DashboardFilterDetails instance is null.');
  });
}
