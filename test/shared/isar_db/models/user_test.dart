// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207122001
// 07/02/2024 12:20
import 'package:adhd_prototype/shared/isar_db/models/user.dart';
import 'package:bdd_framework/bdd_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  var feature = BddFeature('User Entity Username Attribute Validation');

  Bdd(feature)
      .scenario('Validating the username attribute of a User entity')
      .given('I have a username "testUser"')
      .when('I create a User instance with the given username')
      .then('The User instance should have the username "testUser"')
      .run((ctx) async {
    // Given
    String expectedUsername = "testUser";

    // When
    User user = User()..username = expectedUsername;

    // Then
    expect(user.username, equals(expectedUsername),
        reason: 'User instance should have the expected username');
  });
}
