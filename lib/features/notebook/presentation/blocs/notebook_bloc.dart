// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240208062233
// 08/02/2024 06:22
import 'dart:async';

import 'package:adhd_prototype/features/notebook/presentation/blocs/notebook_events.dart';
import 'package:adhd_prototype/features/notebook/presentation/blocs/notebook_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotebookBloc extends Bloc<NotebookEvent, NotebookState> {
  NotebookBloc(super.initialState) {
    on<NotebookInitial>(_onNotebookInitial);
  }

  NotebookStateData? _stateData;

  FutureOr<void> _onNotebookInitial(
      NotebookInitial event, Emitter<NotebookState> emit) {
    _updateStateData();
    emit(NotebookState.initialized(data: _stateData));
  }

  void _updateStateData() {
    _stateData = const NotebookStateData();
  }
}
