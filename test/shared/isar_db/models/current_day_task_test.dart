// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207120013
// 07/02/2024 12:00
import 'package:adhd_prototype/shared/isar_db/models/current_day_task.dart';
import 'package:bdd_framework/bdd_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  var feature = BddFeature('Current Day Task Management');

  Bdd(feature)
      .scenario('Creating and updating a CurrentDayTask')
      .given('I have a task with a specific ID and rank')
      .when('I create a CurrentDayTask instance')
      .then('the CurrentDayTask should have the specified ID and rank')
      .and('it should comply with the RankableItem interface')
      .run((ctx) async {

    // Given
    int taskId = 1;
    String rank = 'A';

    // When
    CurrentDayTask task = CurrentDayTask()
      ..taskId = taskId
      ..rank = rank;

    // Then
    expect(task.taskId, equals(taskId),
        reason: 'Task ID should match the specified ID');
    expect(task.rank, equals(rank),
        reason: 'Task rank should match the specified rank');

    // And
    expect(task.rank, isNotNull,
        reason: 'RankableItem should have a non-null rank');
  });
}
