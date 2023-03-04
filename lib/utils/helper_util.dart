import 'dart:developer';

import 'package:elegant_media_project/parameters.dart';

void printLogs(message) {
  if (isDev) {
    log(message.toString());
  }
}
