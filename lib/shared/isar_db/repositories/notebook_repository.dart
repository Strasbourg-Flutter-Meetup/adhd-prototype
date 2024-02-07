// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206201146
// 06/02/2024 20:11
import 'package:adhd_prototype/shared/isar_db/models/notebook.dart';
import 'package:isar/isar.dart';

import '../isar_db.dart';
import 'i_repository.dart';

/// The [NotebookRepository] class provides methods to perform CRUD operations
/// on [Notebook] objects in the database.
class NotebookRepository implements IRepository<Notebook> {
  final IsarDB isarDB;

  /// Constructs a [NotebookRepository] with the specified [isarDB].
  NotebookRepository({required this.isarDB});

  @override
  Future<Id?> create(Notebook notebook) async {
    return isarDB.isar?.writeTxn(() async {
      return isarDB.isar?.notebooks.put(notebook);
    });
  }

  @override
  Future<Notebook?> getById(Id notebookId) async {
    return isarDB.isar?.notebooks.get(notebookId);
  }

  @override
  Future<void> update(Notebook notebook) async {
    await isarDB.isar?.writeTxn(() async {
      await isarDB.isar?.notebooks.put(notebook);
    });
  }

  @override
  Future<void> delete(Id id) async {
    await isarDB.isar?.writeTxn(() async {
      await isarDB.isar?.notebooks.delete(id);
    });
  }

  @override
  Future<List<Notebook>?> getAll() async {
    return isarDB.isar?.notebooks.where().findAll();
  }
}
