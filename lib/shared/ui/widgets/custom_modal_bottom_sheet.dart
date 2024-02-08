// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207125204
// 07/02/2024 12:52
import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //   color: Theme.of(context).colorScheme.surface,
      // ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: child,
      ),
    );
  }
}
