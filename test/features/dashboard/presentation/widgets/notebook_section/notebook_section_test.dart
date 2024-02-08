// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206131209
// 06/02/2024 13:12
import 'package:adhd_prototype/features/dashboard/presentation/widgets/notebook_section/notebook_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NotebookSection widget displays title and "Add" button',
          (WidgetTester tester) async {
        // Build the NotebookSection widget
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: NotebookSection(notebooks: [],),
            ),
          ),
        );

        // Assert
        final titleTextFinder = find.text('NOTEBOOKS');
        expect(titleTextFinder, findsOneWidget);
        // Check if the title text is displayed correctly

        final addButtonIconFinder = find.byIcon(Icons.add);
        expect(addButtonIconFinder, findsOneWidget);
        // Check if the "Add" button icon is displayed
      });
}
