import 'package:elegant_media_project/providers/app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppState getAppState(BuildContext context) {
  return Provider.of<AppState>(context, listen: false);
}
