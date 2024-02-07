// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207121952
// 07/02/2024 12:19
import 'package:adhd_prototype/shared/isar_db/models/task.dart';
import 'package:bdd_framework/bdd_framework.dart'; // Hypothetical; adjust to your BDD framework's import
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  var feature = BddFeature('Task Entity Management');

  Bdd(feature)
      .scenario('Creating and updating a Task entity')
      .given(
          'I have a task description "Complete BDD test", a notebookId 1, and a rank "High"')
      .when(
          'I create a Task instance with the given description, notebookId, and rank')
      .then(
          'the Task should have the specified description "Complete BDD test"')
      .and('the Task should belong to the notebook with ID 1')
      .and('the Task should have the specified rank "AAAA"')
      .and('it should comply with the RankableItem interface requirements')
      .run((ctx) async {
    // Given
    String description = "Complete BDD test";
    int notebookId = 1;
    String rank = "AAAA";

    // When
    Task task = Task()
      ..task = description
      ..notebookId = notebookId
      ..rank = rank;

    // Then
    expect(task.task, equals(description),
        reason: 'Task description should match the specified description');
    expect(task.notebookId, equals(notebookId),
        reason: 'Task should belong to the specified notebookId');
    expect(task.rank, equals(rank),
        reason: 'Task rank should match the specified rank');
    expect(task.rank, isNotNull,
        reason:
            'Task should comply with the RankableItem interface by having a non-null rank');
  });
}
