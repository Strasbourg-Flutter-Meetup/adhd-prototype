// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206192258
// 06/02/2024 19:22
import 'package:isar/isar.dart';

/// The [IRepository] interface defines the contract for performing CRUD operations
/// on objects of type [T].
abstract class IRepository<T> {
  /// Creates a new object of type [T] in the database.
  Future<Id?> create(T item);

  /// Retrieves an object of type [T] from the database by its identifier.
  Future<T?> getById(Id id);

  /// Updates an existing object of type [T] in the database.
  Future<void> update(T item);

  /// Deletes an object of type [T] from the database by its identifier.
  Future<void> delete(Id id);

  /// Retrieves all objects of type [T] from the database.
  Future<List<T>?> getAll();
}
