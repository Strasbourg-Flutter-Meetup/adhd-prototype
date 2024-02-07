// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206201645
// 06/02/2024 20:16
import 'package:isar/isar.dart';

import '../ranking/rankable_item.dart';

part 'task.g.dart';

/// The [Task] class represents a task entity.
/// It implements the [RankableItem] interface.
@collection
class Task implements RankableItem {
  /// The unique identifier for the task.
  Id taskId = Isar.autoIncrement;

  /// The description or name of the task.
  String? task;

  /// The identifier of the notebook to which the task belongs.
  int? notebookId;

  /// The rank of the task.
  @override
  String? rank;
}
