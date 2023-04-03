import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';

class WorkerIsolate {
  static void autoFetchFeedItem() {
    Workmanager().executeTask((taskName, inputData) async {
      debugPrint("autoFetchFeedItem");
      return Future.value(true);
    });
  }
}
