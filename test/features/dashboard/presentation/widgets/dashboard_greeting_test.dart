// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206105303
// 06/02/2024 10:53

import 'package:adhd_prototype/features/dashboard/presentation/widgets/dashboard_greeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  testWidgets('Positive case: DashboardGreeting displays greeting message',
      (WidgetTester tester) async {
    // Define a fake user name for testing
    const userName = 'John';

    // Build the widget with a MaterialApp and a test localization delegate
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardGreeting(userName: userName),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );

   await tester.pump();

    // Find the Text widget that displays the greeting message
    final greetingTextFinder = find.text('Hello, $userName!');

    // Verify that the greeting message is displayed
    expect(greetingTextFinder, findsOneWidget);
  });

  testWidgets('Negative case: DashboardGreeting displays empty message',
      (WidgetTester tester) async {
    // Define an empty user name for testing
    const userName = '';

    // Build the widget with a MaterialApp and a test localization delegate
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardGreeting(userName: userName),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );

    await tester.pump();

    // Find the Text widget that should display an empty name
    final emptyTextFinder = find.text('Hello, !');

    // Verify that an empty message is displayed
    expect(emptyTextFinder, findsOneWidget);
  });
}
