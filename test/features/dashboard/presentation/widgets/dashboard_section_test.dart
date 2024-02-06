// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206112859
// 06/02/2024 11:28
import 'package:adhd_prototype/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DashboardSection widget renders correctly',
      (WidgetTester tester) async {
    // Arrange
    const String sectionText = 'Test Section';
    final List<IconButton> iconButtons = [
      IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ),
    ];

    // Build the DashboardSection widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DashboardSection(
            text: sectionText,
            iconButtons: iconButtons,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(sectionText),
        findsOneWidget); // Check if the section text is displayed
    for (final iconButton in iconButtons) {
      expect(find.byWidget(iconButton),
          findsOneWidget); // Check if each icon button is displayed
    }
  });

  testWidgets('DashboardSection widget without icon buttons renders correctly',
      (WidgetTester tester) async {
    // Arrange
    const String sectionText = 'Test Section';

    // Build the DashboardSection widget without icon buttons
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashboardSection(
            text: sectionText,
            iconButtons: [],
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(sectionText),
        findsOneWidget); // Check if the section text is displayed
    expect(find.byType(IconButton),
        findsNothing); // Ensure no icon buttons are displayed
  });
}
