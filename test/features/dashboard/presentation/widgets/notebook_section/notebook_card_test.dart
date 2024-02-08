// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206113128
// 06/02/2024 11:31
import 'package:adhd_prototype/features/dashboard/presentation/widgets/notebook_section/notebook_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotebookCard widget tests', () {
    // Positive Test Case
    testWidgets('Positive case: NotebookCard displays notebook details',
        (WidgetTester tester) async {
      // Arrange
      const String notebookName = 'Test Notebook';
      const double progress = 0.75;
      const int openTasks = 5;

      // Build the NotebookCard widget
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: NotebookCard(
              notebookName: notebookName,
              progress: progress,
              openTasks: openTasks,
              notebookId: 1,
            ),
          ),
        ),
      );

      // Act

      // Assert
      expect(find.text(notebookName),
          findsOneWidget); // Check if notebook name is displayed
      expect(find.byType(Tooltip),
          findsOneWidget); // Check if Tooltip is displayed
    });

    // Negative Test Case
    testWidgets('Negative case: NotebookCard with empty name',
        (WidgetTester tester) async {
      // Arrange
      const String notebookName = ''; // Empty notebook name
      const double progress = 0.5;
      const int openTasks = 2;

      // Build the NotebookCard widget
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: NotebookCard(
              notebookName: notebookName,
              progress: progress,
              openTasks: openTasks,
              notebookId: 1,
            ),
          ),
        ),
      );

      // Act

      // Assert
      expect(find.text(notebookName),
          findsOneWidget); // Check if empty notebook name is displayed
      expect(find.byType(Tooltip),
          findsOneWidget); // Check if Tooltip is displayed
    });
  });
}
