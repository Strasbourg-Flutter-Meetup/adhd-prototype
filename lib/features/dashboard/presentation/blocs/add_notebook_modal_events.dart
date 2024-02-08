// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240207133851
// 07/02/2024 13:38
import '../../../../shared/isar_db/models/notebook.dart';

abstract class AddNotebookModalEvent {}

class AddNotebookModalInitial extends AddNotebookModalEvent {
  final List<Notebook> notebooks;

  AddNotebookModalInitial({required this.notebooks});
}

class AddNotebook extends AddNotebookModalEvent {
  final String notebookName;

  AddNotebook({required this.notebookName});
}
