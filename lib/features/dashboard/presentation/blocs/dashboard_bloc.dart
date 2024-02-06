import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_events.dart';
import 'package:adhd_prototype/features/dashboard/presentation/blocs/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/dashboard_filter_details.dart';
import '../../models/dashboard_notebook_details.dart';
import '../../models/dashboard_today_tasks_details.dart';

/// The [DashboardBloc] class is responsible for managing the state and logic
/// of the dashboard feature in your application.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(super.initialState) {
    on<DashboardInitialize>(_onInitialize);
  }

  DashboardStateData? _stateData;

  String _userName = '';

  List<DashboardNotebookDetails> _notebookDetails = [];

  List<DashboardTodayTasksDetails> _todayTasksDetails = [];

  List<DashboardFilterDetails> _filterDetails = [];

  /// This method is called when the [DashboardInitialize] event is dispatched
  /// to initialize the dashboard state.
  ///
  /// It sets some initial data for the dashboard, such as the username,
  /// notebook details, and today's tasks details.
  Future<void> _onInitialize(
      DashboardInitialize event, Emitter<DashboardState> emit) async {
    _userName = 'Daniel';
    _notebookDetails = [
      const DashboardNotebookDetails(
        notebookId: 'notebookId1',
        notebookName: 'Private',
        progress: 0.8,
        openTasks: 1,
      ),
      const DashboardNotebookDetails(
        notebookId: 'notebookId2',
        notebookName: 'Job',
        progress: 0.3,
        openTasks: 5,
      ),
      const DashboardNotebookDetails(
        notebookId: 'notebookId3',
        notebookName: 'Strasbourg Flutter Meetup Group',
        progress: 0.4,
        openTasks: 3,
      )
    ];
    _todayTasksDetails = [
      const DashboardTodayTasksDetails(
        taskId: '1',
        task: 'task 1',
        notebookId: 'notebook name 1',
      ),
      const DashboardTodayTasksDetails(
        taskId: '2',
        task: 'task 2',
        notebookId: 'notebook name 2',
      ),
      const DashboardTodayTasksDetails(
        taskId: '3',
        task: 'task 3',
        notebookId: 'notebook name 3',
      ),
    ];
    _filterDetails = [];
    _updateStateData();
    emit(DashboardState.initialized(data: _stateData));
  }

  /// This private method updates the [_stateData] with the current values
  /// of username, notebook details, today's tasks details, and filter details.
  void _updateStateData() {
    _stateData = DashboardStateData(
      userName: _userName,
      notebookDetails: _notebookDetails,
      todayTasksDetails: _todayTasksDetails,
      filterDetails: _filterDetails,
    );
  }
}
