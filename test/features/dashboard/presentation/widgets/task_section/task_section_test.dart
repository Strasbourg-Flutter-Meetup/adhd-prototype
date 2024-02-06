// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206132944
// 06/02/2024 13:29
import 'package:adhd_prototype/features/dashboard/presentation/widgets/task_section/task_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TasksSection displays correctly', (WidgetTester tester) async {
    // Build the widget with a MaterialApp and a test localization delegate
    await tester.pumpWidget(
      const MaterialApp(
        home: TasksSection(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );

    // Verify the presence of the title text and icons
    expect(find.text('TODAY\'S TASKS'), findsOneWidget);
    expect(find.byIcon(Icons.reorder), findsOneWidget);
    expect(find.byIcon(Icons.filter_list_outlined), findsOneWidget);
  });
}
