// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206130556
// 06/02/2024 13:05
import 'package:adhd_prototype/features/dashboard/presentation/widgets/notebook_section/notebook_card_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NotebookCardProgress widget displays progress correctly',
          (WidgetTester tester) async {
        // Arrange
        const double progress = 0.75;

        // Build the NotebookCardProgress widget
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: NotebookCardProgress(progress: progress),
            ),
          ),
        );

        // Act

        // Assert
        final linearProgressIndicator = find.byType(LinearProgressIndicator);
        expect(linearProgressIndicator, findsOneWidget); // Check if LinearProgressIndicator is displayed
        final progressWidget = tester.widget<LinearProgressIndicator>(linearProgressIndicator);
        expect(progressWidget.value, progress); // Check if progress value is as expected
      });
}
