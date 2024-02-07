// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206162630
// 06/02/2024 16:26
import 'package:adhd_prototype/shared/isar_db/models/current_day_task.dart';
import 'package:adhd_prototype/shared/isar_db/models/task.dart';
import 'package:isar/isar.dart';

import 'models/notebook.dart';
import 'models/user.dart';
/// The [IsarDB] class provides access to the Isar database instance.
class IsarDB {
  /// Private constructor to prevent instantiation from outside the class.
  IsarDB._internal();

  /// Singleton instance of the [IsarDB].
  static final IsarDB instance = IsarDB._internal();

  /// Isar database instance.
  Isar? isar;

  /// Initializes the Isar database by opening it with the specified schemas.
  ///
  /// This method should be called before accessing the Isar database.
  Future<void> init({required String path}) async {
    isar = await Isar.open(
      [
        NotebookSchema,
        UserSchema,
        TaskSchema,
        CurrentDayTaskSchema,
      ],
      directory: path,
    );
  }
}
