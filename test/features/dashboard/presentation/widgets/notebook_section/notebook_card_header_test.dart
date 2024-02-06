// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206130642
// 06/02/2024 13:06
import 'package:adhd_prototype/features/dashboard/presentation/widgets/notebook_section/notebook_card_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NotebookCardHeader widget displays open tasks correctly',
      (WidgetTester tester) async {
    // Arrange
    const int openTasks = 3;
    const String singularTaskLabel = 'task';
    const String pluralTaskLabel = 'tasks';
    const String openLabel = 'open';

    // Build the NotebookCardHeader widget
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: NotebookCardHeader(openTasks: openTasks),
        ),
      ),
    );

    // Act

    // Assert
    final icon = find.byIcon(Icons.today_rounded);
    expect(icon, findsOneWidget); // Check if Icon is displayed

    final textWidget = find.byType(Text);
    expect(textWidget, findsOneWidget); // Check if Text widget is displayed

    final text = tester.widget<Text>(textWidget);
    expect(text.data,
        '$openTasks ${openTasks == 1 ? singularTaskLabel : pluralTaskLabel} $openLabel');
    // Check if Text widget displays the correct open tasks label
  });
}
