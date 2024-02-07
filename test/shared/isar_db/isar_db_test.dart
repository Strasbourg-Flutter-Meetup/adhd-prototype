// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207112102
// 07/02/2024 11:21
import 'dart:io';
import 'package:adhd_prototype/shared/isar_db/isar_db.dart';
import 'package:bdd_framework/bdd_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late IsarDB isarDB;
  late Directory tempDir;

  setUpAll(() async {
    // Perform global setup actions before any tests run
    await Isar.initializeIsarCore(download: true);
    tempDir = Directory.systemTemp.createTempSync();
  });

  setUp(() async {
    // Setup for each test
    isarDB = IsarDB.instance;
  });

  tearDown(() async {
    // Cleanup after each test
    await isarDB.isar?.close();
    isarDB.isar = null; // Assuming IsarDB allows setting isar to null for cleanup
  });

  tearDownAll(() async {
    // Perform global cleanup actions after all tests have run
    tempDir.deleteSync(recursive: true);
  });

  var feature = BddFeature('Isar Database Initialization');

  Bdd(feature)
      .scenario('Initializing Isar Database Successfully')
      .given('I have the necessary schemas and a valid directory')
      .when('I initialize the Isar database')
      .then('the Isar instance should be properly initialized and not null')
      .run((ctx) async {
    // Given: I have the necessary schemas and a valid directory
    // This is handled by the setup above

    // When: I initialize the Isar database
    await isarDB.init(path: tempDir.path);

    // Then: the Isar instance should be properly initialized and not null
    expect(isarDB.isar, isNotNull, reason: 'The Isar database instance should not be null after initialization.');
  });
}
