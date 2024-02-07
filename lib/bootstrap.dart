// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202095359
// 02/02/2024 09:53
import 'package:adhd_prototype/shared/isar_db/isar_db.dart';
import 'package:adhd_prototype/shared/isar_db/repositories/user_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'shared/dependency_injection/injections.dart';
import 'shared/isar_db/models/user.dart';

/// The [Bootstrap] class represents the process of bootstrapping the application.
/// It initializes necessary dependencies and performs any setup required when
/// the application starts.
abstract class Bootstrap {
  /// Constructs a [Bootstrap] instance with the provided [isarDB].
  const Bootstrap({required this.isarDB});

  /// The instance of [IsarDB] used for database initialization.
  final IsarDB isarDB;

  /// Executes the bootstrap process.
  Future<void> execute();
}

/// The [BootstrapImpl] class provides an implementation of the [Bootstrap] interface.
/// It initializes the Isar database and performs initial setup for the application.
class BootstrapImpl extends Bootstrap {
  /// Constructs a [BootstrapImpl] instance with the provided [isarDB].
  const BootstrapImpl({required super.isarDB});

  @override
  Future<void> execute() async {
    await initIsarDB();
  }

  /// Initializes the Isar database and performs initial setup.
  Future<void> initIsarDB() async {
    final dir = await getApplicationDocumentsDirectory();
    await isarDB.init(path: dir.path);
    final user = User()..username = 'Daniel';
    await getIt.get<UserRepository>().create(user);
  }
}
