// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206202706
// 06/02/2024 20:27
import 'package:isar/isar.dart';

import '../ranking/rankable_item.dart';

part 'current_day_task.g.dart';

/// The [CurrentDayTask] class represents a task scheduled for the current day.
/// It implements the [RankableItem] interface.
@collection
class CurrentDayTask implements RankableItem {
  /// The unique identifier for the current day task.
  Id? currentDayTaskId = Isar.autoIncrement;

  /// The ID of the task.
  int? taskId;

  /// The rank of the current day task.
  @override
  String? rank;
}