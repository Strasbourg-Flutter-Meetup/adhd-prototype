// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207133735
// 07/02/2024 13:37
import 'package:equatable/equatable.dart';

import '../../../../shared/state_management/states.dart';

class AddNotebookModalStateData extends Equatable {
  const AddNotebookModalStateData();

  @override
  List<Object?> get props => [];
}

/// The [AddNotebookModalState] type represents the state of the dashboard feature
/// in your application. It is defined as a type alias for [StateTemplate]
/// with [AddNotebookModalStateData] as the generic type.
typedef AddNotebookModalState = StateTemplate<AddNotebookModalStateData>;
