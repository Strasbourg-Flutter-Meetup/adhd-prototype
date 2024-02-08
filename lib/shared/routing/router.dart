// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202110720
// 02/02/2024 11:07

import 'go_router_config.dart';
import 'go_router_path.dart';

void routeToNotebook({required int notebookId}) {
  goRouterConfiguration.goNamed(pathToNotebook, pathParameters: {
    'id': notebookId.toString(),
  });
}
