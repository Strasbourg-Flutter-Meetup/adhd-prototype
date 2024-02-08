import 'dart:async';

import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_events.dart';
import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_state.dart';
import 'package:adhd_prototype/shared/global_event_bus/global_event_bus.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/current_day_task_repository.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/notebook_repository.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/global_event_bus/global_events.dart';
import '../../../../shared/isar_db/models/notebook.dart';
import '../../models/dashboard_filter_details.dart';
import '../../models/dashboard_notebook_details.dart';
import '../../models/dashboard_today_tasks_details.dart';

/// The [DashboardBloc] class is responsible for managing the state and logic
/// of the dashboard feature in your application.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
    super.initialState, {
    required UserRepository userRepository,
    required NotebookRepository notebookRepository,
    required CurrentDayTaskRepository currentDayTaskRepository,
    required GlobalEventBus globalEventBus,
  })  : _userRepository = userRepository,
        _notebookRepository = notebookRepository,
        _currentDayTaskRepository = currentDayTaskRepository,
        _globalEventBus = globalEventBus {
    on<DashboardInitialize>(_onInitialize);
    on<UpdateNotebookList>(_onUpdateNotebookList);
    on<DashboardError>(_onDashboardError);
  }

  final UserRepository _userRepository;
  final NotebookRepository _notebookRepository;

  final CurrentDayTaskRepository _currentDayTaskRepository;

  final GlobalEventBus _globalEventBus;

  DashboardStateData? _stateData;

  String _userName = '';

  List<DashboardNotebookDetails> _notebookDetails = [];

  List<DashboardTodayTasksDetails> _todayTasksDetails = [];

  final List<DashboardFilterDetails> _filterDetails = [];

  List<Notebook>? _notebooks = [];

  StreamSubscription? _globalEventBusSubscription;

  /// This method is called when the [DashboardInitialize] event is dispatched
  /// to initialize the dashboard state.
  ///
  /// It sets some initial data for the dashboard, such as the username,
  /// notebook details, and today's tasks details.
  Future<void> _onInitialize(
      DashboardInitialize event, Emitter<DashboardState> emit) async {
    _globalEventBusListener();
    await _fetchUserData();
    await _fetchNotebookData();
    await _fetchTodayTasksData();
    _updateStateData();
    emit(DashboardState.initialized(data: _stateData));
  }

  Future<void> _onUpdateNotebookList(
      UpdateNotebookList event, Emitter<DashboardState> emit) async {
    emit(DashboardState.loading(previousData: _stateData));
    await _fetchNotebookData();
    _updateStateData();
    emit(DashboardState.loaded(data: _stateData));
  }

  void _onDashboardError(DashboardError event, Emitter<DashboardState> emit) {
    emit(const DashboardState.error());
  }

  void _globalEventBusListener() {
    _globalEventBusSubscription = _globalEventBus.eventBus
        .where((event) => event is UpdateNotebookListOnDashboard)
        .listen((event) async {
      switch (event) {
        case UpdateNotebookListOnDashboard():
          add(UpdateNotebookList());
      }
    });
  }

  Future<void> _fetchUserData() async {
    final results = await _userRepository.getAll();
    _userName = results?.last.username ?? 'Please add a username!';
  }

  Future<void> _fetchNotebookData() async {
    try {
      _notebooks = await _notebookRepository.getAll();
      _notebookDetails = _notebooks
              ?.map(
                (notebook) => DashboardNotebookDetails(
                  notebookId: notebook.notebookId,
                  notebookName: notebook.title ?? '',
                  progress: 0.0,
                  openTasks: 0,
                  rank: notebook.rank ?? '',
                ),
              )
              .toList() ??
          [];
      _notebookDetails.sort((a, b) => a.rank.compareTo(b.rank));
    } catch (e) {
      add(DashboardError());
    }
  }

  Future<void> _fetchTodayTasksData() async {
    final currentDayTasks =
        await _currentDayTaskRepository.loadCurrentDayTasksAndRelatedData();
    _todayTasksDetails = currentDayTasks
        .map(
          (task) => DashboardTodayTasksDetails(
            taskId: task.taskId.toString(),
            task: task.task ?? '',
            notebookId: task.notebookId.toString(),
            rank: task.rank ?? '',
          ),
        )
        .toList();
    _todayTasksDetails.sort((a, b) => a.rank.compareTo(b.rank));
  }

  /// This private method updates the [_stateData] with the current values
  /// of username, notebook details, today's tasks details, and filter details.
  void _updateStateData() {
    _stateData = DashboardStateData(
      userName: _userName,
      notebookDetails: _notebookDetails,
      todayTasksDetails: _todayTasksDetails,
      filterDetails: _filterDetails,
      notebooks: _notebooks ?? [],
    );
  }

  @override
  Future<void> close() {
    _globalEventBusSubscription?.cancel();
    return super.close();
  }
}
