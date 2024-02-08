// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240208063719
// 08/02/2024 06:37
import 'package:adhd_prototype/features/notebook/presentation/blocs/notebook_state.dart';
import 'package:adhd_prototype/shared/ui/ui_constants.dart';
import 'package:flutter/material.dart';

import '../../../../shared/ui/content_builder.dart';

class NotebookContentBuilder extends ContentBuilder<NotebookStateData> {
  NotebookContentBuilder({required this.currentPageIndex});

  final int currentPageIndex;

  @override
  Widget build({required data}) => NotebookContent(
        data: data,
        currentPageIndex: currentPageIndex,
      );
}

class NotebookContent extends StatelessWidget {
  const NotebookContent(
      {super.key, required this.data, required this.currentPageIndex});

  final NotebookStateData data;

  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return [
      Container(),
      SizedBox(
          height: MediaQuery.of(context).size.height -
              UIConstants.appbarDefaultHeight -
              UIConstants.navigationBarDefaultHeight,
          child: Scaffold()),
      Container(),
    ][currentPageIndex];
  }
}
