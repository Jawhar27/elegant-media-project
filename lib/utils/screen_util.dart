import 'package:flutter/material.dart';

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getCalaculatedHeight(BuildContext context, double percentage) {
  // IF DESIGN AVAILABLE
  // double designScreenHeight = 896;
  double height = getScreenHeight(context) * percentage;
  return height;
}

class CustomPadding {
  static const defaultPadding = 12.0;
}
