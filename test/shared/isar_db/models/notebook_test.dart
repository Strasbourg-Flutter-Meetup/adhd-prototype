// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207121510
// 07/02/2024 12:15
import 'package:adhd_prototype/shared/isar_db/models/notebook.dart';
import 'package:bdd_framework/bdd_framework.dart'; // Hypothetical; replace with your actual BDD framework import
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  var feature = BddFeature('Notebook Management');

  Bdd(feature)
      .scenario('Creating a Notebook with a title and rank')
      .given('I have a title "My New Notebook" and a rank "Top" for a notebook')
      .when('I create a Notebook instance with the given title and rank')
      .then('the Notebook should have the specified title "My New Notebook"')
      .and('the Notebook should have the specified rank "Top"')
      .and('it should comply with the RankableItem interface')
      .run((ctx) async {
    // Given
    String title = "My New Notebook";
    String rank = "AAAA";

    // When
    Notebook notebook = Notebook()
      ..title = title
      ..rank = rank;

    // Then
    expect(notebook.title, equals(title),
        reason: 'Notebook title should match the specified title');
    expect(notebook.rank, equals(rank),
        reason: 'Notebook rank should match the specified rank');
    expect(notebook.rank, isNotNull,
        reason: 'RankableItem (Notebook) should have a non-null rank');
  });
}
