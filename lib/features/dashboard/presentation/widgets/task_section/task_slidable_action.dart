// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206104224
// 06/02/2024 10:42

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// The [TaskSlidableAction] widget is a reusable custom action widget designed
/// for use within Slidable actions. It provides a customizable tooltip message,
/// background color, and an action child to be displayed within the Slidable.
class TaskSlidableAction extends StatelessWidget {
  /// Constructs a [TaskSlidableAction] widget with the specified properties.
  const TaskSlidableAction({super.key,
    required this.toolTipMessage,
    required this.child,
    required this.backgroundColor,
    required this.onPressed,
  });

  /// The tooltip message to be displayed when the action is long-pressed.
  final String toolTipMessage;

  /// The child widget representing the action.
  final Widget child;

  /// The background color of the action.
  final Color backgroundColor;

  /// The callback function to be executed when the action is pressed.
  final Function(BuildContext) onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomSlidableAction(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 6,
        child: Tooltip(
          height: 40.0,
          message: toolTipMessage,
          child: child,
        ),
      ),
    );
  }
}
