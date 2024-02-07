// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206162322
// 06/02/2024 16:23
import 'package:isar/isar.dart';

part 'user.g.dart';

/// Represents a user in the application.
///
/// This class is used for storing user information in the Isar database.
/// Each user has a unique identifier and a username.
@collection
class User {
  /// The unique identifier of the user.
  ///
  /// This identifier is automatically incremented in the database.
  /// It's used to uniquely identify each user in the collection.
  Id userId = Isar.autoIncrement;

  /// The username of the user.
  ///
  /// This is an indexed property, meaning searches for the username are optimized.
  /// The username can be used for user authentication or displaying user information.
  @Index()
  String? username;
}
