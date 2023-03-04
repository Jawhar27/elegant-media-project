import 'package:elegant_media_project/routes.dart';
import 'package:flutter/material.dart';

void popScreen(BuildContext context) {
  Navigator.of(context).pop();
}

void popUntilHome(BuildContext context) {
  Navigator.popUntil(context, ModalRoute.withName(ScreenRoutes.toHomeScreen));
}

void popUntilSignIn(BuildContext context) {
  Navigator.popUntil(context, ModalRoute.withName(ScreenRoutes.toSignInScreen));
}

Future pushScreen(BuildContext context, String routeName,
    {Object? arguments}) async {
  return await Navigator.of(context).pushNamed(
    routeName,
    arguments: arguments,
  );
}

Future moveToScreen(BuildContext context, String routeName,
    {Object? arguments}) async {
  return await Navigator.of(context).pushNamedAndRemoveUntil(
    routeName,
    arguments: arguments,
    (route) => false,
  );
}
