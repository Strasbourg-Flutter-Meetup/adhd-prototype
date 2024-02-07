// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206144634
// 06/02/2024 14:46
import 'package:isar/isar.dart';

import '../isar_db.dart';
import '../models/user.dart';
import 'i_repository.dart';

/// The [UserRepository] class provides methods to perform CRUD operations
/// on [User] objects in the database.
class UserRepository implements IRepository<User> {
  final IsarDB isarDB;

  /// Constructs a [UserRepository] with the specified [isarDB].
  UserRepository({required this.isarDB});

  /// Creates a new user in the database.
  ///
  /// If a user with the same username already exists, the method returns null.
  /// Otherwise, it adds the user to the database and returns their unique identifier.
  @override
  Future<Id?> create(User user) async {
    return isarDB.isar?.writeTxn(() async {
      // Check if the user already exists based on a unique attribute, e.g., username
      final existingUser = await isarDB.isar?.users
          .where()
          .usernameEqualTo(user.username)
          .findFirst();

      // If the user doesn't exist, add them to the database
      if (existingUser == null) {
        return isarDB.isar?.users.put(user);
      } else {
        // User already exists, handle accordingly (e.g., return null or throw an exception)
        return null;
      }
    });
  }

  @override
  Future<User?> getById(Id userId) async {
    return isarDB.isar?.users.get(userId);
  }

  @override
  Future<void> update(User user) async {
    await isarDB.isar?.writeTxn(() async {
      await isarDB.isar?.users.put(user);
    });
  }

  @override
  Future<void> delete(Id id) async {
    await isarDB.isar?.writeTxn(() async {
      await isarDB.isar?.users.delete(id);
    });
  }

  @override
  Future<List<User>?> getAll() async {
    return isarDB.isar?.users.where().findAll();
  }
}
