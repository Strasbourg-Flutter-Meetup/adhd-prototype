// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206111738
// 06/02/2024 11:17
import 'package:flutter/material.dart';

/// A custom section for the dashboard screen that displays text and icon buttons.
///
/// The [DashboardSection] widget is used to create sections in the dashboard
/// screen that consist of a title [text] and a list of [iconButtons] that
/// can be placed on the right side of the title.
class DashboardSection extends StatelessWidget {
  /// Creates a [DashboardSection] with the specified [text] and [iconButtons].
  ///
  /// The [text] is the title or heading of the section, and [iconButtons] is
  /// a list of icon buttons that can be displayed to the right of the title.
  const DashboardSection({
    super.key,
    required this.text,
    required this.iconButtons,
  });

  /// The title or heading text of the section.
  final String text;

  /// The list of icon buttons to be displayed to the right of the title.
  final List<IconButton> iconButtons;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ...iconButtons,
          ],
        ),
      );
}
