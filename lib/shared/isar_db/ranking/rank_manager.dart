// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240206205822
// 06/02/2024 20:58

import 'package:adhd_prototype/shared/isar_db/ranking/rankable_item.dart';

/// The [RankManager] class manages the ranking of items.
class RankManager {
  /// The list of items to be ranked.
  List<RankableItem> items = [];

  /// Add a new notebook at the end with the next available rank.
  ///
  /// If the list is not empty, the new notebook is assigned a rank
  /// lexicographically after the last item's rank; otherwise, it is
  /// assigned rank 'A'.
  ///
  /// - [item]: The notebook item to add.
  void addNotebook(RankableItem item) {
    String? lastRank = items.isNotEmpty ? items.last.rank : 'A';
    String newRank = _incrementRank(lastRank ?? '');
    item.rank = newRank;
    items.add(item);
  }

  /// Insert an item between two existing ranks.
  ///
  /// If [position] is less than 0 or greater than the length of the list,
  /// no action is taken.
  ///
  /// - [item]: The item to insert.
  /// - [position]: The position at which to insert the item.
  void insertItem(RankableItem item, int position) {
    if (position < 0 || position > items.length) {
      // todo(daniel): thrown an exception
      return;
    }

    String? prevRank = position == 0 ? 'A' : items[position - 1].rank;
    String? nextRank = position == items.length
        ? _incrementRank(items[position - 1].rank ?? '')
        : items[position].rank;
    String newRank = _findMiddleRank(prevRank ?? '', nextRank ?? '');

    item.rank = newRank;
    items.insert(position, item);
  }

  /// Generate a rank that is lexicographically after the given rank.
  ///
  /// The new rank is calculated by incrementing the last character of
  /// the given rank, and extending the rank if it consists entirely
  /// of 'Z's.
  ///
  /// - [rank]: The rank to increment.
  String _incrementRank(String rank) {
    var newRank = StringBuffer();
    for (int i = rank.length - 1; i >= 0; i--) {
      if (rank[i] != 'Z') {
        newRank.writeCharCode(rank.codeUnitAt(i) + 1);
        newRank.write(rank.substring(i + 1));
        return rank.substring(0, i) + newRank.toString();
      }
    }
    return '${rank}A'; // Extend the rank if it's all Z's
  }

  /// Find a rank between two given ranks.
  ///
  /// The middle rank is calculated by taking the average of the
  /// corresponding character codes of the two ranks.
  ///
  /// - [prevRank]: The rank before the desired rank.
  /// - [nextRank]: The rank after the desired rank.
  String _findMiddleRank(String prevRank, String nextRank) {
    for (int i = 0; i < prevRank.length; i++) {
      if (prevRank.codeUnitAt(i) != nextRank.codeUnitAt(i)) {
        int middleCharCode =
            (prevRank.codeUnitAt(i) + nextRank.codeUnitAt(i)) ~/ 2;
        return prevRank.substring(0, i) +
            String.fromCharCode(middleCharCode) +
            prevRank.substring(i + 1);
      }
    }
    return nextRank; // Handle edge case
  }
}
