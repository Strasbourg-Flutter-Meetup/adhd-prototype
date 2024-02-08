// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207134040
// 07/02/2024 13:40
import 'dart:async';

import 'package:adhd_prototype/shared/global_event_bus/global_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/global_event_bus/global_event_bus.dart';
import '../../../../shared/isar_db/models/notebook.dart';
import '../../../../shared/isar_db/ranking/rank_manager.dart';
import '../../../../shared/isar_db/repositories/notebook_repository.dart';
import 'add_notebook_modal_events.dart';
import 'add_notebook_modal_state.dart';

class AddNotebookModalBloc
    extends Bloc<AddNotebookModalEvent, AddNotebookModalState> {
  AddNotebookModalBloc(
    super.initialState, {
    required RankManager rankManager,
    required NotebookRepository notebookRepository,
    required GlobalEventBus globalEventBus,
  })  : _rankManager = rankManager,
        _notebookRepository = notebookRepository,
        _globalEventBus = globalEventBus {
    on<AddNotebookModalInitial>(_onAddNotebookModalInitial);
    on<AddNotebook>(_onAddNotebook);
  }

  final RankManager _rankManager;

  final NotebookRepository _notebookRepository;

  final GlobalEventBus _globalEventBus;

  AddNotebookModalStateData? _stateData;

  List<Notebook>? _notebooks;

  FutureOr<void> _onAddNotebookModalInitial(
      AddNotebookModalInitial event, Emitter<AddNotebookModalState> emit) {
    _notebooks = event.notebooks;
    _updateStateData();
    emit(AddNotebookModalState.initialized(data: _stateData));
  }

  FutureOr<void> _onAddNotebook(
      AddNotebook event, Emitter<AddNotebookModalState> emit) async {
    final notebook = Notebook()
      ..title = event.notebookName
      ..rank = '0';

    _rankManager.items = _notebooks ?? <Notebook>[];

    _rankManager.addNotebook(notebook);

    _notebooks = _rankManager.items.cast();

    await _notebookRepository.create(_notebooks?.last ?? notebook);

    _globalEventBus.addEvent(UpdateNotebookListOnDashboard());
  }

  void _updateStateData() {
    _stateData = const AddNotebookModalStateData();
  }
}
