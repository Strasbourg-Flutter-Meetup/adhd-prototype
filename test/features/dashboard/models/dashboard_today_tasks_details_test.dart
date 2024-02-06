// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206132350
// 06/02/2024 13:23
import 'package:adhd_prototype/features/dashboard/models/dashboard_today_tasks_details.dart';
import 'package:bdd_framework/bdd_framework.dart';
import 'package:flutter_test/flutter_test.dart'; // Import the flutter_test for expect function

void main() {
  var feature = BddFeature('Dashboard Today Tasks Details Management');

  Bdd(feature)
      .scenario('Creating a valid DashboardTodayTasksDetails instance.')
      .given(
          'I have a task ID "task123", a task description "Finish report", and a notebook ID "nb123"')
      .when(
          'I create a DashboardTodayTasksDetails instance with the given details')
      .then(
          'the instance should have the task ID "task123", the task description "Finish report", and the notebook ID "nb123"')
      .and('the instance should not be null')
      .run((ctx) async {
    // Initialize the necessary variables
    String taskId;
    String taskDescription;
    String notebookId;
    DashboardTodayTasksDetails? dashboardTodayTasksDetails;

    // Given: I have a task ID "task123", a task description "Finish report", and a notebook ID "nb123"
    taskId = 'task123';
    taskDescription = 'Finish report';
    notebookId = 'nb123';

    // When: I create a DashboardTodayTasksDetails instance with the given details
    dashboardTodayTasksDetails = DashboardTodayTasksDetails(
      taskId: taskId,
      task: taskDescription,
      notebookId: notebookId,
    );

    // Then: the instance should have the task ID "task123", the task description "Finish report", and the notebook ID "nb123"
    expect(dashboardTodayTasksDetails.taskId, taskId,
        reason: 'The task ID does not match the expected value.');
    expect(dashboardTodayTasksDetails.task, taskDescription,
        reason: 'The task description does not match the expected value.');
    expect(dashboardTodayTasksDetails.notebookId, notebookId,
        reason: 'The notebook ID does not match the expected value.');

    // And: the instance should not be null
    expect(dashboardTodayTasksDetails, isNotNull,
        reason: 'The DashboardTodayTasksDetails instance is null.');
  });
}
