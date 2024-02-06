// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206110427
// 06/02/2024 11:04
import 'package:adhd_prototype/features/dashboard/models/dashboard_today_tasks_details.dart';
import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_state.dart';
import 'package:adhd_prototype/features/dashboard/presentation/widgets/dashboard_build_content.dart';
import 'package:adhd_prototype/features/dashboard/presentation/widgets/notebook_section/notebook_list.dart';
import 'package:adhd_prototype/features/dashboard/presentation/widgets/task_section/task_swipe_dismissible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dashboard_build_content_test.mocks.dart';

@GenerateMocks([DashboardStateData])
void main() {
  group('DashboardBuildContentBuilder', () {
    test('build method returns DashboardBuildContent with valid data', () {
      // Arrange
      final mockData = MockDashboardStateData();
      final builder = DashboardBuildContentBuilder();

      // Act
      final content = builder.build(data: mockData);

      // Assert
      expect(content, isA<DashboardBuildContent>());
    });
  });

  group('DashboardBuildContent', () {
    testWidgets('renders DashboardGreeting and NotebookList widgets',
        (WidgetTester tester) async {
      // Arrange
      final mockData = MockDashboardStateData();
      when(mockData.userName).thenReturn('John');
      when(mockData.notebookDetails).thenReturn([]);
      when(mockData.todayTasksDetails).thenReturn([]);

      final widget = MaterialApp(
        home: Scaffold(
          body: DashboardBuildContent(data: mockData),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.byType(NotebookList), findsOneWidget);
    });

    testWidgets('renders TaskSwipeDismissible widgets for tasks',
        (WidgetTester tester) async {
      // Arrange
      final mockData = MockDashboardStateData();
      when(mockData.userName).thenReturn('John');
      when(mockData.notebookDetails).thenReturn([]);
      when(mockData.todayTasksDetails).thenReturn([
        const DashboardTodayTasksDetails(
            taskId: '1', task: 'Task 1', notebookId: '1'),
        const DashboardTodayTasksDetails(
            taskId: '2', task: 'Task 2', notebookId: '2'),
      ]);

      final widget = MaterialApp(
        home: Scaffold(
          body: DashboardBuildContent(data: mockData),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.byType(TaskSwipeDismissible), findsNWidgets(2));
    });
  });
}
