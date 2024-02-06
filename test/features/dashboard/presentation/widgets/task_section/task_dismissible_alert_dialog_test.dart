// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206132611
// 06/02/2024 13:26
import 'package:adhd_prototype/features/dashboard/presentation/widgets/task_section/task_dismissible_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Task Dismissible AlertDialog displays correctly',
      (WidgetTester tester) async {
    // Build the widget with a MaterialApp and a test localization delegate
    await tester.pumpWidget(
      const MaterialApp(
        home: TaskDismissibleAlertDialog(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );

    await tester.pump();

    // Verify the AlertDialog's title and content text
    expect(find.text('Confirm'), findsOneWidget); // Check for title text
    expect(find.text('Are you sure you want to delete this task?'),
        findsOneWidget); // Check for content text

    // Verify the presence of Cancel and Delete buttons
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget);

    // Tap the Cancel button
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    // Verify that the dialog is dismissed
    expect(find.byType(TaskDismissibleAlertDialog), findsNothing);
  });
}
