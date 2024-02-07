// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206143647
// 06/02/2024 14:36
import 'package:isar/isar.dart';

import '../ranking/rankable_item.dart';

part 'notebook.g.dart';

/// The [Notebook] class represents a notebook entity.
/// It implements the [RankableItem] interface.
@collection
class Notebook implements RankableItem {
  /// The unique identifier for the notebook.
  Id notebookId = Isar.autoIncrement;

  /// The title of the notebook.
  String? title;

  /// The rank of the notebook.
  @override
  String? rank;
}
