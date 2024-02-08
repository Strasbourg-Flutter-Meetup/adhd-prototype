// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240208062038
// 08/02/2024 06:20
import 'package:equatable/equatable.dart';

import '../../../../shared/state_management/states.dart';

class NotebookStateData extends Equatable {
  const NotebookStateData();

  @override
  List<Object?> get props => [];
}

/// The [NotebookState] type represents the state of the dashboard feature
/// in your application. It is defined as a type alias for [StateTemplate]
/// with [NotebookStateData] as the generic type.
typedef NotebookState = StateTemplate<NotebookStateData>;
