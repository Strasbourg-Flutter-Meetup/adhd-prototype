// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206211404
// 06/02/2024 21:14
import 'package:adhd_prototype/shared/isar_db/models/current_day_task.dart';
import 'package:isar/isar.dart';

import '../isar_db.dart';
import '../models/task.dart';
import 'i_repository.dart';

/// The [CurrentDayTaskRepository] class is responsible for handling CRUD operations
/// for [CurrentDayTask] objects in the database.
class CurrentDayTaskRepository implements IRepository<CurrentDayTask> {
  /// The Isar database instance.
  final IsarDB isarDB;

  /// Constructs a [CurrentDayTaskRepository] with the specified Isar database instance.
  CurrentDayTaskRepository({required this.isarDB});

  @override
  Future<Id?> create(CurrentDayTask currentDayTask) async {
    return isarDB.isar?.writeTxn(() async {
      return isarDB.isar?.currentDayTasks.put(currentDayTask);
    });
  }

  @override
  Future<CurrentDayTask?> getById(Id currentDayTaskId) async {
    return isarDB.isar?.currentDayTasks.get(currentDayTaskId);
  }

  @override
  Future<void> update(CurrentDayTask currentDayTask) async {
    await isarDB.isar?.writeTxn(() async {
      await isarDB.isar?.currentDayTasks.put(currentDayTask);
    });
  }

  @override
  Future<void> delete(Id id) async {
    await isarDB.isar?.writeTxn(() async {
      await isarDB.isar?.currentDayTasks.delete(id);
    });
  }

  @override
  Future<List<CurrentDayTask>?> getAll() async {
    return isarDB.isar?.currentDayTasks.where().findAll();
  }

  /// Loads all current day tasks along with their associated tasks from the database.
  Future<List<Task>> loadCurrentDayTasksAndRelatedData() async {
    List<CurrentDayTask> currentDayTasks = [];
    List<Task> tasks = [];

    await isarDB.isar?.writeTxn(() async {
      // Get all current day tasks
      currentDayTasks =
          await isarDB.isar?.currentDayTasks.where().findAll() ?? [];

      // For each current day task, get the associated task by ID
      for (var currentDayTask in currentDayTasks) {
        var task = await isarDB.isar?.tasks.get(currentDayTask.taskId ?? -1);
        if (task != null) {
          task.rank = currentDayTask.rank;
          tasks.add(task);
        }
      }
    });

    return tasks;
  }
}
