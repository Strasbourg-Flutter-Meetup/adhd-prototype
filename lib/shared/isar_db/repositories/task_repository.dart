// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206212138
// 06/02/2024 21:21
import 'package:adhd_prototype/shared/isar_db/models/task.dart';
import 'package:isar/isar.dart';

import '../isar_db.dart';
import 'i_repository.dart';

/// The [TaskRepository] class provides methods to perform CRUD operations
/// on [Task] objects in the database.
class TaskRepository implements IRepository<Task> {
  final IsarDB isarDB;

  /// Constructs a [TaskRepository] with the specified [isarDB].
  TaskRepository({required this.isarDB});

  @override
  Future<Id?> create(Task task) async {
    return isarDB.isar?.writeTxn(() async {
      return isarDB.isar?.tasks.put(task);
    });
  }

  @override
  Future<Task?> getById(Id taskId) async {
    return isarDB.isar?.tasks.get(taskId);
  }

  @override
  Future<void> update(Task task) async {
    await isarDB.isar?.writeTxn(() async {
      await isarDB.isar?.tasks.put(task);
    });
  }

  @override
  Future<void> delete(Id id) async {
    await isarDB.isar?.writeTxn(() async {
      await isarDB.isar?.tasks.delete(id);
    });
  }

  @override
  Future<List<Task>?> getAll() async {
    return isarDB.isar?.tasks.where().findAll();
  }
}
