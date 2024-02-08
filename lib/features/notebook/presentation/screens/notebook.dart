// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240208061553
// 08/02/2024 06:15
import 'package:adhd_prototype/features/notebook/presentation/blocs/notebook_bloc.dart';
import 'package:adhd_prototype/features/notebook/presentation/blocs/notebook_events.dart';
import 'package:adhd_prototype/features/notebook/presentation/blocs/notebook_state.dart';
import 'package:adhd_prototype/shared/ui/screen_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/dependency_injection/injections.dart';
import '../../../../shared/ui/mixins/content_builder_mixin.dart';
import '../../../../shared/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';
import '../widgets/notebook_content_builder.dart';

class Notebook extends StatelessWidget {
  const Notebook({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<NotebookBloc>(
        create: (context) => getIt.get<NotebookBloc>()..add(NotebookInitial()),
        child: const _NotebookContent(),
      );
}

class _NotebookContent extends StatefulWidget {
  const _NotebookContent({super.key});

  @override
  State<_NotebookContent> createState() => _NotebookContentState();
}

class _NotebookContentState extends State<_NotebookContent>
    with ContentBuilderMixin<NotebookStateData> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NotebookBloc>().state;

    return ScreenTemplate(
      appBarTemplate: const AppBarTemplate(),
      navigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.today),
              label: 'Today',
            ),
            NavigationDestination(
              icon: Icon(Icons.list),
              label: 'Tasks',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
      child: buildContent(
        state: state,
        contentBuilder:
            NotebookContentBuilder(currentPageIndex: currentPageIndex),
      ),
    );
  }
}
