// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206140354
// 06/02/2024 14:03
import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_bloc.dart';
import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_state.dart';
import 'package:adhd_prototype/features/dashboard/presentation/screens/dashboard.dart';
import 'package:adhd_prototype/shared/dependency_injection/injections.dart';
import 'package:adhd_prototype/shared/dependency_injection/injections/injection_cubits.dart';
import 'package:adhd_prototype/shared/isar_db/isar_db.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/current_day_task_repository.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/notebook_repository.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Dashboard widget displays correctly',
      (WidgetTester tester) async {
    configureGetItInjections(
      injectionConfigurations: [
        InjectionCubits(),
      ],
    );

    // Create a DashboardBloc and initialize it with a specific state (if needed)
    final dashboardBloc = DashboardBloc(
      const DashboardState.initial(),
      userRepository: UserRepository(
        isarDB: IsarDB.instance,
      ),
      notebookRepository: NotebookRepository(
        isarDB: IsarDB.instance,
      ),
      currentDayTaskRepository: CurrentDayTaskRepository(
        isarDB: IsarDB.instance,
      ),
    ); // You may need to customize this.

    // Wrap the Dashboard widget with a MaterialApp and a BlocProvider
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: dashboardBloc,
          child: const Dashboard(),
        ),
      ),
    );

    // Verify that the Dashboard widget is rendered
    expect(find.byType(Dashboard), findsOneWidget);

    // You can further add more tests to verify specific elements or interactions.
    // For example, testing if a specific widget is displayed based on the state.
    // You may also simulate user interactions and test their effects.

    // Clean up after testing
    dashboardBloc.close();
  });
}
