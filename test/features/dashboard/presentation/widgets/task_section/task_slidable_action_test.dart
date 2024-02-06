// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206133126
// 06/02/2024 13:31
import 'package:adhd_prototype/features/dashboard/presentation/widgets/task_section/task_slidable_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('TaskSlidableAction displays correctly', (WidgetTester tester) async {
    // Define test variables
    const String toolTipMessage = 'Test Tooltip';
    const Color backgroundColor = Colors.blue;
    bool onPressedCalled = false;

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Row(
          children: [
            TaskSlidableAction(
              toolTipMessage: toolTipMessage,
              backgroundColor: backgroundColor,
              onPressed: (context) {
                onPressedCalled = true;
              },
              child: const Icon(Icons.star),
            ),
          ],
        ),
      ),
    );

    await tester.pump();

    // Verify the presence of the tooltip message and child widget
    expect(find.byTooltip(toolTipMessage), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);

    // Tap the widget to trigger onPressed callback
    await tester.tap(find.byTooltip(toolTipMessage));
    await tester.pumpAndSettle();

    // Verify that onPressed callback was called
    expect(onPressedCalled, isTrue);
  });
}
